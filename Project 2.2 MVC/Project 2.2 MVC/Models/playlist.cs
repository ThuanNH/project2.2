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
    
    public partial class playlist
    {
        public playlist()
        {
            this.favoriteplaylist = new HashSet<favoriteplaylist>();
            this.playlistcategory = new HashSet<playlistcategory>();
            this.playlistcomments = new HashSet<playlistcomments>();
            this.playlistitem = new HashSet<playlistitem>();
        }
    
        public int id { get; set; }
        public int accountid { get; set; }
        public string title { get; set; }
        public string thumbnail { get; set; }
        public string moreinfo { get; set; }
        public int views { get; set; }
        public System.DateTime datecreated { get; set; }
    
        public virtual Account Account { get; set; }
        public virtual ICollection<favoriteplaylist> favoriteplaylist { get; set; }
        public virtual ICollection<playlistcategory> playlistcategory { get; set; }
        public virtual ICollection<playlistcomments> playlistcomments { get; set; }
        public virtual ICollection<playlistitem> playlistitem { get; set; }
    }
}
