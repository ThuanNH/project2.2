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
    
    public partial class singer
    {
        public singer()
        {
            this.singercategory = new HashSet<singercategory>();
            this.songsinger = new HashSet<songsinger>();
        }
    
        public int id { get; set; }
        public string fullname { get; set; }
        public string nickname { get; set; }
        public Nullable<System.DateTime> dob { get; set; }
        public Nullable<System.DateTime> dod { get; set; }
        public string moreinfo { get; set; }
        public string thumbnail { get; set; }
        public System.DateTime datecreated { get; set; }
    
        public virtual ICollection<singercategory> singercategory { get; set; }
        public virtual ICollection<songsinger> songsinger { get; set; }
    }
}
