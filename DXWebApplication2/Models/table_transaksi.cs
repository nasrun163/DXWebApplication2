//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DXWebApplication2.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class table_transaksi
    {
        public int transaksi_id { get; set; }
        public Nullable<int> produk_detail_id { get; set; }
        public Nullable<int> costumer_id { get; set; }
        public Nullable<System.DateTime> tanggal { get; set; }
        public Nullable<int> qty { get; set; }
    
        public virtual table_costumer table_costumer { get; set; }
        public virtual table_produk_detail table_produk_detail { get; set; }
    }
}
