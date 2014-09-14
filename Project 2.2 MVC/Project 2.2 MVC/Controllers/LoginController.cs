using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_2._2_MVC.Models;
using System.Web.Security;
using System.Web.Configuration;
using Project_2._2_MVC.ViewModels;

namespace Project_2._2_MVC.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/
        public ActionResult Login() {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string pass)
        {
            MusicWeb_DBEntities db = new MusicWeb_DBEntities();
            string hashpass = FormsAuthentication.HashPasswordForStoringInConfigFile(pass, FormsAuthPasswordFormat.MD5.ToString());
            var user = db.Account.Where(p => p.Username == username && p.password == hashpass).FirstOrDefault();
            if (user != null)
            {
                UserProfile userprofile = new UserProfile();
                userprofile.account = user;
                Session["SessLoggedInUser"] = userprofile;
                return Json(new { pageTitle = "logged", content = new { type = "success", content = "" } });

            }
            else
            {
                return Json(new { pageTitle = "logged", content = new { type = "error", content = "tên đăng nhập hoặc mật khẩu không chính xác" } });
            }
        }

        public ActionResult Register() {

            return View();
        }

    }
}
