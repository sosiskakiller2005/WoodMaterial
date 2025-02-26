using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using WoodMaterial.Model;

namespace WoodMaterial
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        private static WoodMaterialDbEntities _context;
        public static WoodMaterialDbEntities GetContext()
        {
            if (_context == null)
            {
                _context = new WoodMaterialDbEntities();
            }
            return _context;
        }
    }
}
