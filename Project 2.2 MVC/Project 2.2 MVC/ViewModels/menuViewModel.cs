using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_2._2_MVC.ViewModels
{
    public class menuViewModel
    {
        public List<Models.category> categories { get; set; }
        public List<Models.category> SongCategories { get; set; }
        public List<Models.category> VideoCategories { get; set; }
        public menuViewModel() {
            categories = new List<Models.category>();
            SongCategories = new List<Models.category>();
            VideoCategories = new List<Models.category>();
        }
    }
}