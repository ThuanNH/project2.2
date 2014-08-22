using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_2._2_MVC.Models;

namespace Project_2._2_MVC.Controllers
{
    public class Default2Controller : Controller
    {
        private MusicWeb_DBEntities db = new MusicWeb_DBEntities();

        //
        // GET: /Default2/

        public ActionResult Index()
        {
            var category = db.category.Include(c => c.categorytype);
            return View(category.ToList());
        }

        //
        // GET: /Default2/Details/5

        public ActionResult Details(int id = 0)
        {
            category category = db.category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        //
        // GET: /Default2/Create

        public ActionResult Create()
        {
            ViewBag.categorytypeid = new SelectList(db.categorytype, "id", "name");
            return View();
        }

        //
        // POST: /Default2/Create

        [HttpPost]
        public ActionResult Create(category category)
        {
            if (ModelState.IsValid)
            {
                db.category.Add(category);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.categorytypeid = new SelectList(db.categorytype, "id", "name", category.categorytypeid);
            return View(category);
        }

        //
        // GET: /Default2/Edit/5

        public ActionResult Edit(int id = 0)
        {
            category category = db.category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            ViewBag.categorytypeid = new SelectList(db.categorytype, "id", "name", category.categorytypeid);
            return View(category);
        }

        //
        // POST: /Default2/Edit/5

        [HttpPost]
        public ActionResult Edit(category category)
        {
            if (ModelState.IsValid)
            {
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.categorytypeid = new SelectList(db.categorytype, "id", "name", category.categorytypeid);
            return View(category);
        }

        //
        // GET: /Default2/Delete/5

        public ActionResult Delete(int id = 0)
        {
            category category = db.category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        //
        // POST: /Default2/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            category category = db.category.Find(id);
            db.category.Remove(category);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}