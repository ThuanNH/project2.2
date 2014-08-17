using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;


namespace Project_2._2_MVC
{
    public static class util
    {
        // video util functions
        /// <summary>
        /// Hàm getVideoImageFullPath() nhận vào tên ảnh trả về đường dẫn tuyệt đối của ảnh 
        /// vd: truyền vào 'anh1.jpg' --> 'c:\anh\anh1.jpg' --> dùng đường dẫn này để lưu ảnh xuống, ko để load ảnh lên web
        /// </summary>
        /// <param name="imageFullname">tên ảnh vd: anh1.jpg</param>
        /// <returns></returns>
        public static string getVideoImageFullPath(string imageFullname) {
            return HostingEnvironment.MapPath(Path.Combine(constants.videoImageDir, imageFullname));
        }
      
        
        /// <summary>
        /// Hàm getVideoImageRootPath() nhận vào tên ảnh trả về đường dẫn tương đối của ảnh 
        /// vd: truyền vào 'anh1.jpg' -->  '\anh\anh1.jpg'  --> dùng dường dẫn này để load ảnh lên web
        /// </summary>
        /// <param name="imageFullname">tên ảnh vd: anh1.jpg</param>
        /// <returns></returns>
        public static string getVideoImageRootPath(string imageFullname)
        {
            return Path.Combine(constants.videoImageDir, imageFullname);
        }

        /// 
        /// 
        /// 
        /// 
        /// 
        /// các hàm còn lại tương tự với mỗi đối tượng khác nhau vd:playlist, singer, slideshow ...
        ///                                                         
        ///
        ///
        ///

        public static string getVideoThumbFullPath(string imageFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.videoThumbDir, imageFullname));
        }
        public static string getVideoThumbRootPath(string imageFullname)
        {
            return Path.Combine(constants.videoThumbDir, imageFullname);
        }
        public static string getVideoFullPath(string videoFileFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.videoThumbDir, videoFileFullname));
        }
        public static string getVideoRootPath(string videoFileFullname)
        {
            return Path.Combine(constants.videoThumbDir, videoFileFullname);
        }
        
        // playlist util functions
        public static string getplaylistImageFullPath(string imageFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.playlistImageDir, imageFullname));
        }
        public static string getplaylistImageRootPath(string imageFullname)
        {
            return Path.Combine(constants.playlistImageDir, imageFullname);
        }
        public static string getplaylistThumbFullPath(string imageFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.playlistThumbDir, imageFullname));
        }
        public static string getplaylistThumbRootPath(string imageFullname)
        {
            return Path.Combine(constants.playlistThumbDir, imageFullname);
        }
       
        // singer util functions
        public static string getsingerImageFullPath(string imageFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.singerImageDir, imageFullname));
        }
        public static string getsingerImageRootPath(string imageFullname)
        {
            return Path.Combine(constants.singerImageDir, imageFullname);
        }
        public static string getsingerThumbFullPath(string imageFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.singerThumbDir, imageFullname));
        }
        public static string getsingerThumbRootPath(string imageFullname)
        {
            return Path.Combine(constants.singerThumbDir, imageFullname);
        }

        // musician util functions
        public static string getmusicianImageFullPath(string imageFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.musicianImageDir, imageFullname));
        }
        public static string getmusicianImageRootPath(string imageFullname)
        {
            return Path.Combine(constants.musicianImageDir, imageFullname);
        }
        public static string getmusicianThumbFullPath(string imageFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.musicianThumbDir, imageFullname));
        }
        public static string getmusicianThumbRootPath(string imageFullname)
        {
            return Path.Combine(constants.musicianThumbDir, imageFullname);
        }

        // slideshow util functions
        public static string getslideshowImageFullPath(string imageFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.slideshowImageDir, imageFullname));
        }
        public static string getslideshowImageRootPath(string imageFullname)
        {
            return Path.Combine(constants.slideshowImageDir, imageFullname);
        }
        public static string getslideshowThumbFullPath(string imageFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.slideshowThumbDir, imageFullname));
        }
        public static string getslideshowThumbRootPath(string imageFullname)
        {
            return Path.Combine(constants.slideshowThumbDir, imageFullname);
        }
      
        // music util functions
        public static string getmusicFullPath(string musicFileFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.musicDir, musicFileFullname));
        }
        public static string getmusicRootPath(string musicFileFullname)
        {
            return Path.Combine(constants.musicDir, musicFileFullname);
        }

        // lyric util functions
        public static string getlyricFullPath(string lyricFileFullname)
        {
            return HostingEnvironment.MapPath(Path.Combine(constants.lyricDir, lyricFileFullname));
        }
        public static string getlyricRootPath(string lyricFileFullname)
        {
            return Path.Combine(constants.lyricDir, lyricFileFullname);
        }

        /// <summary>
        /// Dùng để upload file
        /// </summary>
        /// <param name="clientPostedFiles">danh sách HttpPostedFileBase được up lên từ client</param>
        /// <param name="saveDir">Đường dẫn folder sẽ lưu file</param>
        /// <returns></returns>
        public static List<HttpPostedFileBase> UploadFile(List<HttpPostedFileBase> clientPostedFiles, string saveDir)
        {
            List<HttpPostedFileBase> failedFiles = new List<HttpPostedFileBase>();
            foreach (var item in clientPostedFiles)
            {
                try
                {
                    var fullPath = HostingEnvironment.MapPath(Path.Combine(saveDir, item.FileName));
                    item.SaveAs(fullPath);

                }
                catch (Exception)
                {
                    failedFiles.Add((HttpPostedFileBase)item);
                }
            }
            return failedFiles;
            
        }

        /// <summary>
        /// Dùng để upload và tạo thumbnail cho image cùng lúc
        /// </summary>
        /// <param name="clientPostedFiles">danh sách HttpPostedFileBase được up lên từ client</param>
        /// <param name="saveImageDir">Đường dẫn folder sẽ lưu ảnh</param>
        /// <param name="saveThumbDir">Đường dẫn folder sẽ lưu thumb</param>
        /// <param name="thumbWith">Chiều dài của thumb</param>
        /// <param name="thumbHeight">Chiều cao của thumb</param>
        /// <returns></returns>
        public static List<HttpPostedFileBase> UploadImagesAndCreateThumbs(List<HttpPostedFileBase> clientPostedFiles, string saveImageDir,string saveThumbDir,int thumbWith,int thumbHeight)
        {
            List<HttpPostedFileBase> failedFiles = new List<HttpPostedFileBase>();
            foreach (var item in clientPostedFiles)
            {
                try
                {
                    var imageFullPath = HostingEnvironment.MapPath(
                                                      Path.Combine(saveImageDir, item.FileName)
                                                            );
                    var thumFullPath = HostingEnvironment.MapPath(
                                                     Path.Combine(saveThumbDir, item.FileName)
                                                     );
                    item.SaveAs(imageFullPath);
                    ResizeImageStream(thumbWith, thumbHeight, item.InputStream, thumFullPath);

                }
                catch (Exception)
                {
                    failedFiles.Add((HttpPostedFileBase)item);
                }
            }
            return failedFiles;
            
        }

        public static void ResizeImageStream(int width,int height, Stream fileStream, string outputPath)
        {
            var image = Image.FromStream(fileStream);

            var thumbnailBitmap = new Bitmap(width, height);

            var thumbnailGraph = Graphics.FromImage(thumbnailBitmap);
            thumbnailGraph.CompositingQuality = CompositingQuality.HighQuality;
            thumbnailGraph.SmoothingMode = SmoothingMode.HighQuality;
            thumbnailGraph.InterpolationMode = InterpolationMode.HighQualityBicubic;

            var imageRectangle = new Rectangle(0, 0, width, height);
            thumbnailGraph.DrawImage(image, imageRectangle);

            thumbnailBitmap.Save(outputPath, image.RawFormat);
            thumbnailGraph.Dispose();
            thumbnailBitmap.Dispose();
            image.Dispose();
        }
    
    }
}