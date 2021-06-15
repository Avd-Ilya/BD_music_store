namespace lab_6_7
{
    partial class mainForms
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.goToProductBtn = new System.Windows.Forms.Button();
            this.goToMusicStoreBtn = new System.Windows.Forms.Button();
            this.show1 = new System.Windows.Forms.Button();
            this.show2 = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // goToProductBtn
            // 
            this.goToProductBtn.Location = new System.Drawing.Point(121, 62);
            this.goToProductBtn.Name = "goToProductBtn";
            this.goToProductBtn.Size = new System.Drawing.Size(176, 69);
            this.goToProductBtn.TabIndex = 0;
            this.goToProductBtn.Text = "перейти к Product";
            this.goToProductBtn.UseVisualStyleBackColor = true;
            this.goToProductBtn.Click += new System.EventHandler(this.goToProductBtn_Click);
            // 
            // goToMusicStoreBtn
            // 
            this.goToMusicStoreBtn.Location = new System.Drawing.Point(121, 166);
            this.goToMusicStoreBtn.Name = "goToMusicStoreBtn";
            this.goToMusicStoreBtn.Size = new System.Drawing.Size(176, 69);
            this.goToMusicStoreBtn.TabIndex = 0;
            this.goToMusicStoreBtn.Text = "перейти к Music Store";
            this.goToMusicStoreBtn.UseVisualStyleBackColor = true;
            this.goToMusicStoreBtn.Click += new System.EventHandler(this.goToMusicStoreBtn_Click);
            // 
            // show1
            // 
            this.show1.Location = new System.Drawing.Point(121, 273);
            this.show1.Name = "show1";
            this.show1.Size = new System.Drawing.Size(176, 69);
            this.show1.TabIndex = 0;
            this.show1.Text = "Вывести все товары в магазине";
            this.show1.UseVisualStyleBackColor = true;
            this.show1.Click += new System.EventHandler(this.show1_Click);
            // 
            // show2
            // 
            this.show2.Location = new System.Drawing.Point(121, 380);
            this.show2.Name = "show2";
            this.show2.Size = new System.Drawing.Size(176, 69);
            this.show2.TabIndex = 0;
            this.show2.Text = "Вывести все товары в диапазоне цен";
            this.show2.UseVisualStyleBackColor = true;
            this.show2.Click += new System.EventHandler(this.show2_Click);
            // 
            // mainForms
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(437, 514);
            this.Controls.Add(this.show2);
            this.Controls.Add(this.show1);
            this.Controls.Add(this.goToMusicStoreBtn);
            this.Controls.Add(this.goToProductBtn);
            this.Name = "mainForms";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button goToProductBtn;
        private System.Windows.Forms.Button goToMusicStoreBtn;
        private System.Windows.Forms.Button show1;
        private System.Windows.Forms.Button show2;
    }
}

