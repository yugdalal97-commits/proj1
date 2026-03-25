using Python.Runtime;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace proj1
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            // This only runs ONCE when the website starts
            if (!PythonEngine.IsInitialized)
            {
                Runtime.PythonDLL = @"C:\Users\Admin\AppData\Local\Programs\Python\Python314\python314.dll";
                PythonEngine.Initialize();
                PythonEngine.BeginAllowThreads(); // This is vital for web threading
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}