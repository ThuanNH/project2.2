using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project_2._2_MVC.Models;

namespace Project_2._2_MVC.ViewModels
{
    public class TheLoaiBaiHatVM
    {       
        public List<song> songs { get; set; }

        public TheLoaiBaiHatVM()
        {
            MusicWeb_DBEntities db = new MusicWeb_DBEntities();
            songs = db.song.ToList<song>() ;
        }
    }
}