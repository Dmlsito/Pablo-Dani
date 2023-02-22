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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace SimulacroWPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Ejercicio1 ventana = new Ejercicio1();
            ventana.Show();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            Ejercicio2 ventana = new Ejercicio2();
            ventana.Show();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            Ejercicio3 ventana = new Ejercicio3();
            ventana.Show();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            Ejercicio4 ventana = new Ejercicio4();
            ventana.Show();
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            PruebaPosicionamientoRelativo ventana = new PruebaPosicionamientoRelativo();
            ventana.Show();
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            Ejercicio1Examen ventana = new Ejercicio1Examen();
            ventana.Show();
        }
    }
}
