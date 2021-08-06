using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Collections.Generic;
using SchedulingAdminTool.DATA.EF;
using System.Data.Entity;
using System.Data;

namespace SchedulingAdminTool.UI.MVC.Controllers
{
    public class GridFilterController : Controller
    {
        private SchedulingAdminToolEntities db = new SchedulingAdminToolEntities();
        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult CoursesTable()
        {
            DbSet<Course> courses = db.Courses;
            return View(courses.ToList());
        }

        public ActionResult CoursesGrid()
        {

            ViewBag.Courses = db.Courses.Select(x => x.CourseName).ToList();

            List<Course> courses = db.Courses.ToList();

            return View(courses);

            //ViewBag.Course = db.Courses.Select(x => x.CourseId).ToList();
            //ViewBag.ScheduledClasses = db.ScheduledClasses.Select(x => x.CourseId).ToList();

            //List<Course> courses = db.Courses.Include(b => b.IsActive).ToList();
            //return View(courses);
        }


    }
}
