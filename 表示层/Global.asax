<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // 网站启动时初始化计数器
        Application["TotalVisits"] = 0; 
        Application["OnlineUsers"] = 0; 
    }

    void Session_Start(object sender, EventArgs e)
    {
        // 新用户进入，锁定变量并 +1
        Application.Lock();
        Application["TotalVisits"] = (int)Application["TotalVisits"] + 1;
        Application["OnlineUsers"] = (int)Application["OnlineUsers"] + 1;
        Application.UnLock();
    }

    void Session_End(object sender, EventArgs e)
    {
        // 用户离开，在线人数 -1
        Application.Lock();
        if ((int)Application["OnlineUsers"] > 0)
        {
            Application["OnlineUsers"] = (int)Application["OnlineUsers"] - 1;
        }
        Application.UnLock();
    }

</script>