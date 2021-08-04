using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SchedulingAdminTool.DATA.EF;

namespace SchedulingAdminTool.UI.MVC.Controllers
{
    public class ScheduledClassStatusController : Controller
    {
        private SchedulingAdminToolEntities db = new SchedulingAdminToolEntities();

        // GET: ScheduledClassStatus
        public ActionResult Index()
        {
            return View(db.ScheduledClassStatuses.ToList());
        }

        // GET: ScheduledClassStatus/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ScheduledClassStatus scheduledClassStatus = db.ScheduledClassStatuses.Find(id);
            if (scheduledClassStatus == null)
            {
                return HttpNotFound();
            }
            return View(scheduledClassStatus);
        }

        // GET: ScheduledClassStatus/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ScheduledClassStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SCSID,SCSName")] ScheduledClassStatus scheduledClassStatus)
        {
            if (ModelState.IsValid)
            {
                db.ScheduledClassStatuses.Add(scheduledClassStatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(scheduledClassStatus);
        }

        // GET: ScheduledClassStatus/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ScheduledClassStatus scheduledClassStatus = db.ScheduledClassStatuses.Find(id);
            if (scheduledClassStatus == null)
            {
                return HttpNotFound();
            }
            return View(scheduledClassStatus);
        }

        // POST: ScheduledClassStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SCSID,SCSName")] ScheduledClassStatus scheduledClassStatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(scheduledClassStatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(scheduledClassStatus);
        }

        // GET: ScheduledClassStatus/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ScheduledClassStatus scheduledClassStatus = db.ScheduledClassStatuses.Find(id);
            if (scheduledClassStatus == null)
            {
                return HttpNotFound();
            }
            return View(scheduledClassStatus);
        }

        // POST: ScheduledClassStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ScheduledClassStatus scheduledClassStatus = db.ScheduledClassStatuses.Find(id);
            db.ScheduledClassStatuses.Remove(scheduledClassStatus);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
