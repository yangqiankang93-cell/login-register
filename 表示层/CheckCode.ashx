<%@ WebHandler Language="C#" Class="CheckCode" %>

using System;
using System.Web;

using System.Drawing;
using System.Drawing.Imaging;

using System.Web.SessionState;
public class CheckCode : IHttpHandler, IRequiresSessionState
{
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "image/jpeg";
        
        // 生成随机码
        string code = GenerateRandomCode(4);
        
        // 【核心】把验证码存入 Session，供后台比对
        context.Session["CheckCode"] = code;
        
        // 画图
        using (Bitmap bitmap = new Bitmap(85, 30))
        using (Graphics g = Graphics.FromImage(bitmap))
        {
            g.Clear(Color.White);
            
            // 画噪点/干扰线
            Random random = new Random();
            for (int i = 0; i < 25; i++)
            {
                int x1 = random.Next(bitmap.Width);
                int y1 = random.Next(bitmap.Height);
                int x2 = random.Next(bitmap.Width);
                int y2 = random.Next(bitmap.Height);
                g.DrawLine(new Pen(Color.LightGray), x1, y1, x2, y2);
            }
            
            // 画文字
            Font font = new Font("Arial", 16, (FontStyle.Bold | FontStyle.Italic));
            System.Drawing.Drawing2D.LinearGradientBrush brush = new System.Drawing.Drawing2D.LinearGradientBrush(
                new Rectangle(0, 0, bitmap.Width, bitmap.Height), Color.Blue, Color.DarkRed, 1.2f, true);
            g.DrawString(code, font, brush, 3, 2);

            bitmap.Save(context.Response.OutputStream, ImageFormat.Jpeg);
        }
    }

    private string GenerateRandomCode(int length)
    {
        string chars = "23456789ABCDEFGHJKLMNPQRSTUVWXYZ";
        Random r = new Random();
        string result = "";
        for (int i = 0; i < length; i++)
        {
            result += chars[r.Next(chars.Length)];
        }
        return result;
    }

    public bool IsReusable { get { return false; } }
}