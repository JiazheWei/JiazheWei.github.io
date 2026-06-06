# <i class="fas fa-newspaper section-icon"></i> News

{% capture news_items %}
- *2026.04:* 🏆 Awarded the Outstanding Graduate by XJTU.

- *2025.12:* 🎉 **PosterCopilot** is now available on [arXiv](https://arxiv.org/pdf/2512.04082), code is under construction.

- *2025.09:* 🏆 Awarded **CCF Elite Collegiate Award** of 2025. See you in Harbin.

- *2025.07:* 🎉 **ALM-PU** is accepted by **ECML-PKDD 2025** as oral presentation. Thanks to all co-authors. See you in Porto, Spain.

- *2025.02:* 🎉 **NI-GDBA** is accepted by **WWW 2025** as oral presentation. Congratulations to Ken Li! See you in Sydney, Australia.
{% endcapture %}

<div class="news-wrapper">
  <div class="news-content" id="newsContent">
    {{ news_items | markdownify }}
  </div>
  <div class="news-toggle-container">
    <button class="seg-toggle-btn" id="newsToggleBtn">
      <span>Show More</span>
      <i class="fas fa-chevron-down news-toggle-icon"></i>
    </button>
  </div>
</div>
