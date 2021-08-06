using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SchedulingAdminTool.DATA.EF;
using SchedulingAdminTool.UI.MVC.Controllers;



namespace SchedulingAdminTool.UI.MVC.Controllers
{
    public class StudentStatusController : Controller
    {
        private SchedulingAdminToolEntities db = new SchedulingAdminToolEntities();

        [Authorize(Roles = "Admin")]
        public ActionResult IndexTiles() //this is going to be for the grid (tiles)
        {

            
                //ViewBag.Guitar = db.Guitars.Select(x => x.GuitarID).ToList();
                //ViewBag.Brands = db.Brands.Select(x => x.BrandName).ToList();

                //List<Guitar> guitars = db.Guitars.Include(b => b.Guitar_Category).ToList();
                //return View(guitars);
            

            ViewBag.StudentStatuses = db.StudentStatuses.Select(x => x.SSName).ToList();
            ViewBag.Students = db.Students.Select(x => x.FirstName).ToList();

            List<StudentStatus> studentStatuses = db.StudentStatuses.Include(s => s.Students).ToList();
            //List<Student> students = db.Students.Include(s => s.FirstName).Include(s => s.LastName).ToList();
            return View(studentStatuses);
        }

        // GET: StudentStatus
        [Authorize(Roles = "Admin")]
        public ActionResult Index() //this is where the "normal" index view is - where we'll put table view
        {
            return View(db.StudentStatuses.ToList());
        }

        // GET: StudentStatus/Details/5
        [Authorize(Roles = "Admin")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StudentStatus studentStatus = db.StudentStatuses.Find(id);
            if (studentStatus == null)
            {
                return HttpNotFound();
            }
            return View(studentStatus);
        }

        // GET: StudentStatus/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: StudentStatus/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "SSID,SSName,SSDescription")] StudentStatus studentStatus)
        {
            if (ModelState.IsValid)
            {
                db.StudentStatuses.Add(studentStatus);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(studentStatus);
        }

        // GET: StudentStatus/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StudentStatus studentStatus = db.StudentStatuses.Find(id);
            if (studentStatus == null)
            {
                return HttpNotFound();
            }
            return View(studentStatus);
        }

        // POST: StudentStatus/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "SSID,SSName,SSDescription")] StudentStatus studentStatus)
        {
            if (ModelState.IsValid)
            {
                db.Entry(studentStatus).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(studentStatus);
        }

        // GET: StudentStatus/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            StudentStatus studentStatus = db.StudentStatuses.Find(id);
            if (studentStatus == null)
            {
                return HttpNotFound();
            }
            return View(studentStatus);
        }

        // POST: StudentStatus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            StudentStatus studentStatus = db.StudentStatuses.Find(id);
            db.StudentStatuses.Remove(studentStatus);
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
