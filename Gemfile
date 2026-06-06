source "https://rubygems.org"

# 本地预览使用原生 Jekyll 4（线上 GitHub Pages 仍由 GitHub 自己的环境构建，不受此文件影响）。
# 原始的 github-pages 配置已备份在 Gemfile.bak / Gemfile.lock.bak。
gem "jekyll", "~> 4.3"

# 锁在 2.x：使用 libsass（sassc），对主题自带的老式 SCSS 语法更宽容；
# 3.x 改用严格的 Dart Sass，容易在旧版 Minimal Mistakes 样式上报错。
gem "jekyll-sass-converter", "~> 2.0"

# 站点用到的插件（与 _config.yml 的 plugins / whitelist 保持一致）
group :jekyll_plugins do
  gem "jekyll-paginate"
  gem "jekyll-sitemap"
  gem "jekyll-gist"
  gem "jekyll-feed"
  gem "jekyll-redirect-from"
  gem "jemoji"
end

# Ruby 3 起 webrick 不再随标准库提供，jekyll serve 需要它
gem "webrick", "~> 1.8"

# 各平台时区数据（macOS/Windows 需要）
gem "tzinfo-data"
