using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project_2._2_MVC.Models;

namespace Project_2._2_MVC.ViewModels
{
    public class SongBoxInDetailViewModel
    {
        private string title;

        public string Title
        {
            get { return title; }
            set { title = value; }
        }

        public List<song> SongList { get; set; }
        
    }
}