using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using WoodMaterial.Model;

namespace WoodMaterial.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для ClientsWindow.xaml
    /// </summary>
    public partial class ClientsWindow : Window
    {
        private WoodMaterialDbEntities _context = App.GetContext();
        public ClientsWindow()
        {
            InitializeComponent();
            ClientsDg.ItemsSource = _context.Client.ToList();
        }

        private void AddBtn_Click(object sender, RoutedEventArgs e)
        {
            AddEditClientWindow addEditClientWindow = new AddEditClientWindow();
            addEditClientWindow.ShowDialog();
            if (addEditClientWindow.DialogResult == true)
            {
                ClientsDg.ItemsSource = App.GetContext().Client.ToList();
            }
        }

        private void EditBTn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void DeleteBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void FilterBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void AmountBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void RefreshBtn_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ClientsDg_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            AddEditClientWindow addEditClientWindow = new AddEditClientWindow(ClientsDg.SelectedItem as Client);
            addEditClientWindow.ShowDialog();
            if (addEditClientWindow.DialogResult == true)
            {
                ClientsDg.ItemsSource = App.GetContext().Client.ToList();
            }
        }
    }
}
