using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Savina.Startup))]
namespace Savina
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
