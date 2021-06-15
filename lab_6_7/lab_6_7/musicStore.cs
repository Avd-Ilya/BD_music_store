using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace lab_6_7
{
    public partial class musicStore : Form
    {
        public musicStore()
        {
            InitializeComponent();
        }

        public int musicStoreID { get; set; }
        public int count { get; set; }

        MySqlConnection con = new MySqlConnection("Server=localhost;port=3307;username=root;password=root;database=lab3");

        private void insertBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsValid())
                {
                    MySqlCommand cmd = new MySqlCommand("INSERT INTO `lab3`.`music_store` (adress) VALUES (@adress)", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@adress", adressLbl.Text);

                    con.Open();
                    cmd.ExecuteReader();
                    con.Close();

                    MessageBox.Show("Магазин успешно добавлен", "Сохранено", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    select();
                    ResetObjects();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                con.Close();
            }
        }

        private void selectBtn_Click(object sender, EventArgs e)
        {
            select();
        }

        private void ResetObjects()
        {
            idMusStrLbl.Clear();
            adressLbl.Clear();
        }

        private void select()
        {
            MySqlCommand cmd = new MySqlCommand("select *from music_store;", con);
            DataTable dt = new DataTable();

            con.Open();

            MySqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            con.Close();

            musicStoreGrid.DataSource = dt;
        }

        private void updateBtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (musicStoreID > 0)
                {
                    if (IsValid())
                    {
                        //price, model, name, id_music_store, id_manufacturer
                        MySqlCommand cmd = new MySqlCommand("UPDATE music_store SET adress = @adress WHERE idmusic_store = @musicStoreID", con);
                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@musicStoreID", musicStoreID);
                        cmd.Parameters.AddWithValue("@adress", adressLbl.Text);
                        

                        con.Open();
                        cmd.ExecuteReader();
                        con.Close();

                        MessageBox.Show("Магазин успешно обновлен.", "Сохранено", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        select();
                        ResetObjects();
                    }
                }
                else
                {
                    MessageBox.Show("Выберите магазин для обновления.", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                con.Close();
            }
        }

        private void deleteBtn_Click(object sender, EventArgs e)
        {
           
            try
            {
                if (musicStoreID > 0 && check_count_musicStore() == 0 )
                {
                    MySqlCommand cmd = new MySqlCommand("DELETE FROM music_store WHERE idmusic_store = @musicStoreID", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@musicStoreID", musicStoreID);

                    con.Open();
                    cmd.ExecuteReader();
                    con.Close();

                    MessageBox.Show("Магазин успешно удален.", "Удалено", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    select();
                    ResetObjects();
                }
                else
                {
                    MessageBox.Show("Выберите магазин для удаления.", "Предупреждение", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
                con.Close();
            }
        }

        private int check_count_musicStore() 
        {
            MySqlCommand cmd = new MySqlCommand("select count(p.idproduct) from product p where p.id_music_store = @musicStoreID;", con);
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@musicStoreID", musicStoreID);

            

            con.Open();
            MySqlDataReader sdr = cmd.ExecuteReader();
            sdr.Read();
            var cou = sdr.GetInt32(0);
            con.Close();

            return cou;
        }

        private void musicStoreGrid_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                musicStoreID = Convert.ToInt32(musicStoreGrid.Rows[e.RowIndex].Cells[0].Value);
                idMusStrLbl.Text = musicStoreGrid.Rows[e.RowIndex].Cells[0].Value.ToString();
                adressLbl.Text = musicStoreGrid.Rows[e.RowIndex].Cells[1].Value.ToString();
            }
        }

        private bool IsValid()
        {
            if (adress.Text == String.Empty)
            {
                MessageBox.Show("Адресс не введен!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }

            return true;
        }
    }
}
