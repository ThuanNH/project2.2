//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Project_2._2_MVC.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class category
    {
        public category()
        {
            this.playlistcategory = new HashSet<playlistcategory>();
            this.singercategory = new HashSet<singercategory>();
            this.songcategory = new HashSet<songcategory>();
            this.videocategory = new HashSet<videocategory>();
        }
    
        public int id { get; set; }
        public string name { get; set; }
        public int categorytypeid { get; set; }
        public string thumbnail { get; set; }
        public string moreinfo { get; set; }
    
        public virtual categorytype categorytype { get; set; }
        public virtual ICollection<playlistcategory> playlistcategory { get; set; }
        public virtual ICollection<singercategory> singercategory { get; set; }
        public virtual ICollection<songcategory> songcategory { get; set; }
        public virtual ICollection<videocategory> videocategory { get; set; }
    }
}