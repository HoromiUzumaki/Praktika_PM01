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

namespace bibliya
{
    /// <summary>
    /// Логика взаимодействия для BookHistoryWindow.xaml
    /// </summary>
    public partial class BookHistoryWindow : Window
    {
        private libraryEntities _context = new libraryEntities();
        public BookHistoryWindow()
        {
            InitializeComponent();
            
        }
       
    }
}
