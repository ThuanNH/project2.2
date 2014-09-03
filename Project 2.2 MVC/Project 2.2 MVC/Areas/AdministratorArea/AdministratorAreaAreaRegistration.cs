using System.Web.Mvc;

namespace Project_2._2_MVC.Areas.AdministratorArea
{
    public class AdministratorAreaAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "AdministratorArea";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "AdministratorArea_default",
                "AdministratorArea/{controller}/{action}/{id}",
                new { controller = "Login", action = "Login", id = UrlParameter.Optional }
            );
        }
    }
}
