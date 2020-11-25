# my_watchdog
OpenWRT路由器中监控网络服务并重启的脚本

源:https://jamesqi.com/%E5%8D%9A%E5%AE%A2/OpenWRT%E8%B7%AF%E7%94%B1%E5%99%A8%E4%B8%AD%E7%9B%91%E6%8E%A7%E7%BD%91%E7%BB%9C%E6%9C%8D%E5%8A%A1%E5%B9%B6%E9%87%8D%E5%90%AF%E7%9A%84%E8%84%9A%E6%9C%AC

在/root下编写一个my_watchdog.sh脚本

添加执行权限:chmod +x /root/my_watchdog.sh

然后用crontab -e来在系统的crontab中添加一句，每隔5分钟定时运行这个脚本：
*/5 * * * * sh /root/my_watchdog.sh
