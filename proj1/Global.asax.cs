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
                Runtime.PythonDLL = @"C:\Program Files\WindowsApps\PythonSoftwareFoundation.Python.3.12_3.12.2800.0_x64__qbz5n2kfra8p0\python312.dll";
                // Replace 'YourUsername' with your actual PC name
                string pythonHome = @"C:\Users\Admin\AppData\Local\Packages\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\LocalCache\local-packages\Python312\site-packages";

                // Add this to the Python Search Path
                PythonEngine.PythonPath = PythonEngine.PythonPath + ";" + pythonHome;
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