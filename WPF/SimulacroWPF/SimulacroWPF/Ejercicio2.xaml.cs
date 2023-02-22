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

namespace SimulacroWPF
{
    /// <summary>
    /// Lógica de interacción para Ejercicio2.xaml
    /// </summary>
    public partial class Ejercicio2 : Window
    {
        public Ejercicio2()
        {
            InitializeComponent();
        }

        private void cbNombre_Checked(object sender, RoutedEventArgs e)
        {

        }

        private void cbApellido_Checked(object sender, RoutedEventArgs e)
        {
          
        }

        private void Click1(object sender, RoutedEventArgs e) {

            if (cbNombre.IsChecked == true)
            {
                lbNombre.Visibility = Visibility.Visible;
            }
            else
            {
                lbNombre.Visibility = Visibility.Collapsed;

            }

        }

        private void Click2(object sender, RoutedEventArgs e) {

            if (cbApellido.IsChecked == true)
            {

                lbApellido.Visibility = Visibility.Visible;

            }
            else
            {

                lbApellido.Visibility = Visibility.Collapsed;
            }
        }








    }


    
}
