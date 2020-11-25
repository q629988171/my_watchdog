# my_watchdog
## 简介
OpenWRT路由器中监控网络服务并重启的脚本

## 来源
https://jamesqi.com/%E5%8D%9A%E5%AE%A2/OpenWRT%E8%B7%AF%E7%94%B1%E5%99%A8%E4%B8%AD%E7%9B%91%E6%8E%A7%E7%BD%91%E7%BB%9C%E6%9C%8D%E5%8A%A1%E5%B9%B6%E9%87%8D%E5%90%AF%E7%9A%84%E8%84%9A%E6%9C%AC

## 使用说明
在/root下添加my_watchdog.sh脚本, 将 8.8.8.8 换成你要监控的网络地址, 并且添加你的Server酱 key(可以不添加)

添加执行权限:chmod +x /root/my_watchdog.sh

然后用crontab -e来在系统的crontab中添加一句，每隔5分钟定时运行这个脚本：
*/5 * * * * sh /root/my_watchdog.sh

注意: 首次运行需要初始化(删除 my_watchdog.txt)

## 参考

https://blog.csdn.net/qq_38250124/article/details/90137120

https://www.tutorialspoint.com/unix/if-elif-statement.htm

http://www.kaiyuanba.cn/html/1/131/137/4106.htm

https://unix.stackexchange.com/questions/47584/in-a-bash-script-using-the-conditional-or-in-an-if-statement

http://sc.ftqq.com/?c=code

https://www.cnblogs.com/lsdb/p/10148177.html
