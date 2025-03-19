using System;
using System.Linq;
using System.Windows;

namespace bibliya
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private libraryEntities _context = new libraryEntities();
        public MainWindow()
        {
            InitializeComponent();
            LoadReaders();
        }
        private void LoadReaders()
        {
            try
            {
                
                var readers = _context.Readers
                    .Select(r => new
                    {
                        r.id,
                        r.full_name,
                        r.library_card_number,
                        BooksOnHand = r.BookLoans.Count(bl => bl.return_date == null)
                    })
                    .ToList() 
                    .Select(r => new
                    {
                        r.id,
                        r.full_name,
                        r.library_card_number,
                        r.BooksOnHand,
                        Fine = CalculateFine(r.id) 
                    })
                    .ToList();

                ReadersDataGrid.ItemsSource = readers;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при загрузке читателей: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private decimal CalculateFine(int readerId)
        {
            var fines = _context.Fines
                .Where(f => f.reader_id == readerId)
                .Sum(f => f.fine_amount);

            return (decimal)fines;
        }

        private decimal CalculateFine(int readerId, int bookId, int daysOverdue, string bookType)
        {
            if (readerId <= 0 || bookId <= 0 || daysOverdue < 0)
                return -1;

            decimal finePerDay = 0;
            switch (bookType.ToLower())
            {
                case "учебная":
                    finePerDay = 10;
                    break;
                case "художественная":
                    finePerDay = 5;
                    break;
                case "научная":
                    finePerDay = 15;
                    break;
                default:
                    return -1;
            }

            return daysOverdue * finePerDay;
        }

        private void AddReaderButton_Click(object sender, RoutedEventArgs e)
        {
            var editWindow = new EditReaderWindow();
            editWindow.Show();
            this.Close();

        }
    }
}
