using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Project_2._2_MVC.Models;
using System.Web.UI;

namespace Project_2._2_MVC.Areas.AdministratorArea.Controllers
{
    public class BannedReasonController : Controller
    {
        private MusicWeb_DBEntities db = new MusicWeb_DBEntities();
        //const int pageSize = 6;

        //
        // GET: /AdministratorArea/BannedReason/

        public ActionResult Index(int page = 1, int sortBy = 1, bool isAsc = true, string search = null, int pageSize = 5)
        {
            IEnumerable<bannedreason> bannedreason = db.bannedreason.Where(b => search == null || b.title.Contains(search) || b.descriptions.Contains(search));

            #region Sorting
            if (sortBy == 1)
                bannedreason = isAsc ? bannedreason.OrderBy(b => b.id) : bannedreason.OrderByDescending(b => b.id);
            else if (sortBy == 2)
                bannedreason = isAsc ? bannedreason.OrderBy(b => b.title) : bannedreason.OrderByDescending(b => b.title);
            else if (sortBy == 3)
                bannedreason = isAsc ? bannedreason.OrderBy(b => b.descriptions) : bannedreason.OrderByDescending(b => b.descriptions);
            #endregion

            bannedreason = bannedreason
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            ViewBag.CurrentPage = page;
            ViewBag.PageSize = pageSize;
            ViewBag.TotalPages = (int)Math.Ceiling((decimal)db.bannedreason.Count() / pageSize);

            ViewBag.SortBy = sortBy;
            ViewBag.IsAsc = isAsc;
            ViewBag.Search = search;
            ViewBag.PageSize = pageSize;

            return View(bannedreason);
        }

        //
        // GET: /AdministratorArea/BannedReason/Details/5

        public ActionResult Details(int id = 0)
        {
            bannedreason bannedreason = db.bannedreason.Find(id);
            if (bannedreason == null)
            {
                return HttpNotFound();
            }
            return View(bannedreason);
        }

        //
        // GET: /AdministratorArea/BannedReason/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /AdministratorArea/BannedReason/Create

        [HttpPost]
        public ActionResult Create(bannedreason bannedreason)
        {
            if (ModelState.IsValid)
            {
                var br = db.bannedreason.FirstOrDefault(b => b.title == bannedreason.title);
                if (br == null){
                    db.bannedreason.Add(bannedreason);
                    db.SaveChanges();
                    return RedirectToAction("Index");
                }
                else {
                    ModelState.AddModelError("", "Tiêu đề này đã có trong danh sách, vui lòng nhập tiêu đề khác.");
                }

                
            }

            return View(bannedreason);
        }

        //
        // GET: /AdministratorArea/BannedReason/Edit/5

        public ActionResult Edit(int id = 0)
        {
            bannedreason bannedreason = db.bannedreason.Find(id);
            if (bannedreason == null)
            {
                return HttpNotFound();
            }
            return View(bannedreason);
        }

        //
        // POST: /AdministratorArea/BannedReason/Edit/5

        [HttpPost]
        public ActionResult Edit(bannedreason bannedreason)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bannedreason).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(bannedreason);
        }

        //
        // GET: /AdministratorArea/BannedReason/Delete/5

        public ActionResult Delete(int id = 0)
        {
            bannedreason bannedreason = db.bannedreason.Find(id);
            if (bannedreason == null)
            {
                return HttpNotFound();
            }
            return View(bannedreason);
        }

        //
        // POST: /AdministratorArea/BannedReason/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            bannedreason bannedreason = db.bannedreason.Find(id);
            db.bannedreason.Remove(bannedreason);
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