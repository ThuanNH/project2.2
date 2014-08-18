using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_2._2_MVC.Areas.AdministratorArea.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /AdministratorArea/Home/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(HttpPostedFileBase file) {

            string utl = util.getlyricRootPath(file.FileName);

            List<HttpPostedFileBase> files = new List<HttpPostedFileBase>();
            files.Add(file);
            util.UploadFile(files,constants.lyricDir);
            ViewBag.Title = utl;
            return View();
        }

    }
}
