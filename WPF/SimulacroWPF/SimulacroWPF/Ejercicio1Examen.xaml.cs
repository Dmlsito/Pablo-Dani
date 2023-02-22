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
    /// Lógica de interacción para Ejercicio1Examen.xaml
    /// </summary>
    public partial class Ejercicio1Examen : Window
    {
        public Ejercicio1Examen()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            ControlesHijo ventana = new ControlesHijo();
            ventana.Show();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            DeclaracionExplicita ventana = new DeclaracionExplicita();
            ventana.Show();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            DataBinding ventana = new DataBinding();
            ventana.Show();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            SliderProgressBar ventana = new SliderProgressBar();
            ventana.Show();
        }
    }
}
