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
    /// Lógica de interacción para Ejercicio3.xaml
    /// </summary>
    public partial class Ejercicio3 : Window
    {
        public Ejercicio3()
        {
            InitializeComponent();
        }

        // IsIndeterminate = true es que empieza la animacion //
        private void bIniciar_Click(object sender, RoutedEventArgs e)
        {
            pbProgreso.IsIndeterminate = true;
        }

        // IsIndeterminate = false es que empieza la animacion //
        private void bParar_Click(object sender, RoutedEventArgs e)
        {
            pbProgreso.IsIndeterminate = false;
        }
    }
}
