using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project_2._2_MVC.Models;

namespace Project_2._2_MVC.ViewModels
{   
    
    public class TrangChuViewModel
    {
        public List<song> newSongs { get; set; }
        public List<song> topSong { get; set; }
        public List<video> topVideos { get; set; }
        public List<video> newVideos { get; set; }
        public List<playlist> newPlaylist { get; set; }
        public List<ads> allAds { get; set; }
        public TrangChuViewModel() {
            MusicWeb_DBEntities db = new MusicWeb_DBEntities();
            newSongs = db.song.OrderBy(p => p.datecreated).Take(10).ToList<song>() ;
            topSong = db.song.OrderBy(p => p.views).Take(10).ToList<song>();
            newVideos = db.video.OrderBy(p => p.datecreated).Take(12).ToList<video>();
            topVideos = db.video.OrderBy(p => p.views).Take(10).ToList<video>();
            newPlaylist = db.playlist.OrderBy(p => p.datecreated).Take(8).ToList<playlist>();
            allAds = db.ads.Where(p => p.IsActivated == true).ToList<ads>();
        }
    }
}