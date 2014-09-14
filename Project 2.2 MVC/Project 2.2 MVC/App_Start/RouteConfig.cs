using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Project_2._2_MVC
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "MusicPlayer",
                url: "bai-hat/{songName}-{songID}",
                defaults: new { controller = "Player", action = "Song", songID = "0", songName = UrlParameter.Optional },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
           );
            routes.MapRoute(
                name: "VideoPlayer",
                url: "video/{videoName}-{videoID}",
                defaults: new { controller = "Player", action = "Video", videoID = "0", videoName = UrlParameter.Optional },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
            );
            routes.MapRoute(
                name: "PlaylistPlayer",
                url: "danh-sach-bai-hat/{playlistName}-{playlistID}",
                defaults: new { controller = "Player", action = "SongPlaylist", playlistID = "0", playlistName = UrlParameter.Optional },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
            );

            routes.MapRoute(
                name: "SongCategory",
                url: "cac-bai-hat-thuoc-the-loai-nhac-{categorytName}-{categoryID}",
                defaults: new { controller = "Category", action = "Song", categoryID = "0", categorytName = UrlParameter.Optional },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
            );

            routes.MapRoute(
                name: "videoCategory",
                url: "cac-video-clip-thuoc-the-loai-{categorytName}-{categoryID}",
                defaults: new { controller = "Category", action = "Video", categoryID = "0", categorytName = UrlParameter.Optional },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
            );

            routes.MapRoute(
                name: "playlistCategory",
                url: "cac-danh-sach-bai-hat-thuoc-the-loai-{categorytName}-{categoryID}",
                defaults: new { controller = "Category", action = "Playlist", categoryID = "0", categorytName = UrlParameter.Optional },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
            );

            routes.MapRoute(
                name: "singerCategory",
                url: "cac-ca-si-hat-the-loai-nhac-{categorytName}-{categoryID}",
                defaults: new { controller = "Category", action = "Singer", categoryID = "0", categorytName = UrlParameter.Optional },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
            );

            routes.MapRoute(
                name: "musicianCategory",
                url: "cac-nhac-si-sang-tac-nhac-{categorytName}-{categoryID}",
                defaults: new { controller = "Category", action = "Musician", categoryID = "0", categorytName = UrlParameter.Optional },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
            );

            routes.MapRoute(
                name: "HomePage",
                url: "trang-chia-se-am-nhac-truc-tuyen",
                defaults: new { controller = "Home", action = "Index" },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
            );

            routes.MapRoute(
                name: "LoginPage",
                url: "dang-nhap",
                defaults: new { controller = "Login", action = "Login" },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
            );




            routes.MapRoute(
                name: "Default",
              //  url: "{controller}/{action}/{id}",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "Project_2._2_MVC.Controllers" }
            );

        }
    }
}