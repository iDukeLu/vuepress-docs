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
    },
    // 主题配置
    themeConfig: {
        lastUpdated: 'Last Updated', // 更新时间戳 git
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
        sidebarDepth: 2, // 展开标题层级深度
        activeHeaderLinks: true, // 激活标题链接，false 可以提高性能
        sidebar: [
          {
            title: '基本约定',   // 必要的
            collapsable: false, // 可选的, 默认值是 true,
            children: [
              '/guide/代码提交相关约定'
            ]
          },
        ]
    }
}