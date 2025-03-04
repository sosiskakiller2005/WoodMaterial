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
using WoodMaterial.AppData;
using WoodMaterial.Model;

namespace WoodMaterial.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddEditClientWindow.xaml
    /// </summary>
    public partial class AddEditClientWindow : Window
    {
        private WoodMaterialDbEntities _context = App.GetContext();
        private Client _selectedClient;
        private bool _isEdit;
        public AddEditClientWindow()
        {
            InitializeComponent();
            _isEdit = false;
        }
        public AddEditClientWindow(Client selectedClient)
        {
            InitializeComponent();
            _selectedClient = selectedClient;
            ClientGrid.DataContext = selectedClient;
            _isEdit = true;
        }

        private void OkBtn_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(AdressTb.Text) && !string.IsNullOrEmpty(FullnameTb.Text) && RegistrationDp.SelectedDate.HasValue && 
                !string.IsNullOrEmpty(PhoneTb.Text) && WhenToRemindDp.SelectedDate.HasValue && !string.IsNullOrEmpty(WhatToRemindTb.Text))
            {
                switch (_isEdit)
                {
                    case true:
                        _selectedClient.Adress = AdressTb.Text;
                        _selectedClient.Fullname = FullnameTb.Text;
                        _selectedClient.DateOfRegistration = RegistrationDp.SelectedDate.Value;
                        _selectedClient.Phone = PhoneTb.Text;
                        _selectedClient.WhenToRemind = WhenToRemindDp.SelectedDate.Value;
                        _selectedClient.WhatToRemind = WhatToRemindTb.Text;
                        _context.SaveChanges();
                        MessageBoxHelper.Information("Данные успешно изменены");
                        Close();
                        break;
                    case false:
                        Client newClient = new Client
                        {
                            Adress = AdressTb.Text,
                            Fullname = FullnameTb.Text,
                            DateOfRegistration = RegistrationDp.SelectedDate.Value,
                            Phone = PhoneTb.Text,
                            WhenToRemind = WhenToRemindDp.SelectedDate.Value,
                            WhatToRemind = WhatToRemindTb.Text
                        };
                        _context.Client.Add(newClient);
                        _context.SaveChanges();
                        MessageBoxHelper.Information("Клиент успешно добавлен");
                        Close();
                        break;
                }
            }
            else
            {
                MessageBoxHelper.Error("Заполните все поля");
            }
        }

        private void CancelBtn_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
