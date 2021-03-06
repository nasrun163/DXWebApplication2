USE [DARMEX AGRO]
GO
SET IDENTITY_INSERT [dbo].[table_costumer] ON 

INSERT [dbo].[table_costumer] ([costumer_id], [costumer_name], [address]) VALUES (1, N'Alfamart', N'Alfa Tower 12th Floor
Jl. Jalur Sutera Barat Kav. 9
Kota Tangerang, Banten 15143')
INSERT [dbo].[table_costumer] ([costumer_id], [costumer_name], [address]) VALUES (2, N'Indomart', N'Menara Indomaret Jl. Pantai Indah Kapuk Blvd, No.1,Pantai Indah Kapuk, Jakarta 14470 Telp. (021) 5089 7400 (Hunting)(021) 5089 7411 (Hunting)')
INSERT [dbo].[table_costumer] ([costumer_id], [costumer_name], [address]) VALUES (3, N'Alfamidi', N'Gedung Alfa Tower, Lantai 12, Kav. 7-9, Jl. Jalur Sutera Barat, Alam Sutera, Tangerang 15143')
INSERT [dbo].[table_costumer] ([costumer_id], [costumer_name], [address]) VALUES (4, N'Superindo', N'Gedung Menara Bidakara 2 Lt. 19, Jalan Jenderal Gatot Subroto Kav. 71-73, RT.8/RW.8, Menteng Dalam, Tebet, RT.8/RW.8, Menteng Dalam, Kec. Tebet, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12870')
INSERT [dbo].[table_costumer] ([costumer_id], [costumer_name], [address]) VALUES (5, N'Transmart', N'Jl. Letjen S. Parman Kav.28 Lower Ground Floor Tanjung Duren Selatan 11470')
SET IDENTITY_INSERT [dbo].[table_costumer] OFF
SET IDENTITY_INSERT [dbo].[table_produk] ON 

INSERT [dbo].[table_produk] ([produk_id], [produk_name]) VALUES (2, N'Iphone 6')
INSERT [dbo].[table_produk] ([produk_id], [produk_name]) VALUES (3, N'Iphone 7')
SET IDENTITY_INSERT [dbo].[table_produk] OFF
SET IDENTITY_INSERT [dbo].[table_produk_detail] ON 

INSERT [dbo].[table_produk_detail] ([produk_detail_id], [produk_id], [produk_detail_name], [price_per_item], [discount]) VALUES (1, 2, N'Disko Akhir Tahun', CAST(3000000 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)))
INSERT [dbo].[table_produk_detail] ([produk_detail_id], [produk_id], [produk_detail_name], [price_per_item], [discount]) VALUES (2, 3, N'Iphone 7', CAST(4500000 AS Decimal(18, 0)), CAST(25 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[table_produk_detail] OFF
SET IDENTITY_INSERT [dbo].[table_transaksi] ON 

INSERT [dbo].[table_transaksi] ([transaksi_id], [produk_detail_id], [costumer_id], [tanggal], [qty]) VALUES (1, 1, 1, CAST(N'2021-02-05' AS Date), 1)
SET IDENTITY_INSERT [dbo].[table_transaksi] OFF
