﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MusicWeb_DBEntities : DbContext
    {
        public MusicWeb_DBEntities()
            : base("name=MusicWeb_DBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<Account> Account { get; set; }
        public DbSet<accounttype> accounttype { get; set; }
        public DbSet<ads> ads { get; set; }
        public DbSet<adsContainer> adsContainer { get; set; }
        public DbSet<bannedaccount> bannedaccount { get; set; }
        public DbSet<bannedreason> bannedreason { get; set; }
        public DbSet<category> category { get; set; }
        public DbSet<categorytype> categorytype { get; set; }
        public DbSet<comments> comments { get; set; }
        public DbSet<favoriteplaylist> favoriteplaylist { get; set; }
        public DbSet<favoritesong> favoritesong { get; set; }
        public DbSet<favoritevideo> favoritevideo { get; set; }
        public DbSet<menuContainer> menuContainer { get; set; }
        public DbSet<menuItem> menuItem { get; set; }
        public DbSet<musician> musician { get; set; }
        public DbSet<playlist> playlist { get; set; }
        public DbSet<playlistcategory> playlistcategory { get; set; }
        public DbSet<playlistcomments> playlistcomments { get; set; }
        public DbSet<playlistitem> playlistitem { get; set; }
        public DbSet<ReportType> ReportType { get; set; }
        public DbSet<singer> singer { get; set; }
        public DbSet<singercategory> singercategory { get; set; }
        public DbSet<slideshowitem> slideshowitem { get; set; }
        public DbSet<song> song { get; set; }
        public DbSet<songcategory> songcategory { get; set; }
        public DbSet<songcomments> songcomments { get; set; }
        public DbSet<songlike> songlike { get; set; }
        public DbSet<songmusician> songmusician { get; set; }
        public DbSet<SongQuality> SongQuality { get; set; }
        public DbSet<songsinger> songsinger { get; set; }
        public DbSet<SongSource> SongSource { get; set; }
        public DbSet<sysdiagrams> sysdiagrams { get; set; }
        public DbSet<userreport> userreport { get; set; }
        public DbSet<video> video { get; set; }
        public DbSet<videocategory> videocategory { get; set; }
        public DbSet<videocomments> videocomments { get; set; }
        public DbSet<videolike> videolike { get; set; }
    }
}
