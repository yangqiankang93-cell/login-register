using System.Security.Cryptography;
using System.Text;

public class EncryptHelper
{
    public static string GetMD5Hash(string input)
    {
        using (MD5 md5 = MD5.Create())
        {
            byte[] data = md5.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }
    }
}