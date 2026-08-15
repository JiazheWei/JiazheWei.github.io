# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Jiazhe Wei's academic personal homepage — a static site built with Jekyll and served by GitHub Pages at `https://jiazhewei.github.io/` (no CNAME/custom domain). It's a fork of [RayeRen/acad-homepage.github.io](https://github.com/RayeRen/acad-homepage.github.io) ("AcadHomepage"), which itself derives from the Minimal Mistakes Jekyll theme. There's no application code — this is a content/markup/SCSS repo with no test suite.

## Commands

Local preview requires Ruby 3.3+ and Bundler (see `Gemfile`):

```bash
bundle install               # first-time setup / after Gemfile changes
bash run_server.sh           # bundle exec jekyll serve --livereload -> http://localhost:4000
bundle exec jekyll build     # one-off build into _site/, no server
bundle exec jekyll clean     # remove _site/ and .jekyll-cache/
```

There is no lint or test command configured. Verify changes by running the livereload server and checking the page in a browser.

**Local preview and the production build are intentionally decoupled.** `Gemfile` pins a plain `jekyll ~> 4.3` plus `jekyll-sass-converter ~> 2.0` (libsass — the theme's older SCSS syntax errors under the stricter Dart Sass used by converter 3.x) purely so local preview works. GitHub Pages builds the live site with its own environment; there's no `.github/workflows` deploy pipeline in this repo, so the plugin/Jekyll versions GitHub actually builds with can differ from `Gemfile.lock`.

## Content architecture

All page content lives under `_pages/`:

- `_pages/about.md` is the site's only real page (`permalink: /`, also aliased from `/about/`). It holds no prose itself — it assembles fragments from `_pages/includes/*.md` via `{% include_relative %}`, in order: `intro` → `news` → `pub` → `experience` → `honors` → `education` → `talks`.
- To edit a section (add a paper, news item, internship, award, talk...), edit the matching file under `_pages/includes/`, not `about.md` or a layout.
- `_pages/includes/experience.md` also contains the "My Projects" and "Gallery" sections (currently empty `.app-cards` placeholders) despite its filename.

**Nav anchors are derived from heading text, not manually assigned.** `_data/navigation.yml` links to anchors like `#-about-me` and `#-research--intern-experience`. These come from kramdown's `auto_ids` (`_config.yml`), generated from each section's `# <i class="fas fa-...">​</i> Section Title` heading — the leading `-` comes from the space between the (textless) icon tag and the title. Reword a section's h1 or drop its icon markup and its generated ID changes, silently breaking the matching link in `navigation.yml` (no build error).

## Layout / include chain

`_layouts/default.html` is the only layout. It assembles, in order: `head.html` (SEO via `seo.html`, viewport meta, the `assets/css/main.css` link — a relative path, since `_config.yml` sets no `url`/`baseurl`) → `head/custom.html` (Google Fonts preload for Space Grotesk, favicons, a MathJax loader deferred until `window.load` so it never blocks first paint) → `browser-upgrade.html` → `masthead.html` (renders `site.data.navigation.main`) → `sidebar.html` (→ `author-profile.html`, populated from `site.author` in `_config.yml`) → page content → `scripts.html` (loads `main.min.js` then `custom-scripts.js` — order matters, see below).

## Styling

- `_sass/_config.scss` is the single place to tune font sizes/weights/spacing (nav, sidebar, body copy, h1s, badges, app cards). Change values there rather than hunting through `main.scss`.
- The rest of `_sass/*.scss` is the largely-stock Minimal Mistakes theme plus vendored `breakpoint`/`susy`/`font-awesome`/`magnific-popup` — treat as upstream, low-churn.
- `assets/css/main.scss` imports all of the above, then — below the imports — defines the site's actual design system in the same file: CSS custom properties on `:root` (a single fixed "Cool Blue" palette; the theme's multi-scheme/dark-mode switcher has been removed, so don't assume a theme-toggle path exists), the paper-box/badge/venue-card publication styling, the `.seg-control` segmented control shared by the publication filter and the news show-more toggle, the `.app-cards`/`.app-card` grid, and a "Design Overrides" section at the bottom that reskins the stock theme (fonts, background, masthead, nav, sidebar). Visual-design changes almost always belong in that bottom section, not in the imported partials.
- The page layout uses the theme's Susy float-based grid, which is why the sidebar can't reliably use CSS `position: sticky` — it's pinned via JS instead (see below).

## JavaScript

Two scripts, loaded in this order (`_includes/scripts.html`):

1. `assets/js/main.min.js` — vendored, minified theme bundle (jQuery, the greedy-nav responsive menu, Stickyfill, Magnific Popup, smooth-scroll). Treat as a vendor blob; don't hand-edit.
2. `assets/js/custom-scripts.js` — all site-specific behavior, plain JS with no jQuery dependency. It actively overrides `main.min.js`'s defaults rather than just complementing them:
   - Removes `Stickyfill` from the sidebar and reimplements pinning manually (`pin()`/`unpin()`, toggled at a 925px breakpoint) because CSS sticky positioning isn't reliable under the Susy float grid.
   - Adds its own scroll-spy nav highlighting, and intercepts nav-link clicks in the capture phase (`stopImmediatePropagation`) to pre-empt the theme's bubble-phase jQuery smooth-scroll handler for the "About Me" link specifically, forcing scroll-to-top instead of scroll-to-anchor.
   - Drives the segmented-control indicator (publication filter, news toggle) and the news section's expand/collapse height animation.
   - Draws the fixed animated background (canvas wave-mosaic grid, throttled to ~24fps, paused on `visibilitychange`).

   New interactive behavior belongs here, not in `main.min.js`.

## Site configuration

`_config.yml` holds author identity/social links (`author:`), SEO verification keys, and the data feeding `masthead.html`/`sidebar.html` — see its inline comments for what each key does. No `url`/`baseurl` is set, so asset and page references throughout the includes are relative rather than root-relative; keep new references consistent with that. `repository:` must stay in sync with the actual GitHub repo (`JiazheWei/JiazheWei.github.io`), since upstream template features key off it — notably the Google Scholar citation-crawler GitHub Action described in `README.md`. That Action is **not** present in this repo (`.github/` only contains `FUNDING.yml`), so citation counts are not auto-updated here despite the upstream README describing that feature.
