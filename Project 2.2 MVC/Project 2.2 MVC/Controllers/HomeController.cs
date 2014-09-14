using Project_2._2_MVC.ViewModels;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_2._2_MVC.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            HomeViewModel vm = new HomeViewModel();
            return View(vm);
        }

        [HttpPost]
        public ActionResult Index(int id) {

            TrangChuViewModel vm = new TrangChuViewModel();
            ViewDataDictionary viewData = new ViewDataDictionary(vm);
            string content = "";
            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(this.ControllerContext, "_menu");
                ViewContext viewContext = new ViewContext(this.ControllerContext, viewResult.View, viewData, new TempDataDictionary(), sw);
                viewResult.View.Render(viewContext, sw);

               content = sw.GetStringBuilder().ToString();
            }

            return Json(new { pageTitle = "shit", content = new { container = "#ajCon", content = content } });
        }

    }
}
