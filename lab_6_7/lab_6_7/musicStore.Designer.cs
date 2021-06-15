namespace lab_6_7
{
    partial class musicStore
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.idMusicStore = new System.Windows.Forms.Label();
            this.adress = new System.Windows.Forms.Label();
            this.idMusStrLbl = new System.Windows.Forms.TextBox();
            this.adressLbl = new System.Windows.Forms.TextBox();
            this.musicStoreGrid = new System.Windows.Forms.DataGridView();
            this.insertBtn = new System.Windows.Forms.Button();
            this.deleteBtn = new System.Windows.Forms.Button();
            this.selectBtn = new System.Windows.Forms.Button();
            this.updateBtn = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.musicStoreGrid)).BeginInit();
            this.SuspendLayout();
            // 
            // idMusicStore
            // 
            this.idMusicStore.AutoSize = true;
            this.idMusicStore.Location = new System.Drawing.Point(55, 61);
            this.idMusicStore.Name = "idMusicStore";
            this.idMusicStore.Size = new System.Drawing.Size(81, 15);
            this.idMusicStore.TabIndex = 1;
            this.idMusicStore.Text = "id music store";
            // 
            // adress
            // 
            this.adress.AutoSize = true;
            this.adress.Location = new System.Drawing.Point(400, 61);
            this.adress.Name = "adress";
            this.adress.Size = new System.Drawing.Size(40, 15);
            this.adress.TabIndex = 2;
            this.adress.Text = "adress";
            // 
            // idMusStrLbl
            // 
            this.idMusStrLbl.Location = new System.Drawing.Point(142, 58);
            this.idMusStrLbl.Name = "idMusStrLbl";
            this.idMusStrLbl.Size = new System.Drawing.Size(176, 23);
            this.idMusStrLbl.TabIndex = 3;
            // 
            // adressLbl
            // 
            this.adressLbl.Location = new System.Drawing.Point(446, 58);
            this.adressLbl.Name = "adressLbl";
            this.adressLbl.Size = new System.Drawing.Size(193, 23);
            this.adressLbl.TabIndex = 4;
            // 
            // musicStoreGrid
            // 
            this.musicStoreGrid.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.musicStoreGrid.Location = new System.Drawing.Point(55, 107);
            this.musicStoreGrid.Name = "musicStoreGrid";
            this.musicStoreGrid.Size = new System.Drawing.Size(584, 228);
            this.musicStoreGrid.TabIndex = 5;
            this.musicStoreGrid.Text = "dataGridView1";
            this.musicStoreGrid.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.musicStoreGrid_CellContentClick);
            // 
            // insertBtn
            // 
            this.insertBtn.Location = new System.Drawing.Point(55, 363);
            this.insertBtn.Name = "insertBtn";
            this.insertBtn.Size = new System.Drawing.Size(102, 34);
            this.insertBtn.TabIndex = 9;
            this.insertBtn.Text = "insert";
            this.insertBtn.UseVisualStyleBackColor = true;
            this.insertBtn.Click += new System.EventHandler(this.insertBtn_Click);
            // 
            // deleteBtn
            // 
            this.deleteBtn.Location = new System.Drawing.Point(537, 363);
            this.deleteBtn.Name = "deleteBtn";
            this.deleteBtn.Size = new System.Drawing.Size(102, 34);
            this.deleteBtn.TabIndex = 9;
            this.deleteBtn.Text = "delete";
            this.deleteBtn.UseVisualStyleBackColor = true;
            this.deleteBtn.Click += new System.EventHandler(this.deleteBtn_Click);
            // 
            // selectBtn
            // 
            this.selectBtn.Location = new System.Drawing.Point(216, 363);
            this.selectBtn.Name = "selectBtn";
            this.selectBtn.Size = new System.Drawing.Size(102, 34);
            this.selectBtn.TabIndex = 9;
            this.selectBtn.Text = "select";
            this.selectBtn.UseVisualStyleBackColor = true;
            this.selectBtn.Click += new System.EventHandler(this.selectBtn_Click);
            // 
            // updateBtn
            // 
            this.updateBtn.Location = new System.Drawing.Point(373, 363);
            this.updateBtn.Name = "updateBtn";
            this.updateBtn.Size = new System.Drawing.Size(102, 34);
            this.updateBtn.TabIndex = 9;
            this.updateBtn.Text = "update";
            this.updateBtn.UseVisualStyleBackColor = true;
            this.updateBtn.Click += new System.EventHandler(this.updateBtn_Click);
            // 
            // musicStore
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 455);
            this.Controls.Add(this.updateBtn);
            this.Controls.Add(this.selectBtn);
            this.Controls.Add(this.deleteBtn);
            this.Controls.Add(this.insertBtn);
            this.Controls.Add(this.musicStoreGrid);
            this.Controls.Add(this.adressLbl);
            this.Controls.Add(this.idMusStrLbl);
            this.Controls.Add(this.adress);
            this.Controls.Add(this.idMusicStore);
            this.Name = "musicStore";
            this.Text = "musicStore";
            ((System.ComponentModel.ISupportInitialize)(this.musicStoreGrid)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label idMusicStore;
        private System.Windows.Forms.Label adress;
        private System.Windows.Forms.TextBox idMusStrLbl;
        private System.Windows.Forms.TextBox adressLbl;
        private System.Windows.Forms.DataGridView musicStoreGrid;
        private System.Windows.Forms.Button insertBtn;
        private System.Windows.Forms.Button deleteBtn;
        private System.Windows.Forms.Button selectBtn;
        private System.Windows.Forms.Button updateBtn;
    }
}