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
    
    public partial class menuContainer
    {
        public menuContainer()
        {
            this.menuItem = new HashSet<menuItem>();
        }
    
        public int id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
    
        public virtual ICollection<menuItem> menuItem { get; set; }
    }
}