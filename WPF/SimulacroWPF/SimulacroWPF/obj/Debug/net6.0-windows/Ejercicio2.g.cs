﻿#pragma checksum "..\..\..\Ejercicio2.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "0623739D412142D1B07B1B8DC40850EBFF9E0967"
//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

using SimulacroWPF;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace SimulacroWPF {
    
    
    /// <summary>
    /// Ejercicio2
    /// </summary>
    public partial class Ejercicio2 : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 16 "..\..\..\Ejercicio2.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.CheckBox cbNombre;
        
        #line default
        #line hidden
        
        
        #line 17 "..\..\..\Ejercicio2.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.CheckBox cbApellido;
        
        #line default
        #line hidden
        
        
        #line 18 "..\..\..\Ejercicio2.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lbNombre;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\..\Ejercicio2.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Label lbApellido;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "6.0.10.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/SimulacroWPF;component/ejercicio2.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Ejercicio2.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "6.0.10.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.cbNombre = ((System.Windows.Controls.CheckBox)(target));
            
            #line 16 "..\..\..\Ejercicio2.xaml"
            this.cbNombre.Checked += new System.Windows.RoutedEventHandler(this.cbNombre_Checked);
            
            #line default
            #line hidden
            
            #line 16 "..\..\..\Ejercicio2.xaml"
            this.cbNombre.Click += new System.Windows.RoutedEventHandler(this.Click1);
            
            #line default
            #line hidden
            return;
            case 2:
            this.cbApellido = ((System.Windows.Controls.CheckBox)(target));
            
            #line 17 "..\..\..\Ejercicio2.xaml"
            this.cbApellido.Checked += new System.Windows.RoutedEventHandler(this.cbApellido_Checked);
            
            #line default
            #line hidden
            
            #line 17 "..\..\..\Ejercicio2.xaml"
            this.cbApellido.Click += new System.Windows.RoutedEventHandler(this.Click2);
            
            #line default
            #line hidden
            return;
            case 3:
            this.lbNombre = ((System.Windows.Controls.Label)(target));
            return;
            case 4:
            this.lbApellido = ((System.Windows.Controls.Label)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

