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
    public class Default1Controller : Controller
    {
        private MusicWeb_DBEntities db = new MusicWeb_DBEntities();

        //
        // GET: /Default1/

        public ActionResult Index()
        {
            return View(db.accounttype.ToList());
        }

        //
        // GET: /Default1/Details/5

        public ActionResult Details(int id = 0)
        {
            accounttype accounttype = db.accounttype.Find(id);
            if (accounttype == null)
            {
                return HttpNotFound();
            }
            return View(accounttype);
        }

        //
        // GET: /Default1/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Default1/Create

        [HttpPost]
        public ActionResult Create(accounttype accounttype)
        {
            if (ModelState.IsValid)
            {
                db.accounttype.Add(accounttype);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(accounttype);
        }

        //
        // GET: /Default1/Edit/5

        public ActionResult Edit(int id = 0)
        {
            accounttype accounttype = db.accounttype.Find(id);
            if (accounttype == null)
            {
                return HttpNotFound();
            }
            return View(accounttype);
        }

        //
        // POST: /Default1/Edit/5

        [HttpPost]
        public ActionResult Edit(accounttype accounttype)
        {
            if (ModelState.IsValid)
            {
                db.Entry(accounttype).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(accounttype);
        }

        //
        // GET: /Default1/Delete/5

        public ActionResult Delete(int id = 0)
        {
            accounttype accounttype = db.accounttype.Find(id);
            if (accounttype == null)
            {
                return HttpNotFound();
            }
            return View(accounttype);
        }

        //
        // POST: /Default1/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            accounttype accounttype = db.accounttype.Find(id);
            db.accounttype.Remove(accounttype);
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