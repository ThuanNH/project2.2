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
    
    public partial class songmusician
    {
        public int id { get; set; }
        public int musicianid { get; set; }
        public int songid { get; set; }
    
        public virtual musician musician { get; set; }
        public virtual song song { get; set; }
    }
}
