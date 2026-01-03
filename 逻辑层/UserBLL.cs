using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using 数据层; // 确保这里是你数据层的实际命名空间

namespace 逻辑层
{
    public class UserBLL
    {
        // 创建新的 DbContext 实例确保数据库操作的独立性
        private UserSystemDBEntities1 Db { get; set; }

        public UserBLL()
        {
            Db = new UserSystemDBEntities1();
        }

        // 注册业务逻辑 (包含检测和加密加分项)
        public string RegisterUser(Users newUser)
        {
            // 1. 检测用户名是否已存在 
            if (Db.Users.Any(u => u.UserName == newUser.UserName))
            {
                return "该用户名已被注册";
            }

            // 2. 实现密码的MD5加密功能 
            // 这里假设你已经把 EncryptHelper 放在了逻辑层或公共层
            newUser.Password = EncryptHelper.GetMD5Hash(newUser.Password);

            try
            {
                Db.Users.Add(newUser);
                Db.SaveChanges();
                return "注册成功";
            }
            catch (Exception ex)
            {
                return "注册失败：" + ex.Message;
            }
        }
        // 登录验证逻辑
        public bool Login(string userName, string password)
        {
            // 1. 先把用户输入的密码进行 MD5 加密（因为数据库里存的是加密后的）
            string pwdHash = EncryptHelper.GetMD5Hash(password);

            // 2. 去数据库检查有没有这个人，且密码对不对
            return Db.Users.Any(u => u.UserName == userName && u.Password == pwdHash);
        }
        public bool ResetPassword(string userName, string phone, string newPassword)
        {
            // 1. 查询是否存在这个用户名和手机号匹配的用户
            var user = Db.Users.FirstOrDefault(u => u.UserName == userName && u.Phone == phone);

            if (user != null)
            {
                // 2. 如果找到了，修改密码（记得要 MD5 加密）
                user.Password = EncryptHelper.GetMD5Hash(newPassword);

                // 3. 保存更改到数据库
                Db.SaveChanges();
                return true; // 重置成功
            }

            return false; // 验证失败（用户名或手机号不对）
        }
        // 1. 获取用户详细信息 (用于在首页显示)
        public Users GetUserInfo(string userName)
        {
            return Db.Users.FirstOrDefault(u => u.UserName == userName);
        }

        // 2. 更新个人资料 (邮箱、手机号)
        public bool UpdateUserInfo(string userName, string newEmail, string newPhone)
        {
            var user = Db.Users.FirstOrDefault(u => u.UserName == userName);
            if (user != null)
            {
                user.Email = newEmail;
                user.Phone = newPhone;
                // 如果还有 Address, ZipCode 等字段，也可以在这里加
                Db.SaveChanges();
                return true;
            }
            return false;
        }
        // 打开 UserBLL.cs，把这段代码加进去
        public bool ChangePassword(string userName, string oldPassword, string newPassword)
        {
            // 1. 将用户输入的"原密码"加密，去数据库比对是否正确
            string oldPwdHash = EncryptHelper.GetMD5Hash(oldPassword);

            // 2. 查询用户名和密码是否匹配
            var user = Db.Users.FirstOrDefault(u => u.UserName == userName && u.Password == oldPwdHash);

            if (user != null)
            {
                // 3. 如果验证通过，将"新密码"加密并保存
                user.Password = EncryptHelper.GetMD5Hash(newPassword);
                Db.SaveChanges(); // 提交到数据库
                return true; // 修改成功
            }

            return false; // 原密码错误
        }

    }
}