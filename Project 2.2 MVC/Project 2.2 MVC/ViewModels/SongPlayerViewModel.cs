using Project_2._2_MVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_2._2_MVC.ViewModels
{
    public class SongPlayerViewModel
    {
        public song Song { get; set; }
        public List<comments> comments { get; set; }
    }
}