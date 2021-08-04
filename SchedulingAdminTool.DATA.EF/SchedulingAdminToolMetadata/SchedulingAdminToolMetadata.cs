using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace SchedulingAdminTool.DATA.EF/*.SchedulingAdminToolMetadata*/
{
    class SchedulingAdminToolMetadata
    {

        #region CourseMetadata

        public class CourseMetadata
        {
            //public int CourseId { get; set; }

            [Required(ErrorMessage = "Course Name is required")]
            [StringLength(50, ErrorMessage = "Value must be 50 characters or less")]
            [Display(Name = "Course Name")]
            public string CourseName { get; set; }

            [Required(ErrorMessage = "Course Description is required")]
            [Display(Name = "Course Description")]
            [UIHint("MultilineText")]
            public string CourseDescription { get; set; }

            [Required(ErrorMessage = "Credit Hours is required")]
            [Display(Name = "Credit Hours")]
            public byte CreditHours { get; set; }

            [StringLength(250, ErrorMessage = "Value must be 250 characters or less")]
            public string Curriculum { get; set; }

            [StringLength(500, ErrorMessage = "Value must be 500 characters or less")]
            public string Notes { get; set; }

            [Required(ErrorMessage = "Active Status is required")]
            public bool IsActive { get; set; }
        }

        [MetadataType(typeof(CourseMetadata))]
        public partial class Course
        {

        }

        #endregion

        #region EnrollmentMetadata

        public class EnrollmentMetadata
        {
            //public int EnrollmentId { get; set; }

            [Required(ErrorMessage = "Student Id is required")]
            [Display(Name = "Student Id")]
            public int StudentId { get; set; }

            [Required(ErrorMessage = "Scheduled Class Id is required")]
            [Display(Name = "Scheduled Class Id")]
            public int ScheduledClassId { get; set; }

            [Required(ErrorMessage = "Enrollment Date is required")]
            [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
            [Display(Name = "Enrollment Date")]
            public System.DateTime EnrollmentDate { get; set; }
        }

        [MetadataType(typeof(EnrollmentMetadata))]
        public partial class Enrollment
        {

        }

        #endregion

        #region ScheduledClassMetadata

        public class ScheduledClassMetadata
        {
            //public int ScheduleClassId { get; set; }

            [Required(ErrorMessage = "Course Id is required")]
            [Display(Name = "Course Id")]
            public int CourseId { get; set; }

            [Required(ErrorMessage = "Start Date is required")]
            [Display(Name = "Start Date")]
            [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
            public System.DateTime StartDate { get; set; }

            [Required(ErrorMessage = "End Date is required")]
            [Display(Name = "End Date")]
            [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
            public System.DateTime EndDate { get; set; }

            [Required(ErrorMessage = "Instructor Name is required")]
            [Display(Name = "Instructor Name")]
            [StringLength(40, ErrorMessage = "Value must be 40 characters or less")]
            public string InstructorName { get; set; }

            [Required(ErrorMessage = "Location is required")]

            public string Location { get; set; }
            [StringLength(20, ErrorMessage = "Value must be 20 characters or less")]
            [Required(ErrorMessage = "Scheduled Class Status Id is required")]
            [Display(Name = "Scheduled Class Status Id")]
            public int SCSID { get; set; }
        }

        [MetadataType(typeof(ScheduledClassMetadata))]
        public partial class ScheduledClass
        {

        }

        #endregion

        #region ScheduledClassStatusMetadata

        public class ScheduledClassStatusMetadata
        {
            //public int SCSID { get; set; }

            [Required(ErrorMessage = "Scheduled Class Status is required")]
            [StringLength(50, ErrorMessage = "Value must be 50 characters or less")]
            [Display(Name = "Class Status Name")]
            public string SCSName { get; set; }
        }

        [MetadataType(typeof(ScheduledClassStatusMetadata))]
        public partial class ScheduledClassStatus
        {

        }

        #endregion

        #region StudentMetadata

        public class StudentMetadata
        {
            //public int StudentId { get; set; }

            [Required(ErrorMessage = "First Name is required")]
            [Display(Name = "First Name")]
            [StringLength(20, ErrorMessage = "Value must be 20 characters or less")]
            public string FirstName { get; set; }

            [Required(ErrorMessage = "Last Name is required")]
            [Display(Name = "Last Name")]
            [StringLength(20, ErrorMessage = "Value must be 20 characters or less")]
            public string LastName { get; set; }

            [StringLength(15, ErrorMessage = "Value must be 15 characters or less")]
            public string Major { get; set; }

            [StringLength(50, ErrorMessage = "Value must be 50 characters or less")]
            public string Address { get; set; }

            [StringLength(25, ErrorMessage = "Value must be 25 characters or less")]
            public string City { get; set; }

            [StringLength(2, ErrorMessage = "Value must be 2 characters or less")]
            public string State { get; set; }

            [Display(Name = "Zip")]
            [StringLength(10, ErrorMessage = "Value must be 10 characters or less")]
            public string ZipCode { get; set; }

            [StringLength(13, ErrorMessage = "Value must be 13 characters or less")]
            public string Phone { get; set; }

            [Required(ErrorMessage = "Email is required")]
            [StringLength(60, ErrorMessage = "Value must be 60 characters or less")]
            public string Email { get; set; }

            [Display(Name = "Student Photo")]
            [StringLength(100, ErrorMessage = "Value must be 100 characters or less")]
            public string PhotoUrl { get; set; }

            [Required(ErrorMessage = "Student Status Id is required")]
            [Display(Name = "Student Status Id")]
            public int SSID { get; set; }
        }

        [MetadataType(typeof(StudentMetadata))]
        public partial class Student
        {

        }

        #endregion

        #region StudentStatusMetadata

        public class StudentStatusMetadata
        {
            //public int SSID { get; set; }

            [Required(ErrorMessage = "Student Status Name is required")]
            [Display(Name = "Student Status Name")]
            [StringLength(30, ErrorMessage = "Value must be 30 characters or less")]
            public string SSName { get; set; }

            [Display(Name = "Student Status Description")]
            [StringLength(250, ErrorMessage = "Value must be 250 characters or less")]
            [UIHint("MultilineText")]
            public string SSDescription { get; set; }
        }

        [MetadataType(typeof(StudentStatusMetadata))]
        public partial class StudentStatus
        {

        }

        #endregion
    }
}
