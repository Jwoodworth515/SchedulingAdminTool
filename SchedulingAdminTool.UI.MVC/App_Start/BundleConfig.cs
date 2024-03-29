﻿using System.Web.Optimization;

namespace SchedulingAdminTool.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css",
                      "~/Content/css/bootstrap.min.css",
                      "~/Content/css/bootstrap-theme.min.css",
                      "~/Content/css/fontAwesome.css",
                      "~/Content/css/light-box.css",
                      "~/Content/css/templatemo-style.css",
                      "~/Content/DataTables/css/jquery.dataTables.min.css"));


            bundles.Add(new ScriptBundle("~/bundles/template").Include(
                "~/Scripts/js/main.js",
                "~/Scripts/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js",
                "~/Scripts/js/vendor/bootstrap.min.js",
                "~/Scripts/js/plugins.js",
                "~/Scripts/dataTables/jquery.dataTables.min.js"));

        }
    }
}
