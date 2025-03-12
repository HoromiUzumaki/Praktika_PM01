using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace WarehouseMob
{
    public partial class MainPage : ContentPage
    {
        private readonly AuthService _authService;
        public MainPage()
        {
            InitializeComponent();
            _authService = new AuthService(App.Database);
        }
        private async void OnLoginClicked(object sender, EventArgs e)
        {
            var email = EmailEntry.Text;
            var password = PasswordEntry.Text;

            try
            {
                // Первый этап: проверка почты и пароля
                var пользователь = await _authService.AuthenticateAsync(email, password);

                // Второй этап: двухфакторная аутентификация (ввод роли)
                var роль = await DisplayPromptAsync("Двухфакторная аутентификация", "Введите вашу роль:");

                if (_authService.VerifyRole(пользователь, роль))
                {
                    // Успешная аутентификация
                    App.CurrentUser = пользователь;
                    await DisplayAlert("Успех", "Аутентификация прошла успешно!", "OK");
                    await Navigation.PushAsync(new TabbedPage1()); // Переход на главную страницу
                }
                else
                {
                    await DisplayAlert("Ошибка", "Неверная роль.", "OK");
                }
            }
            catch (Exception ex)
            {
                await DisplayAlert("Ошибка", ex.Message, "OK");
            }
        }
    }
}