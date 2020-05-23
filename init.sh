# docs 基础目录
touch package.json
mkdir -p docs/guide/
touch docs/guide/README.md
touch docs/README.md
touch docs/config.md

# .vuepress 核心目录
mkdir -p docs/.vuepress/                    # (可选的) 用于存放全局的配置、组件、静态资源等。
mkdir -p docs/.vuepress/public/             # (可选的) 静态资源目录。
touch docs/.vuepress/config.js              # (可选的) 配置文件的入口文件，也可以是 YML 或 toml。
mkdir -p docs/.vuepress/public/assets/img/  # (可选的) 静态资源图片目录。

# package.json 配置
tee > package.json << EOF
{
  "name": "project",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "dev": "vuepress dev docs",
    "build": "vuepress build docs"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
EOF

# 默认主页
tee docs/README.md << EOF
---
home: true
heroImage: /assets/img/home.png
heroText: 网站标题
tagline: 网站副标题
actionText: 快速上手 →
actionLink: /guide/
features:
- title: 简洁至上
  details: 以 Markdown 为中心的项目结构，以最少的配置帮助你专注于写作。
- title: Vue驱动
  details: 享受 Vue + webpack 的开发体验，在 Markdown 中使用 Vue 组件，同时可以使用 Vue 来开发自定义主题。
- title: 高性能
  details: VuePress 为每个页面预渲染生成静态的 HTML，同时在页面被加载的时候，将作为 SPA 运行。
footer: MIT Licensed | Copyright © 2018-present Evan You
---
EOF

# 主题配置
tee > docs/.vuepress/config.js << EOF
module.exports = {
    // 基础配置
    base: '/', // 用于部署时的子路径（git仓库路径）
    title: '网站的标题', // 网站的标题
    description: 'luban document, created by victorsun', // 网站描述，HTML中表现为一个 <meta> 标签
    host: '0.0.0.0', // dev 服务器的主机
    port: 8888, // dev 服务器的端口
    dest: './dist', // 指定 vuepress build 的输出目录
    evergreen: false, // 忽略浏览器兼容性
    markdown: {
        lineNumbers: true, // 代码块的左侧显示行号
        externalLinks: { target: '_blank', rel: 'noopener noreferrer' }, // 键和值对将被添加到指向外部链接的 <a> 标签，默认选项将在新窗口中打开外部链接
        anchor: { permalink: true, permalinkBefore: true, permalinkSymbol: '#' }, // 锚点配置
        toc: { includeLevel: [1, 2, 3] }, // [[toc]]目录
        config: md => { // 插件
            // md.set({ breaks: true })
            // md.use(require('markdown-it-xxx'))
        }
    },
    // 主题配置
    themeConfig: {
        // 导航栏配置
        logo: '/assets/img/logo.jpg', // 导航栏 logo
        nav: [
            {text: '主页', link: '/'}, 
            {text: '访问主页',link: 'http://www.csxiaoyao.com'},
            {
                text: '菜单',
                items: [{
                    text: '普通菜单',
                    link: '/'
                }, {
                    text: '分组菜单',
                    items: [{
                        text: 'test1',
                        link: '/test1'
                    }, {
                        text: 'test2',
                        link: '/test2'
                    }]
                }]
            }
        ],
        // 侧边栏配置
        displayAllHeaders: false, // 展开所有标题层级
        sidebarDepth: 2 // 展开标题层级深度
        activeHeaderLinks: true, // 激活标题链接，false 可以提高性能
        sidebar: [
            '/guide',
        ],
        lastUpdated: 'Last Updated' // 更新时间戳 git
    }
}
EOF