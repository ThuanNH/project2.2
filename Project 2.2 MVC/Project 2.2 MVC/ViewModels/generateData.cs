using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Project_2._2_MVC.Models;

namespace Project_2._2_MVC.ViewModels
{
    public class generateData
    {
        public generateData() {

            MusicWeb_DBEntities db = new MusicWeb_DBEntities();
            string[] ho = {"Nguyễn","Trần","Lê","Hoài","Trương","Huỳnh","Quách","Jonny","Amanda" ,"Quang"};
            string[] tenlot = { "hoàng", "công", "văn", "thị", "trinh", "Quang", "Mạnh", "Hiếu", "Thành", "Sơn" };
            string[] ten = { "Mạnh", "Hiếu", "Thành", "Sơn", "Etheridge", "Lê", "Hồ", "Quang", "Hiếu", "Nguyễn" };
            Random rd = new Random();
            for (int i = 0; i < 100; i++)
            {
                string name ="";
                name += ho[rd.Next(9)];
                name+=" ";
                name += tenlot[rd.Next(9)];
                name+=" ";
                name += ten[rd.Next(9)];
                string nickname = "";
                nickname += ho[rd.Next(9)];
                nickname += " ";
                nickname += ten[rd.Next(9)];
                singer sn = new singer();
                sn.nickname = nickname;
                sn.fullname = name;
                singercategory scc = new singercategory();
                scc.categoryid  = db.category.FirstOrDefault().id;
                sn.singercategory.Add(scc);

                //List<category> categories = new List<category>();
              
                //for (int j = 0; j < 3; j++)
                //{
                //    try
                //    {
                //        int num = db.category.Count() - 1;
                //        category ct = db.category.ToList()[num];
                //        singercategory sc = new singercategory();
                //        sc.category = ct;
                //        sn.singercategory.Add(sc);
                //    }
                //    catch (Exception) { };

                
                //}
              
                sn.thumbnail = "default.jpg";
           //     db.singer.Add(sn);
            //    db.SaveChanges();
            }
           



        }
    }
}