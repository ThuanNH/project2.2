using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace Project_2._2_MVC.Controllers
{
    public class IndexController : Controller
    {
        //
        // GET: /Index/

        public ActionResult Index()
        {

            ViewBag.Title = util.getVideoImageFullPath("singer.jpg");

            return View();
        }

        [HttpPost]
        public ActionResult Index(List<HttpPostedFileBase> img)
        {
           
           List<HttpPostedFileBase> list = util.UploadFile(img, constants.videoImageDir);
           foreach (var item in img)
           {
               ViewBag.Title = util.getVideoImageFullPath(item.FileName);
           }
            return View();
        }
        //
        // GET: /Index/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Index/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Index/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Index/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Index/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Index/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Index/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
