using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SchedulingAdminTool.DATA.EF;
using SchedulingAdminTool.UI.MVC.Utilities;
using System.Drawing;
using SchedulingAdminTool.UI.MVC.Models;

namespace SchedulingAdminTool.UI.MVC.Controllers
{
    public class StudentsController : Controller
    {
        private SchedulingAdminToolEntities db = new SchedulingAdminToolEntities();
        ////private string savePath;
        //private string fileName;

        // GET: Students
        [Authorize(Roles = "Admin, Scheduling")]
        //[Authorize(Roles = "Scheduling")]
        public ActionResult Index()
        {
            var students = db.Students.Include(s => s.StudentStatus);
            return View(students.ToList());
        }

        // GET: Students/Details/5
        [Authorize(Roles = "Admin, Scheduling")]
        //[Authorize(Roles = "Scheduling")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // GET: Students/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.SSID = new SelectList(db.StudentStatuses, "SSID", "SSName");
            return View();
        }

        // POST: Students/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "StudentId,FirstName,LastName,Major,Address,City,State,ZipCode,Phone,Email,PhotoUrl,SSID")] Student student, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                string file = "noimage.png";

                if (image != null)
                {
                    file = image.FileName;
                    string ext = file.Substring(file.LastIndexOf("."));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };

                    //Check that the uploaded file is in our list of acceptable exts and that the file size <= 4mb max from ASP.NET
                    if (goodExts.Contains(ext.ToLower()) && image.ContentLength <= 4194304) //4194304 is 4 mb
                    {
                        //create a new file name using a GUID
                        file = Guid.NewGuid() + ext;

                        //save the image

                        string savePath = Server.MapPath("~/Content/img/");

                        Image convertedImage = Image.FromStream(image.InputStream);

                        int maxImageSize = 500;
                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);

                    }
                    //no matter what, update the PhotoUrl with the value of the file variable
                    student.PhotoUrl = file;
                }

                db.Students.Add(student);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SSID = new SelectList(db.StudentStatuses, "SSID", "SSName", student.SSID);
            return View(student);
        }//end actionresult

        // GET: Students/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            ViewBag.SSID = new SelectList(db.StudentStatuses, "SSID", "SSName", student.SSID);
            return View(student);
        }

        // POST: Students/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "StudentId,FirstName,LastName,Major,Address,City,State,ZipCode,Phone,Email,PhotoUrl,SSID")] Student student, HttpPostedFileBase image)
        {

            if (ModelState.IsValid)
            {

                //check to see if a new file has been uploaded. If not, the HiddenFor() in the View will maintain the original value (image)
                string file = "noimage.png";

                if (image != null)
                {
                    //get the name
                    file = image.FileName;

                    //capture the extension
                    string ext = file.Substring(file.LastIndexOf("."));

                    //Create a "Whitelisted" array of acceptable exts
                    string[] goodExts = { ".jpg", ".jpeg", ".png", ".gif" };

                    //Check the extension and file size
                    if (goodExts.Contains(ext.ToLower()) && image.ContentLength < 4194304)
                    {
                        //create a new file name
                        file = Guid.NewGuid() + ext;

                        //Resize the image
                        string savePath = Server.MapPath("~/Content/img/");

                        Image convertedImage = Image.FromStream(image.InputStream);

                        int maxImageSize = 500;
                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);

                        if (student.PhotoUrl != null && student.PhotoUrl != "noimage.png")
                        {
                            string path = Server.MapPath("~/Content/img/");
                            ImageUtility.Delete(path, student.PhotoUrl);
                        }
                    }
                    //update the property of the book object
                    student.PhotoUrl = file;
                }


                db.Entry(student).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");

            }
            ViewBag.SSID = new SelectList(db.StudentStatuses, "SSID", "SSName", student.SSID);
            return View(student);
        }

        // GET: Students/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // POST: Students/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            Student student = db.Students.Find(id);
            //Delete the image file:
            string path = Server.MapPath("~/Content/img/");
            ImageUtility.Delete(path, student.PhotoUrl);

            db.Students.Remove(student);
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