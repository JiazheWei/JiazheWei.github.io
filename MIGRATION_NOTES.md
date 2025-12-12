# 内容迁移说明

## 已完成的迁移工作

### 1. 个人信息 (about.md)
- ✅ 个人简介 (Biography)
- ✅ 教育背景 (Education)
- ✅ 论文发表 (Publications)
- ✅ 研究经历 (Research & Visiting Experience)
- ✅ 获奖情况 (Honors and Awards)
- ✅ 工程经验 (Engineering Experience)
- ✅ 领导力经历 (Leadership Experience)
- ✅ 学术服务 (Academic Services)

### 2. 配置文件 (_config.yml)
- ✅ 网站标题和描述
- ✅ Google Scholar链接
- ✅ 邮箱地址
- ✅ GitHub用户名
- ✅ Google site verification

## 需要手动完成的工作

### 1. 图片迁移
请参考 `IMAGE_MIGRATION_LIST.md` 文件，将所有需要的图片从旧主页复制到新主页的 `images/` 目录。

### 2. 图片路径调整
在图片迁移完成后，需要在 `about.md` 中添加实际的图片引用。当前文件中用注释标记了需要图片的位置，例如：
```markdown
<!-- 需要图片: files/work/ALM-PU.png -->
```

您可以根据Jekyll模板的规范添加图片，例如：
```html
<div class='paper-box'>
  <div class='paper-box-image'>
    <img src='images/work/ALM-PU.png' alt="ALM-PU" width="100%">
  </div>
</div>
```

### 3. 可能需要调整的内容

#### 社交媒体图标
旧主页使用了自定义的图标图片，新模板可能使用Font Awesome图标。您可能需要：
- 检查新模板的图标系统
- 决定是保留原有图标还是使用新模板的图标

#### News部分
旧主页有一个News部分（被注释掉了），如果需要可以在 `about.md` 中添加：
```markdown
# 🔥 News
- *2024.09* Paper accepted at ECML-PKDD2025
- *2024.02* Paper accepted at WWW2025
```

### 4. 链接检查
- GitHub链接: https://github.com/JiazheWei
- 另一个GitHub账号: https://github.com/xjtu-wjz
- Google Scholar: https://scholar.google.com/citations?user=UgKRQJwAAAAJ

确认使用哪个GitHub账号作为主要展示账号。

### 5. 文件路径配置
检查 `_config.yml` 中的 repository 设置是否正确：
```yaml
repository: "JiazheWei/JiazheWei.github.io"
```

## Jekyll特定配置

### 运行本地服务器
```bash
bundle install
bundle exec jekyll serve
```

### 部署到GitHub Pages
1. 确保repository名称为 `JiazheWei.github.io`
2. 将代码推送到 `main` 或 `gh-pages` 分支
3. 在仓库设置中启用GitHub Pages

## 注意事项

1. **Markdown格式**: 新模板使用kramdown markdown处理器，某些HTML标签可能需要调整
2. **样式**: 新模板有自己的CSS样式，可能与旧主页的外观有所不同
3. **响应式设计**: 新模板应该已经支持移动端，无需额外配置
4. **SEO**: 已迁移Google site verification，可以在Google Search Console中验证

## 后续优化建议

1. 添加Google Analytics以追踪访问数据
2. 考虑添加博客功能（Jekyll支持）
3. 优化图片大小以加快加载速度
4. 添加英文版本的简历链接
5. 考虑添加项目展示页面

## 联系方式
如有问题，可以查看Jekyll官方文档：https://jekyllrb.com/docs/

