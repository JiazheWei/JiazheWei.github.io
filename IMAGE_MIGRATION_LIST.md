# 图片迁移清单

以下是需要从旧主页 `xjtu-wjz.github.io` 迁移到新主页的图片列表：

## 个人头像
- [ ] `files/avatar/new_profile.jpg` → `images/profile.jpg`
  - 用于网站头像显示

## 教育经历
- [ ] `files/institute/xjtu.jpg`
  - 西安交通大学logo

## 研究工作图片
- [ ] `files/work/ALM-PU.png`
  - ALM-PU论文配图
  
- [ ] `files/work/backdoor.png`
  - NI-GDBA论文配图

## 研究机构Logo
- [ ] `files/institute/BDKE.png`
  - BDKElab logo
  
- [ ] `files/institute/linslab.png`
  - LinsLab logo
  
- [ ] `files/institute/CERN.jpg`
  - CERN logo

## 获奖照片
- [ ] `files/photo/highlight/lanqiao.jpg`
  - 蓝桥杯获奖照片
  
- [ ] `files/photo/highlight/baogang.png`
  - 宝钢奖学金证书

## 工程项目
- [ ] `files/work/Paranormal-XJTU.png`
  - Paranormal-XJTU游戏截图

## 其他可能需要的图片
- [ ] `files/icon/email.png`
- [ ] `files/icon/google_scholar.png`
- [ ] `files/icon/github_s.jpg`
- [ ] `files/icon/wechat.png`
- [ ] `files/my_wechat.jpg` (微信二维码)

## 迁移说明

1. 将这些图片从旧主页的 `files/` 目录复制到新主页的 `images/` 目录
2. 头像图片需要重命名为 `profile.jpg` 并放在 `images/` 目录下
3. 其他图片可以保持原有的目录结构，在 `images/` 下创建相应的子目录

## 在about.md中的使用位置

图片在markdown文件中以HTML格式或markdown格式引用，例如：
- `<img src='images/work/ALM-PU.png' alt="ALM-PU" width="100%">`
- 或使用Jekyll的资源路径: `{{ site.baseurl }}/images/work/ALM-PU.png`

注意：新模板使用Jekyll，图片路径可能需要根据实际部署情况调整。

