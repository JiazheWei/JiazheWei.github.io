#!/usr/bin/env bash
# 启动本地预览服务器（支持热重载）
# 用法：在项目根目录下运行：
#
#   bash run_server.sh
#
# 启动后访问：http://localhost:4000
# 改完文件保存即可自动刷新（--livereload）

# 让本脚本能找到 Homebrew 安装的 Ruby 3.3
if [ -x /opt/homebrew/opt/ruby@3.3/bin/ruby ]; then
  export PATH="/opt/homebrew/opt/ruby@3.3/bin:$PATH"
fi

bundle exec jekyll serve --livereload
