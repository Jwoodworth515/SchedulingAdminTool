﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace SchedulingAdminTool.UI.MVC.Models
{
    public class ContactViewModel
    {
        [Required(ErrorMessage = "Friends Don't Lie! Name is required")]
        public string Email { get; set; }


    }
}