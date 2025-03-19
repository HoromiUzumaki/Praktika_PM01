using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
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

namespace bibliya
{
    /// <summary>
    /// Логика взаимодействия для EditReaderWindow.xaml
    /// </summary>
    public partial class EditReaderWindow : Window
    {
        private libraryEntities _context = new libraryEntities();
        public EditReaderWindow()
        {
            InitializeComponent();
        
        }
        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var reader = new Readers
                {
                    full_name = FullNameTextBox.Text,
                    library_card_number = LibraryCardNumberTextBox.Text,
                    address = AddressTextBox.Text,
                    phone = PhoneTextBox.Text,
                    email = EmailTextBox.Text
                };

                _context.Readers.Add(reader);
                _context.SaveChanges();
                MessageBox.Show("Читатель успешно добавлен!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);             
                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            var MainWindow = new MainWindow();
            MainWindow.Show();
            this.Close();
        }
    }
}
