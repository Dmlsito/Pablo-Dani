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
    /// Lógica de interacción para Ejercicio4.xaml
    /// </summary>
    public partial class Ejercicio4 : Window
    {
        public Ejercicio4()
        {
            InitializeComponent();
            // Añadir items a un combobox en codigo //
            cbOpciones.Items.Add("Hola");
            cbOpciones.Items.Add("Despedir");
            
            
        }
        
        // Comparacion de items seleccionados por su contenido //
        private void cbOpciones_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cbOpciones.SelectedItem.Equals("Hola"))
            {   
                Hola hola = new Hola();
                // Indico clase que va a mostrar en el controlador Frame //
                frameMostrado.Navigate(hola);
            }
            if (cbOpciones.SelectedItem.Equals("Despedir")) {

                Ciao ciao = new Ciao();
                frameMostrado.Navigate(ciao);
            
            }
        }
        
    }
}
