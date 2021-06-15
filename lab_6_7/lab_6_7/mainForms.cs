using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace lab_6_7
{
    public partial class mainForms : Form
    {
        public mainForms()
        {
            InitializeComponent();
        }

        private void goToProductBtn_Click(object sender, EventArgs e)
        {
            Form goToProduct = new Products();
            goToProduct.Owner = this;
            goToProduct.Show();
        }

        private void goToMusicStoreBtn_Click(object sender, EventArgs e)
        {
            Form goToMusicStore = new musicStore();
            goToMusicStore.Owner = this;
            goToMusicStore.Show();
        }

        private void show1_Click(object sender, EventArgs e)
        {
            Form goToShow1 = new showProductsInTheStore();
            goToShow1.Owner = this;
            goToShow1.Show();
        }

        private void show2_Click(object sender, EventArgs e)
        {
            Form goToShow2 = new showProductsInThePriceRange();
            goToShow2.Owner = this;
            goToShow2.Show();
        }
    }
}
