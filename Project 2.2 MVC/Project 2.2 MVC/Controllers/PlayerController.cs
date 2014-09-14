using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Project_2._2_MVC.Controllers
{
    public class PlayerController : Controller
    {
        //
        // GET: /ChoiNhac/

        public ActionResult Index(string id)
        {
            ViewBag.t = id;
            return View();
        }

        public ActionResult Song(string songID) {
            ViewBag.t = songID;
            return View();
        }

        public ActionResult Video(string videoID)
        {
            ViewBag.t = videoID;
            return View();
        }

        public ActionResult SongPlaylist(string playlistID)
        {
            ViewBag.t = playlistID;
            return View();
        }

    }
}
