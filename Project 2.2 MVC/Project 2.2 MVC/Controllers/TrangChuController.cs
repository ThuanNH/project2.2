using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_2._2_MVC.ViewModels;
using Project_2._2_MVC.Models;

namespace Project_2._2_MVC.Controllers
{
    public class TrangChuController : Controller
    {
        //
        // GET: /TrangChu/

        public ActionResult Index()
        {
            TrangChuViewModel vm = new TrangChuViewModel();
            generateData gn = new generateData();
            return View(vm);
        }

    }
}
