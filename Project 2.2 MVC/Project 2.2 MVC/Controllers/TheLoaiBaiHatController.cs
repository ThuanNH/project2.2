using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_2._2_MVC.ViewModels;
using Project_2._2_MVC.Models;

namespace Project_2._2_MVC.Controllers
{
    public class TheLoaiBaiHatController : Controller
    {
        //
        // GET: /TheLoaiBaiHat/

        public ActionResult Index(int id)
        {
            MusicWeb_DBEntities db = new MusicWeb_DBEntities();
            TheLoaiBaiHatVM vm = new TheLoaiBaiHatVM();
            vm.songs = db.song.Where(p => p.songcategory.Any(c=>c.categoryid == id)).ToList();
            return View(vm);
        }

    }
}
