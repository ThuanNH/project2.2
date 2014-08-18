using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_2._2_MVC.Models;

namespace Project_2._2_MVC.Areas.AdministratorArea.Controllers
{
    public class AccountController : Controller
    {
        MusicWeb_DBEntities db = new MusicWeb_DBEntities();

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Account _account)
        {
            if (ModelState.IsValid) {
                if (IsValid(_account.Accountname, _account.password, 1)){
                    System.Web.Security.FormsAuthentication.SetAuthCookie(_account.Accountname, false);
                    return RedirectToAction("Index", "Home");
                }
                else{
                    ModelState.AddModelError("", "Dữ liệu đặng nhập không chính xác.");
                }
            }
            return View();
        }

        public bool IsValid(string user_name, string pass_word, int account_type) {
            var account = db.Account.Where(a => a.Accountname == user_name && a.password == pass_word && a.accounttypeid == account_type).SingleOrDefault();
            if (account != null)
                return true;
            return false;
        }

        public class SHA1
        {
            public static string Encode(string value)
            {
                var hash = System.Security.Cryptography.SHA1.Create();
                var encoder = new System.Text.ASCIIEncoding();
                var combined = encoder.GetBytes(value ?? "");
                return BitConverter.ToString(hash.ComputeHash(combined)).ToLower().Replace("-", "");
            }
        }

        public ActionResult Logout()
        {
            System.Web.Security.FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Account");
        }
    }
}
