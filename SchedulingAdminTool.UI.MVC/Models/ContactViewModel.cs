using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SchedulingAdminTool.UI.MVC.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage = "Friends Don't Lie! Name is required")]        public string Name { get; set; }        [Required(ErrorMessage = "Friends Don't Lie! Email is required")]        [DataType(DataType.EmailAddress)] //EmailAddress is an option that pops up in intellisense
        public string Email { get; set; }        [Required(ErrorMessage = "Friends Don't Lie! Subject is required")]        public string Subject { get; set; }        [Required(ErrorMessage = "Friends Don't Lie! Message is required")]        [UIHint("MultilineText")]        public string Message { get; set; }


    }
}