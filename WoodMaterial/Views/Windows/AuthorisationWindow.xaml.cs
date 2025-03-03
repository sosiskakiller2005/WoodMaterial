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

namespace WoodMaterial.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для AuthorisationWindow.xaml
    /// </summary>
    public partial class AuthorisationWindow : Window
    {
        public AuthorisationWindow()
        {
            InitializeComponent();
        }

        private void EntryBtn_Click(object sender, RoutedEventArgs e)
        {
            if (AuthorisationHelper.Authorise(LoginTb.Text, PasswordTb.Password))
            {
                ClientsWindow clientsWindow = new ClientsWindow();
                clientsWindow.Show();
                Close();
            }
        }

        private void ForgotPasswordHl_Click(object sender, RoutedEventArgs e)
        {

        }

        private void SignUpHl_Click(object sender, RoutedEventArgs e)
        {
            SignUpWindow signUpWindow = new SignUpWindow();
            signUpWindow.Show();
            Close();
        }

        private void LoginTb_GotFocus(object sender, RoutedEventArgs e)
        {
            if (LoginTb.Text == "Введите логин")
            {
                LoginTb.Text = string.Empty;
            }
        }

        private void LoginTb_LostFocus(object sender, RoutedEventArgs e)
        {
            if (LoginTb.Text == string.Empty)
            {
                LoginTb.Text = "Введите логин";
            }
        }

        private void PasswordTb_GotFocus(object sender, RoutedEventArgs e)
        {
            if (PasswordTb.Password == "Введите пароль")
            {
                PasswordTb.Password = string.Empty;
            }
        }

        private void PasswordTb_LostFocus(object sender, RoutedEventArgs e)
        {
            if (PasswordTb.Password == string.Empty)
            {
                PasswordTb.Password = "Введите пароль";
            }
        }
    }
}
