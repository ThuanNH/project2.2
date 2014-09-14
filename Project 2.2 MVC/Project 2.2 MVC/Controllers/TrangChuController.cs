using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_2._2_MVC.ViewModels;
using Project_2._2_MVC.Models;
using System.Text;
using System.IO;
using System.Web.UI;

namespace Project_2._2_MVC.Controllers
{
    public class TrangChuController : Controller
    {
        //
        // GET: /TrangChu/

        public ActionResult Index()
        {
            
            TrangChuViewModel vm = new TrangChuViewModel();
            ViewBag.Webname = "asdasD";
            ViewBag.TM = vm;
            string a = PartialView("_menu").ToString();
           
            //ViewPage vp = new ViewPage();
            //vp.Controls.Add(vp.LoadControl("~/Views/Shared/_menu.cshtml"));
            //StringBuilder sb = new StringBuilder();
            //using (StringWriter tw = new StringWriter(sb)) {
            //    using (HtmlTextWriter ht = new HtmlTextWriter(tw)) {
            //        vp.RenderControl(ht);
                
            //    }
            
            //};
            ViewDataDictionary viewData = new ViewDataDictionary(vm);
            string content = "";
            using (StringWriter sw = new StringWriter())
            {
                ViewEngineResult viewResult = ViewEngines.Engines.FindPartialView(this.ControllerContext, "_menu");
                ViewContext viewContext = new ViewContext(this.ControllerContext, viewResult.View, viewData, new TempDataDictionary(), sw);
                viewResult.View.Render(viewContext, sw);

                content = sw.GetStringBuilder().ToString();
            }
            ViewBag.VS = content;

          



            generateData gn = new generateData();
            return View(vm);
        }

    }
}
