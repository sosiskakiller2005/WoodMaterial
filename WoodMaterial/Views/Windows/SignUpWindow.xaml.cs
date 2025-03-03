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
    /// Логика взаимодействия для SignUpWindow.xaml
    /// </summary>
    public partial class SignUpWindow : Window
    {
        private static WoodMaterialDbEntities _context = App.GetContext();
        public SignUpWindow()
        {
            InitializeComponent();
        }

        private void AuthoriseHl_Click(object sender, RoutedEventArgs e)
        {
            AuthorisationWindow authorisationWindow = new AuthorisationWindow();
            authorisationWindow.Show();
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

        private void RepeatPasswordTb_GotFocus(object sender, RoutedEventArgs e)
        {
            if (RepeatPasswordTb.Password == "Повторите пароль")
            {
                RepeatPasswordTb.Password = string.Empty;
            }
        }

        private void RepeatPasswordTb_LostFocus(object sender, RoutedEventArgs e)
        {
            if (RepeatPasswordTb.Password == string.Empty)
            {
                RepeatPasswordTb.Password = "Повторите пароль";
            }
        }

        private void EntryBtn_Click(object sender, RoutedEventArgs e)
        {
            if (LoginTb.Text != string.Empty && PasswordTb.Password != string.Empty && RepeatPasswordTb.Password != string.Empty)
            {
                User newUser = new User()
                {
                    Login = LoginTb.Text,
                    Password = PasswordTb.Password
                };
                _context.User.Add(newUser);
                _context.SaveChanges();
                MessageBoxHelper.Information("Регистрация прошла успешно");
                AuthorisationWindow authorisationWindow = new AuthorisationWindow();
            }
        }

        private void ForgotPasswordHl_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
