using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_2._2_MVC.Models;

namespace Project_2._2_MVC.Areas.AdministratorArea.Controllers
{
    public class AccountController : Controller
    {
        private MusicWeb_DBEntities db = new MusicWeb_DBEntities();

        //
        // GET: /AdministratorArea/Account/

        public ActionResult Index()
        {
            var accounts = db.Account.Include(a => a.accounttype);
            return View(accounts.ToList());
        }

        //
        // GET: /AdministratorArea/Account/Details/5

        public ActionResult Details(int id = 0)
        {
            Account account = db.Account.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }

        //
        // GET: /AdministratorArea/Account/Create

        public ActionResult Create()
        {
            ViewBag.accounttypeid = new SelectList(db.accounttype, "id", "name");
            return View();
        }

        //
        // POST: /AdministratorArea/Account/Create

        [HttpPost]
        public ActionResult Create(Account account)
        {
            if (ModelState.IsValid)
            {
                db.Account.Add(account);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.accounttypeid = new SelectList(db.accounttype, "id", "name", account.accounttypeid);
            return View(account);
        }

        //
        // GET: /AdministratorArea/Account/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Account account = db.Account.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            ViewBag.accounttypeid = new SelectList(db.accounttype, "id", "name", account.accounttypeid);
            return View(account);
        }

        //
        // POST: /AdministratorArea/Account/Edit/5

        [HttpPost]
        public ActionResult Edit(Account account)
        {
            if (ModelState.IsValid)
            {
                db.Entry(account).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.accounttypeid = new SelectList(db.accounttype, "id", "name", account.accounttypeid);
            return View(account);
        }

        //
        // GET: /AdministratorArea/Account/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Account account = db.Account.Find(id);
            if (account == null)
            {
                return HttpNotFound();
            }
            return View(account);
        }

        //
        // POST: /AdministratorArea/Account/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Account account = db.Account.Find(id);
            db.Account.Remove(account);
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