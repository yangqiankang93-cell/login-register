/* 鼠标跟踪渐变效果脚本 */
document.addEventListener('DOMContentLoaded', function() {
    // 创建渐变背景容器
    const gradientBg = document.createElement('div');
    gradientBg.className = 'gradient-background';
    document.body.insertBefore(gradientBg, document.body.firstChild);

    // 创建跟随光效
    const gradientLight = document.createElement('div');
    gradientLight.className = 'gradient-light';
    document.body.appendChild(gradientLight);

    // 鼠标跟踪事件
    document.addEventListener('mousemove', function(e) {
        // 将光效中心放在鼠标位置
        gradientLight.style.left = (e.clientX - 100) + 'px';
        gradientLight.style.top = (e.clientY - 100) + 'px';
    });

    // 鼠标离开窗口时隐藏光效
    document.addEventListener('mouseleave', function() {
        gradientLight.style.opacity = '0';
        gradientLight.style.transition = 'opacity 0.3s ease';
    });

    // 鼠标进入窗口时显示光效
    document.addEventListener('mouseenter', function() {
        gradientLight.style.opacity = '1';
        gradientLight.style.transition = 'opacity 0.3s ease';
    });
});
