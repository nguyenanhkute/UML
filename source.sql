USE [master]
GO
/****** Object:  Database [BANHANGTET]    Script Date: 1/13/2019 3:31:45 PM ******/
CREATE DATABASE [banhang_tet]

/****** Object:  StoredProcedure [dbo].[ctdh_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ctdh_Insert]
	@maDH varchar(7),
	@maSP varchar(7),
	@soluong int
	as
	begin
		
		if((@maDH in (Select MaDH
						   From DONHANG)) and
			((@maSP in (Select MaSP
						   From SANPHAM))))
			begin 
				Insert Into CHITIETDONHANG Values (@maDH, @maSP, @soluong)
			end 
		else
			print N'Ma? san pham hoac ma don hang không h??p lê?'
	end


GO
/****** Object:  StoredProcedure [dbo].[ctdnh_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ctdnh_Insert]
	@maDNH varchar(7),
@tenSP nvarchar(40),
@soluong int

AS
BEGIN 
	DECLARE @maSP VARCHAR(7)
	SET @maSP=(SELECT MASP FROM SANPHAM WHERE TenSP=@tenSP)
	IF((SELECT COUNT(maSP) FROM CHITIETDONNHAPHANG WHERE MaDNH= @maDNH AND MaSP= @maSP)=0)
		INSERT INTO CHITIETDONNHAPHANG VALUES(@maDNH,@maSP,@soluong)
	else 
		print 'san pham da duoc mua'
END
GO
/****** Object:  StoredProcedure [dbo].[dh_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dh_Insert]
	@maKH varchar(7),
	@tinhtrang nvarchar(20),
	@thanhtien money
	
	as
	begin
		Insert Into DONHANG Values (dbo.AUTO_MADH(), @maKH, GETDATE(),@tinhtrang, @thanhtien )
	end

GO
/****** Object:  StoredProcedure [dbo].[dm_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[dm_Insert]
	@tenDM nvarchar(40)
	as
	begin
		
		Insert Into DANHMUC Values (dbo.AUTO_MADM(),@tenDM)
	
	end

GO
/****** Object:  StoredProcedure [dbo].[dnh_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dnh_Insert]
	@tenNCC nvarchar(40)
	as
	begin
		DECLARE @MaNCC VARCHAR(7)
		DECLARE @NGAY SMALLDATETIME
		SET @MaNCC= (SELECT MaNCC FROM NHACUNGCAP WHERE TenNCC= @TenNCC)
		SET @NGAY= (SELECT GETDATE())
		Insert Into DONNHAPHANG Values (dbo.AUTO_MADNH(), @MaNCC,@NGAY,0)
	end

	
GO
/****** Object:  StoredProcedure [dbo].[dnh_listSP]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dnh_listSP]
	@tenNCC nvarchar(40)
	as
	begin
		DECLARE @MaNCC VARCHAR(7)
		SET @MaNCC= (SELECT MaNCC FROM NHACUNGCAP WHERE TenNCC=@TenNCC)
			SELECT TenSP FROM SANPHAM WHERE MaNCC= @MaNCC
	end
GO
/****** Object:  StoredProcedure [dbo].[insert_chitietDNH]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insert_chitietDNH]
@maDNH varchar(7),
@tenSP nvarchar(40),
@soluong int

AS
BEGIN 
	DECLARE @maSP VARCHAR(7)
	SET @maSP=(SELECT MASP FROM SANPHAM WHERE TenSP=@tenSP)
	IF((SELECT COUNT(MaSP) FROM CHITIETDONNHAPHANG WHERE MaDNH= @maDNH AND MaSP=@maSP )=0)
		INSERT INTO CHITIETDONNHAPHANG VALUES(@maDNH,@maSP,@soluong)
	else 
		print 'san pham da duoc mua'
END
GO
/****** Object:  StoredProcedure [dbo].[kh_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--9.  Thêm kho hàng
create PROC [dbo].[kh_Insert]
	@maSP varchar(7), 
	@soluongton int
	as
	begin
		
		if ((@maSP in (Select MaSP
						   From SANPHAM)))
			begin 
				Insert Into KHOHANG Values (@maSP, @soluongton)
			end 
		else
			print N'Ma? san pham không h??p lê?'
	end
-- 10. Thêm tài khoản khách hàng


GO
/****** Object:  StoredProcedure [dbo].[khACHHANG_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROC [dbo].[khACHHANG_Insert]
	@email nvarchar(40),
	@hoten nvarchar(40),
	@diachi nvarchar(80),
	@dienthoai varchar(20),
	@gioitinh nvarchar(20),
	@ngaysinh smalldatetime
	
	as
	begin	
		Insert Into KHACHHANG Values (dbo.AUTO_MAKH(), @email, @hoten,@diachi, @dienthoai, @gioitinh, @ngaysinh)	
	end

GO
/****** Object:  StoredProcedure [dbo].[kiemtra_taikhoan]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[kiemtra_taikhoan] 
@email char(7),
@matkhau nvarchar(20)
as
begin
	select * 
	from TAIKHOAN,KHACHHANG
	where TAIKHOAN.MatKhau = @matkhau and KHACHHANG.Email = @email

end

GO
/****** Object:  StoredProcedure [dbo].[Lay20SpKeTuSPThuTuTruyenVao]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Lay20SpKeTuSPThuTuTruyenVao]
@stt int
as
begin

SELECT *
FROM SANPHAM
ORDER BY MaSP
OFFSET @stt ROWS FETCH NEXT 20 ROWS ONLY

end 
GO
/****** Object:  StoredProcedure [dbo].[Lay9SpKeTuSPThuTuTruyenVao]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Lay9SpKeTuSPThuTuTruyenVao]
@stt int,
@malsp char(7)
as
begin

SELECT *
FROM SANPHAM
where MaLoaiSP = @malsp
ORDER BY MaSP
OFFSET @stt ROWS FETCH NEXT 9 ROWS ONLY

end 

GO
/****** Object:  StoredProcedure [dbo].[lsp_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[lsp_Insert]
	@TenDM nvarchar(40),
	@tenloaiSP nvarchar(40)
	as
	begin
		declare @maDM varchar(7)
		select @maDM = maDM from DANHMUC WHERE TenDM= @TenDM
		Insert Into LOAISANPHAM Values (dbo.AUTO_MALOAISP(), @maDM, @tenloaiSP)
	end

GO
/****** Object:  StoredProcedure [dbo].[MaxDH_ByMaKH]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MaxDH_ByMaKH] 
@makh char(7)
as
begin
	select max(MaDH) as MaDH
	from DONHANG
	where MaKH = @makh
end

GO
/****** Object:  StoredProcedure [dbo].[MaxDNH_BytenNCC]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	---6.4 lấy mã đơn nhập hàng để thêm ctdnh
CREATE proc [dbo].[MaxDNH_BytenNCC]
@tenNCC nvarchar(40)
as
begin
	declare @mancc varchar(7)
	set @mancc= (select MaNCC FROM NHACUNGCAP WHERE TenNCC=@tenNCC)
	select max(MaDNH) as MaDNH
	from DONNHAPHANG
	where MaNCC = @mancc
end


GO
/****** Object:  StoredProcedure [dbo].[ncc_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ncc_Insert]
	@tenNCC nvarchar(40),
	@diachi nvarchar(80),
	@dienthoai nvarchar(20)	
	as
	begin
		
		Insert Into NHACUNGCAP Values (dbo.AUTO_MANCC(),@tenNCC,@diachi,@dienthoai)
	
	end


GO
/****** Object:  StoredProcedure [dbo].[sp_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_Insert]
	--@maSP varchar(7),

	@tenNCC nvarchar(40),
	@tenLSP nvarchar(40),
	@tenSP nvarchar(40),
	@anhSP nvarchar(150),
	@gia money,
	@moTa nvarchar(80),
	@tinhTrang nvarchar(20)
	as
	begin
		declare @maNCC varchar(7),@maLSP varchar(7)

		set @maLSP= (select MaLoaiSP From LOAISANPHAM WHERE TenLoaiSP=@tenLSP)
		set @maNCC= ( select  MaNCC From NHACUNGCAP WHERE TenNCC=@tenNCC)

		IF (@maLSP<>'' and @maNCC <>'')
				Insert Into SANPHAM Values (dbo.AUTO_MASP(), @maNCC, @maLSP, @tenSP, @anhSP,@gia , @moTa, @tinhTrang)
		
		else
			print N'Mã loại sản phẩn hoặc mã nhà cung cấp không hợp lệ'
	end 
	

GO
/****** Object:  StoredProcedure [dbo].[tk_Insert]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[tk_Insert]
	@maKH varchar(7),
	@matkhau nvarchar(20)
	
	as
	begin
		if(
			@maKH in (Select MaKH From KHACHHANG))
			begin 
				Insert Into TAIKHOAN Values (dbo.AUTO_MATK(), @maKH, @matkhau)
			end 
		else
			print N'Ma? khach hang không h??p lê?'
	end

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ImageSP]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
CREATE PROC [dbo].[UPDATE_ImageSP] 
	@Masp varchar(7),
	@AnhSP nvarchar(150)
	as
	begin
				DECLARE @DEM INT
				SET @DEM= (SELECT COUNT(MaSP) FROM SANPHAM WHERE MaSP=@MaSP)
				IF (@DEM = 0) 
				BEGIN
					PRINT 'KHÔNG TỒN TẠI SẢN PHẨM'
				END
				ELSE
				BEGIN
					UPDATE SANPHAM SET AnhSP=@AnhSP
					WHERE MaSP= @Masp 
				END
	end


GO
/****** Object:  StoredProcedure [dbo].[UPDATE_LSP]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[UPDATE_LSP] 
	@Malsp varchar(7),
	@Tenloaisp nvarchar(20)
	
	as
	begin
				UPDATE LOAISANPHAM SET TenLoaiSP= @Tenloaisp
				WHERE MaLoaiSP = @Malsp
	end

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_SP]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UPDATE_SP] 
	@Masp varchar(7),
	@tensp nvarchar(40),
	@gia   money,
	@mota  nvarchar(80),
	@tinhTrang nvarchar(20)
	as
	begin
		UPDATE SANPHAM SET TenSP=@tensp,Gia=@gia,MoTa=@mota,TinhTrang= @tinhTrang
		WHERE MaSP= @Masp 
	end

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MADH]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MADH]()
RETURNS CHAR(10)
AS
BEGIN 
	DECLARE @MADH CHAR(7)
	DECLARE @MAX_MADH INT

	SELECT @MAX_MADH = COUNT(MADH) FROM DONHANG

	IF(@MAX_MADH <= 0)
		SET @MAX_MADH = 1
	ELSE 
		SET @MAX_MADH = @MAX_MADH + 1
	IF(@MAX_MADH < 10)
		SET @MADH = 'DH0000' + CONVERT(CHAR(1),@MAX_MADH)
	ELSE 
	IF(@MAX_MADH < 100) 
		SET @MADH = 'DH000'+ CONVERT(CHAR(2),@MAX_MADH)
	ELSE 
	IF(@MAX_MADH < 1000)
		SET @MADH = 'DH00' + CONVERT(CHAR(3),@MAX_MADH)
	ELSE
	IF(@MAX_MADH < 10000)
		SET @MADH = 'DH0' + CONVERT(CHAR(4),@MAX_MADH )
		ELSE
	IF(@MAX_MADH < 100000)
		SET @MADH = 'DH' + CONVERT(CHAR(5),@MAX_MADH)
	
RETURN @MADH
END


GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MADM]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MADM]()
RETURNS CHAR(10)
AS
BEGIN 
	DECLARE @MADM CHAR(7)
	DECLARE @MAX_MADM INT

	SELECT @MAX_MADM = COUNT(MADM) FROM DANHMUC

	IF(@MAX_MADM <= 0)
		SET @MAX_MADM = 1
	ELSE 
		SET @MAX_MADM = @MAX_MADM + 1
	IF(@MAX_MADM < 10)
		SET @MADM = 'DM0000' + CONVERT(CHAR(1),@MAX_MADM)
	ELSE 
	IF(@MAX_MADM < 100) 
		SET @MADM = 'DM000'+ CONVERT(CHAR(2),@MAX_MADM)
	ELSE 
	IF(@MAX_MADM < 1000)
		SET @MADM = 'DM00' + CONVERT(CHAR(3),@MAX_MADM)
	ELSE
	IF(@MAX_MADM < 10000)
		SET @MADM = 'DM0' + CONVERT(CHAR(4),@MAX_MADM)
	ELSE
	IF(@MAX_MADM < 100000)
		SET @MADM = 'DM' + CONVERT(CHAR(5),@MAX_MADM)
	
RETURN @MADM
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MADNH]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MADNH]()
RETURNS CHAR(10)
AS
BEGIN 
	DECLARE @MADNH CHAR(7)
	DECLARE @MAX_MADNH INT

	SELECT @MAX_MADNH = COUNT(MADNH) FROM DONNHAPHANG

	IF(@MAX_MADNH <= 0)
		SET @MAX_MADNH = 1
	ELSE 
		SET @MAX_MADNH = @MAX_MADNH + 1
	IF(@MAX_MADNH < 10)
		SET @MADNH = 'DNH000' + CONVERT(CHAR(1),@MAX_MADNH)
	ELSE 
	IF(@MAX_MADNH < 100) 
		SET @MADNH = 'DNH00'+ CONVERT(CHAR(2),@MAX_MADNH)
	ELSE 
	IF(@MAX_MADNH < 1000)
		SET @MADNH = 'DNH0' + CONVERT(CHAR(3),@MAX_MADNH)
	ELSE
	IF(@MAX_MADNH < 10000)
		SET @MADNH = 'DNH' + CONVERT(CHAR(4),@MAX_MADNH)
RETURN @MADNH
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MAKH]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[AUTO_MAKH]()
RETURNS CHAR(10)
AS
BEGIN 
	DECLARE @MAKH CHAR(7)
	DECLARE @MAX_MAKH INT

	SELECT @MAX_MAKH = COUNT(MAKH) FROM KHACHHANG

	IF(@MAX_MAKH <= 0)
		SET @MAX_MAKH = 1
	ELSE 
		SET @MAX_MAKH = @MAX_MAKH + 1
	IF(@MAX_MAKH < 10)
		SET @MAKH = 'KH0000' + CONVERT(CHAR(1),@MAX_MAKH)
	ELSE 
	IF(@MAX_MAKH < 100) 
		SET @MAKH = 'KH000'+ CONVERT(CHAR(2),@MAX_MAKH)
	ELSE 
	IF(@MAX_MAKH < 1000)
		SET @MAKH = 'KH00' + CONVERT(CHAR(3),@MAX_MAKH)
	ELSE
	IF(@MAX_MAKH < 10000)
		SET @MAKH = 'KH0' + CONVERT(CHAR(4),@MAX_MAKH)
	ELSE
	IF(@MAX_MAKH < 100000)
		SET @MAKH = 'KH' + CONVERT(CHAR(5),@MAX_MAKH)
	
RETURN @MAKH
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MALOAISP]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MALOAISP]()
RETURNS CHAR(10)
AS
BEGIN 
	DECLARE @MALOAISP CHAR(7)
	DECLARE @MAX_MALOAISP INT

	SELECT @MAX_MALOAISP = COUNT(MALOAISP) FROM LOAISANPHAM

	IF(@MAX_MALOAISP <= 0)
		SET @MAX_MALOAISP = 1
	ELSE 
		SET @MAX_MALOAISP = @MAX_MALOAISP + 1
	IF(@MAX_MALOAISP < 10)
		SET @MALOAISP = 'LSP000' + CONVERT(CHAR(1),@MAX_MALOAISP)
	ELSE 
	IF(@MAX_MALOAISP < 100) 
		SET @MALOAISP = 'LSP00'+ CONVERT(CHAR(2),@MAX_MALOAISP)
	ELSE 
	IF(@MAX_MALOAISP < 1000)
		SET @MALOAISP = 'LSP0' + CONVERT(CHAR(3),@MAX_MALOAISP)
	ELSE
	IF(@MAX_MALOAISP < 10000)
		SET @MALOAISP = 'LSP' + CONVERT(CHAR(4),@MAX_MALOAISP)
RETURN @MALOAISP
END
	

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MANCC]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MANCC]()
RETURNS CHAR(10)
AS
BEGIN 
	DECLARE @MANCC CHAR(7)
	DECLARE @MAX_MANCC INT

	SELECT @MAX_MANCC = COUNT(MaNCC) FROM NHACUNGCAP

	IF(@MAX_MANCC <= 0)
		SET @MAX_MANCC = 1
	ELSE 
		SET @MAX_MANCC = @MAX_MANCC + 1
	IF(@MAX_MANCC < 10)
		SET @MANCC = 'NCC000' + CONVERT(CHAR(1),@MAX_MANCC)
	ELSE 
	IF(@MAX_MANCC < 100) 
		SET @MANCC = 'NCC00'+ CONVERT(CHAR(2),@MAX_MANCC)
	ELSE 
	IF(@MAX_MANCC < 1000)
		SET @MANCC = 'NCC0' + CONVERT(CHAR(3),@MAX_MANCC)
	ELSE
	IF(@MAX_MANCC < 10000)
		SET @MANCC = 'NCC' + CONVERT(CHAR(4),@MAX_MANCC)
	
	
RETURN @MANCC
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MASP]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[AUTO_MASP]()
RETURNS CHAR(10)
AS
BEGIN 
	DECLARE @MASP CHAR(7)
	DECLARE @MAX_MASP INT

	SELECT @MAX_MASP = COUNT(MaSP) FROM SANPHAM

	IF(@MAX_MASP <= 0)
		SET @MAX_MASP = 1
	ELSE 
		SET @MAX_MASP = @MAX_MASP + 1
	IF(@MAX_MASP < 10)
		SET @MASP = 'SP0000' + CONVERT(CHAR(1),@MAX_MASP)
	ELSE 
	IF(@MAX_MASP < 100) 
		SET @MASP = 'SP000'+ CONVERT(CHAR(2),@MAX_MASP)
	ELSE 
	IF(@MAX_MASP < 1000)
		SET @MASP = 'SP00' + CONVERT(CHAR(3),@MAX_MASP)
	ELSE
	IF(@MAX_MASP < 10000)
		SET @MASP = 'SP0' + CONVERT(CHAR(4),@MAX_MASP)
	ELSE
	IF(@MAX_MASP < 100000)
		SET @MASP = 'SP' + CONVERT(CHAR(5),@MAX_MASP)
	
RETURN @MASP
END

GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_MATK]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[AUTO_MATK]()
RETURNS CHAR(10)
AS
BEGIN 
	DECLARE @MaTK CHAR(7)
	DECLARE @MAX_MaTK INT

	SELECT @MAX_MaTK = COUNT(MaTK) FROM TAIKHOAN

	IF(@MAX_MaTK <= 0)
		SET @MAX_MaTK = 1
	ELSE 
		SET @MAX_MaTK = @MAX_MaTK + 1
	IF(@MAX_MaTK < 10)
		SET @MaTK = 'TK0000' + CONVERT(CHAR(1),@MAX_MaTK)
	ELSE 
	IF(@MAX_MaTK < 100) 
		SET @MaTK = 'TK000'+ CONVERT(CHAR(2),@MAX_MaTK)
	ELSE 
	IF(@MAX_MaTK < 1000)
		SET @MaTK = 'TK00' + CONVERT(CHAR(3),@MAX_MaTK)
	ELSE
	IF(@MAX_MaTK < 10000)
		SET @MaTK = 'TK0' + CONVERT(CHAR(4),@MAX_MaTK)
	ELSE
	IF(@MAX_MaTK < 100000)
		SET @MaTK = 'TK' + CONVERT(CHAR(5),@MAX_MaTK)
	
RETURN @MaTK
END


GO
/****** Object:  UserDefinedFunction [dbo].[fuConvertToUnsign1]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fuConvertToUnsign1] ( @strInput NVARCHAR(4000) ) RETURNS NVARCHAR(4000)
AS
BEGIN
	IF @strInput IS NULL RETURN @strInput IF @strInput = '' RETURN @strInput 
    DECLARE @RT NVARCHAR(4000)
    DECLARE @SIGN_CHARS NCHAR(136) 
    DECLARE @UNSIGN_CHARS NCHAR (136) 
    SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệế ìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵý ĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍ ÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' +NCHAR(272)+ NCHAR(208) 
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeee iiiiiooooooooooooooouuuuuuuuuuyyyyy AADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIII OOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD' 
    DECLARE @COUNTER int 
    DECLARE @COUNTER1 int 
    SET @COUNTER = 1 WHILE (@COUNTER <=LEN(@strInput)) 
		BEGIN
			SET @COUNTER1 = 1 WHILE (@COUNTER1 <=LEN(@SIGN_CHARS)+1) 
			BEGIN
				IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@strInput,@COUNTER ,1) )
				BEGIN
					IF @COUNTER=1 SET @strInput = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)-1)
					ELSE SET @strInput = SUBSTRING(@strInput, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@strInput, @COUNTER+1,LEN(@strInput)- @COUNTER) BREAK 
				END
				SET @COUNTER1 = @COUNTER1 +1
			END 
			SET @COUNTER = @COUNTER +1 
		END 
		SET @strInput = replace(@strInput,' ','-') RETURN @strInput 
END


GO
/****** Object:  Table [dbo].[ADMINS]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADMINS](
	[TenDangNhap] [nvarchar](40) NOT NULL,
	[MatKhau] [nvarchar](20) NOT NULL,
 CONSTRAINT [AD_PK] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC,
	[MatKhau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CHITIETDONHANG]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETDONHANG](
	[MaDH] [varchar](7) NOT NULL,
	[MaSP] [varchar](7) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [CTDH_MaDH_MaSP_PK] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CHITIETDONNHAPHANG]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETDONNHAPHANG](
	[MaDNH] [varchar](7) NOT NULL,
	[MaSP] [varchar](7) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [CTDDH_MaSP_PK] PRIMARY KEY CLUSTERED 
(
	[MaDNH] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[MaDM] [varchar](7) NOT NULL,
	[TenDM] [nvarchar](40) NULL,
 CONSTRAINT [DM_MaDM_PK] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DONHANG](
	[MaDH] [varchar](7) NOT NULL,
	[MaKH] [varchar](7) NOT NULL,
	[NgayDatHang] [smalldatetime] NULL,
	[TinhTrang] [nvarchar](20) NULL,
	[ThanhTien] [money] NULL,
 CONSTRAINT [DH_MaDH_PK] PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DONNHAPHANG]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DONNHAPHANG](
	[MaDNH] [varchar](7) NOT NULL,
	[MaNCC] [varchar](7) NOT NULL,
	[NgayDatHang] [smalldatetime] NULL,
	[TongSoLuong] [int] NULL,
 CONSTRAINT [DH_MaDNH_PK] PRIMARY KEY CLUSTERED 
(
	[MaDNH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKH] [varchar](7) NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
	[HoTen] [nvarchar](40) NULL,
	[DiaChi] [nvarchar](80) NULL,
	[DienThoai] [varchar](20) NULL,
	[GioiTinh] [nvarchar](20) NULL,
	[NgaySinh] [smalldatetime] NULL,
 CONSTRAINT [KH_MaKH_PK] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[KHOHANG]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KHOHANG](
	[MaSP] [varchar](7) NOT NULL,
	[SoLuongTon] [int] NULL,
 CONSTRAINT [KH_MaSP_PK] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LOAISANPHAM]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOAISANPHAM](
	[MaLoaiSP] [varchar](7) NOT NULL,
	[MaDM] [varchar](7) NOT NULL,
	[TenLoaiSP] [nvarchar](40) NULL,
 CONSTRAINT [LSP_MaLoaiSP_PK] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNCC] [varchar](7) NOT NULL,
	[TenNCC] [nvarchar](40) NULL,
	[DiaChi] [nvarchar](80) NULL,
	[DienThoai] [varchar](20) NULL,
 CONSTRAINT [NCC_MaNCC_PK] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SANPHAM](
	[MaSP] [varchar](7) NOT NULL,
	[MaNCC] [varchar](7) NULL,
	[MaLoaiSP] [varchar](7) NULL,
	[TenSP] [nvarchar](40) NULL,
	[AnhSP] [varchar](150) NULL,
	[Gia] [money] NULL,
	[MoTa] [nvarchar](80) NULL,
	[TinhTrang] [nvarchar](20) NULL,
 CONSTRAINT [SP_MaSP_PK] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 1/13/2019 3:31:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTK] [varchar](7) NOT NULL,
	[MaKH] [varchar](7) NULL,
	[MatKhau] [nvarchar](20) NOT NULL,
 CONSTRAINT [TK_MaTK_PK] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ADMINS] ([TenDangNhap], [MatKhau]) VALUES (N'admin', N'admin')
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00001', N'SP00001', 4)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00002', N'SP00003', 2)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00003', N'SP00004', 3)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00004', N'SP00001', 5)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00005', N'SP00009', 10)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00006', N'SP00016', 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00007', N'SP00020', 2)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00007', N'SP00030', 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00008', N'SP00001', 5)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00008', N'SP00051', 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00009', N'SP00019', 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00009', N'SP00021', 2)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00010', N'SP00007', 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00010', N'SP00035', 2)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00011', N'SP00035', 20001)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00012', N'SP00043', 20001)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00013', N'SP00001', 20001)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00014', N'SP00028', 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00015', N'SP00019', 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00015', N'SP00035', 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00016', N'SP00035', 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00017', N'SP00019', 1)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00017', N'SP00035', 2)
INSERT [dbo].[CHITIETDONHANG] ([MaDH], [MaSP], [SoLuong]) VALUES (N'DH00017', N'SP00057', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0001', N'SP00001', 1000)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0002', N'SP00002', 20)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0003', N'SP00004', 100)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0004', N'SP00003', 200)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0008', N'SP00003', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0008', N'SP00008', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0012', N'SP00001', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0012', N'SP00026', 3)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0013', N'SP00002', 4)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0014', N'SP00006', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0014', N'SP00010', 6)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0014', N'SP00011', 3)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0014', N'SP00019', 5)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0016', N'SP00002', 4)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0016', N'SP00026', 6)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0017', N'SP00001', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0017', N'SP00026', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0017', N'SP00027', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0018', N'SP00001', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0018', N'SP00002', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0018', N'SP00026', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0019', N'SP00001', 3)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0020', N'SP00006', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0020', N'SP00007', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0020', N'SP00009', 3)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0020', N'SP00010', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0020', N'SP00011', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0020', N'SP00012', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0020', N'SP00013', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0021', N'SP00006', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0021', N'SP00007', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0021', N'SP00009', 3)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0021', N'SP00013', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0023', N'SP00006', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0023', N'SP00007', 2)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0024', N'SP00001', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0024', N'SP00057', 1)
INSERT [dbo].[CHITIETDONNHAPHANG] ([MaDNH], [MaSP], [SoLuong]) VALUES (N'DNH0025', N'SP00002', 3)
INSERT [dbo].[DANHMUC] ([MaDM], [TenDM]) VALUES (N'DM00001', N'Bánh kẹo')
INSERT [dbo].[DANHMUC] ([MaDM], [TenDM]) VALUES (N'DM00002', N'Hoa,Cây cảnh')
INSERT [dbo].[DANHMUC] ([MaDM], [TenDM]) VALUES (N'DM00003', N'Mứt')
INSERT [dbo].[DANHMUC] ([MaDM], [TenDM]) VALUES (N'DM00004', N'Trang trí')
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00001', N'KH00001', CAST(0xA8840000 AS SmallDateTime), N'Ðã giao', 120000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00002', N'KH00002', CAST(0xA8A00000 AS SmallDateTime), N'Đang giao', 180000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00003', N'KH00003', CAST(0xA8FC0000 AS SmallDateTime), N'Đã giao', 150000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00004', N'KH00004', CAST(0xA8FC0000 AS SmallDateTime), N'Đang giao', 574000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00005', N'KH00005', CAST(0xA91A0000 AS SmallDateTime), N'Đang giao', 600000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00006', N'KH00001', CAST(0xA70E0000 AS SmallDateTime), N'Đã xác nhận', 140000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00007', N'KH00010', CAST(0xA9B5050A AS SmallDateTime), N'Đã xác nhận', 605000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00008', N'KH00006', CAST(0xA9B5050B AS SmallDateTime), N'Đã xác nhận', 600000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00009', N'KH00021', CAST(0xA9CE054D AS SmallDateTime), N'Đã xác nhận', 225000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00010', N'KH00021', CAST(0xA9CE054F AS SmallDateTime), N'Đã xác nhận', 494000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00011', N'KH00021', CAST(0xA9CE0553 AS SmallDateTime), N'Đã xác nhận', 235000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00012', N'KH00021', CAST(0xA9CE0554 AS SmallDateTime), N'Đã xác nhận', 235000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00013', N'KH00021', CAST(0xA9CE0567 AS SmallDateTime), N'Đã xác nhận', 600060000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00014', N'KH00021', CAST(0xA9CE056E AS SmallDateTime), N'Đã xác nhận', 370000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00015', N'KH00021', CAST(0xA9CF019A AS SmallDateTime), N'Đã xác nhận', 390000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00016', N'KH00021', CAST(0xA9CF0202 AS SmallDateTime), N'Đã xác nhận', 255000.0000)
INSERT [dbo].[DONHANG] ([MaDH], [MaKH], [NgayDatHang], [TinhTrang], [ThanhTien]) VALUES (N'DH00017', N'KH00021', CAST(0xA9CF0218 AS SmallDateTime), N'Đã xác nhận', 745000.0000)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0001', N'NCC0001', CAST(0xA8A00000 AS SmallDateTime), NULL)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0002', N'NCC0002', CAST(0xA8850000 AS SmallDateTime), NULL)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0003', N'NCC0003', CAST(0xA8DD0000 AS SmallDateTime), NULL)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0004', N'NCC0004', CAST(0xA8660000 AS SmallDateTime), NULL)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0005', N'NCC0002', CAST(0xA9CF0006 AS SmallDateTime), 0)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0006', N'NCC0002', CAST(0xA9CF0009 AS SmallDateTime), 0)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0007', N'NCC0001', CAST(0xA9CF000C AS SmallDateTime), 0)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0008', N'NCC0002', CAST(0xA9CF000E AS SmallDateTime), 3)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0009', N'NCC0002', CAST(0xA9CF002B AS SmallDateTime), 0)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0010', N'NCC0001', CAST(0xA9CF0041 AS SmallDateTime), 0)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0011', N'NCC0002', CAST(0xA9CF004E AS SmallDateTime), 0)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0012', N'NCC0001', CAST(0xA9CF0054 AS SmallDateTime), 5)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0013', N'NCC0001', CAST(0xA9CF0060 AS SmallDateTime), 4)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0014', N'NCC0004', CAST(0xA9CF006C AS SmallDateTime), 16)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0015', N'NCC0002', CAST(0xA9CF0170 AS SmallDateTime), 0)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0016', N'NCC0001', CAST(0xA9CF0173 AS SmallDateTime), 10)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0017', N'NCC0001', CAST(0xA9CF0176 AS SmallDateTime), 5)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0018', N'NCC0001', CAST(0xA9CF017F AS SmallDateTime), 5)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0019', N'NCC0001', CAST(0xA9CF0189 AS SmallDateTime), 3)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0020', N'NCC0004', CAST(0xA9CF0196 AS SmallDateTime), 10)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0021', N'NCC0004', CAST(0xA9CF01F2 AS SmallDateTime), 7)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0022', N'NCC0004', CAST(0xA9CF020E AS SmallDateTime), 0)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0023', N'NCC0004', CAST(0xA9CF020E AS SmallDateTime), 4)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0024', N'NCC0001', CAST(0xA9CF0210 AS SmallDateTime), 2)
INSERT [dbo].[DONNHAPHANG] ([MaDNH], [MaNCC], [NgayDatHang], [TongSoLuong]) VALUES (N'DNH0025', N'NCC0001', CAST(0xA9D4039A AS SmallDateTime), 3)
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00001', N'Nguyenn', N' Nguyen Hong Hanh', N'Thanh pho Ho Chi Minh', N' 0234679957', N' Nu', CAST(0x97780000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00002', N'conmeocon22@gmail.com', N' Tran Gia Nghi', N'Lam Dong', N' 0364568726', N' Nu', CAST(0x8D850000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00003', N'doduymanh01021998@gmail.com', N' Do Duy Manh', N'Vinh Long', N' 0456799344', N' Nam', CAST(0x90050000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00004', N'vovanthanhAT003@gmail.com', N' Vo Van Thanh', N'Tien Giang', N' 0375637882', N' Nam', CAST(0x8A140000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00005', N'nguyenthiphuong07A@gmail.com', N' Nguyen Thi Phuong', N'Ha Noi', N' 0167998336', N' Nu', CAST(0x90230000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00006', N'luugiathanh1997@gmail.com', N' Luu Gia Thanh', N'An Giang', N' 0678443997', N' Nam', CAST(0x91C50000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00007', N'vuducsonchuyem998@gmail.com', N' Vu Duc Son Chuyen', N'Thanh pho Ho Chi Minh', N' 0984326687', N' Nam', CAST(0x7F1F0000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00008', N'ngaannguyen21061887@gmail.com', N' Nguyen Thi Kim Ngan', N'Binh Duong', N' 0364579934', N' Nu', CAST(0x8C180000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00009', N'hoilamchi673@gmail.com', N' Nguyen Van Nguyen', N'Binh Phuoc', N' 0166324799', N' Nam', CAST(0x95D60000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00010', N'hongganhnguyen1887@gmail.com', N' Nguyen Hong Anh', N'Long An', N' 0165288892', N' Nu', CAST(0x90430000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00011', N'nguyenltn@gmail.com', N'Nguyen', N'đồng nai', N'03477190101', N'nam', CAST(0x83620000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00012', N'nguyenlan', N'nguyen', N'cà mau', N'012310104', N'nam', CAST(0x83640000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00013', N'hongganhnguyen1887@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00014', N'hongganhnguyen1887@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00015', N'hongganhnguyen1887@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00016', N'hongganhnguyen1887@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00017', N'hongganhnguyen1887@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00018', N'hongganhnguyen1887@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00019', N'hongganhnguyen1887@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00020', N'hongganhnguyen1887@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00021', N'nguyenthianh@gmail.com', N'nguyá»
n thá» anh', N'ktx khu a', N'1234567', N'ná»¯', CAST(0x8EAC0000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00022', N'nguyenthianh@gmail.com', N'nguyá»
n thá» anh', N'ktx khu a', N'0123456', N'ná»¯', CAST(0x8EAC0000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00023', N'nguyenthianh@gmail.com', N'nguyá»
n thá» anh', N'ktx khu a', N'0123456', N'ná»¯', CAST(0x8EAC0000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00024', N'nguyenthianh@gmail.com', N'nguyá»
n thá» anh', N'ktx khu a', N'0123456', N'ná»¯', CAST(0x8EAC0000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00025', N'nguyenthianh@gmail.com', N'nguyá»
n thá» anh', N'ktx khu a', N'0123456', N'ná»¯', CAST(0x8EAC0000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00026', N'nguyenthianh@gmail.com', N'nguyá»
n thá» anh', N'ktx khu a', N'0123456', N'ná»¯', CAST(0x8EAC0000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00027', N'nguyenthianh@gmail.com', N'nguyễn thị anh', N'ktx khu a', N'0123456', N'Nữ', CAST(0x8EAC0000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00028', N'nguyenthianh@gmail.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00029', N'nguyenthianh@gmail.com', N'nguyá»
n thá» anh', N'ktx khu a', N'0123456', N'ná»¯', CAST(0x8EAC0000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00030', N'nguyenthianh@gmail.com', N'nguyá»
n thá» anh', N'ktx khu a', N'0123456', N'ná»¯', CAST(0x8EAC0000 AS SmallDateTime))
INSERT [dbo].[KHACHHANG] ([MaKH], [Email], [HoTen], [DiaChi], [DienThoai], [GioiTinh], [NgaySinh]) VALUES (N'KH00031', N'nguyenthianh@gmail.com', N'nguyá»
n thá» anh', N'ktx khu a', N'0123456', N'ná»¯', CAST(0x8EAC0000 AS SmallDateTime))
INSERT [dbo].[KHOHANG] ([MaSP], [SoLuongTon]) VALUES (N'SP00001', 32)
INSERT [dbo].[KHOHANG] ([MaSP], [SoLuongTon]) VALUES (N'SP00002', 13)
INSERT [dbo].[KHOHANG] ([MaSP], [SoLuongTon]) VALUES (N'SP00003', 14)
INSERT [dbo].[KHOHANG] ([MaSP], [SoLuongTon]) VALUES (N'SP00004', 5)
INSERT [dbo].[KHOHANG] ([MaSP], [SoLuongTon]) VALUES (N'SP00007', 24)
INSERT [dbo].[KHOHANG] ([MaSP], [SoLuongTon]) VALUES (N'SP00008', 11)
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0001', N'DM00001', N'Bánh')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0002', N'DM00004', N'Câu đối')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0003', N'DM00002', N'Cây quýt')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0004', N'DM00004', N'Decal')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0005', N'DM00004', N'Dây may mắn')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0006', N'DM00002', N'Hoa Dào')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0007', N'DM00002', N'Hoa Mai')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0008', N'DM00002', N'Hoa tầm xuân')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0009', N'DM00001', N'Kẹo')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0010', N'DM00004', N'Lồng đèn')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0011', N'DM00003', N'Mứt mặn')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0012', N'DM00003', N'Mứt ngọt')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0013', N'DM00001', N'Trái cây sấy')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0014', N'DM00001', N'Thạch')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0015', N'DM00001', N'Bánh chocolate')
INSERT [dbo].[LOAISANPHAM] ([MaLoaiSP], [MaDM], [TenLoaiSP]) VALUES (N'LSP0016', N'DM00001', N'kem')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC0001', N'Bánh kẹo Hoa Mai', N'Bình Dương', N'0351237889')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC0002', N'Cây cảnh Minh Đăng', N'Lâm Đồng', N'0355678556')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC0003', N'Mứt Hằng Nghi', N'Bến Tre', N'0348770007')
INSERT [dbo].[NHACUNGCAP] ([MaNCC], [TenNCC], [DiaChi], [DienThoai]) VALUES (N'NCC0004', N'Decal Minh Học', N'Thành Phố Hồ Chí Minh', N'0246789995')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00001', N'NCC0001', N'LSP0001', N'bánh chưng mặn', N'banhchung.jpg', 30000.0000, N'Thành phần: Gạo nếp, Đậu xanh, Lá cẩm, Lá Dong, Thit Heo, Gia Vị', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00002', N'NCC0001', N'LSP0001', N'Bánh chưng ngọt', N'banhchungngot.jpg', 30000.0000, N'Thành phần: Gạo nếp, Đậu xanh, Lá cẩm, Lá Dong,gia vị', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00003', N'NCC0003', N'LSP0012', N'Mứt dừa', N'mutdua.jpg', 90000.0000, N'Thành phần: Dừa, Đường', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00004', N'NCC0003', N'LSP0012', N'Mứt gừng', N'mutgung.JPG', 70000.0000, N'Thành phần: Gừng, Đường', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00005', N'NCC0002', N'LSP0006', N'Cành Đào', N'canhdao.jpg', 67000.0000, N'Màu hồng nhiều cánh', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00006', N'NCC0004', N'LSP0010', N'Lồng đèn đỏ', N'9.jpg', 60000.0000, N'Lồng đèn tròn màu đỏ', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00007', N'NCC0004', N'LSP0004', N'Decal dán', N'decan.jpg', 24000.0000, N'Giấy H?', N' Hết')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00008', N'NCC0002', N'LSP0007', N'Cành Mai', N'canhmai.jpg', 12000.0000, N'Màu vàng, 5 cánh', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00009', N'NCC0004', N'LSP0010', N'Lồng đèn tím', N'longdentim.png', 60000.0000, N'Lồng đèn tròn màu tím', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00010', N'NCC0004', N'LSP0010', N'Lồng đèn xanh', N'longdenxanh.jpg', 60000.0000, N'Lồng đèn tròn màu xanh', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00011', N'NCC0004', N'LSP0010', N'Lồng đèn vàng', N'longdenvang.jpg', 60000.0000, N'Lồng đèn tròn màu vàng', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00012', N'NCC0004', N'LSP0010', N'Lồng đèn điện', N'longdendien.jpg', 100000.0000, N'Lồng đèn tròn điện trò chơi cho trẻ nhỏ chạy bằng pin ', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00013', N'NCC0004', N'LSP0010', N'Lồng đèn củ tỏi', N'9.jpg', 80000.0000, N'Lồng đèn củ tỏi', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00014', N'NCC0004', N'LSP0010', N'Lồng đèn vuông', N'longdenvuong.jpg', 120000.0000, NULL, N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00015', N'NCC0004', N'LSP0010', N'Lồng đèn cá chép', N'logndencachep.jpg', 150000.0000, NULL, N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00016', N'NCC0004', N'LSP0010', N'Lồng đèn cá', N'longdenca.jpg', 140000.0000, NULL, N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00017', N'NCC0004', N'LSP0010', N'Lồng đèn ông sao', N'longdenongsao.jpg', 80000.0000, NULL, N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00018', N'NCC0002', N'LSP0008', N'bình tầm xuân', N'binhtamxuan.jpg', 235000.0000, N'bình tầm xuân', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00019', N'NCC0004', N'LSP0005', N'dây may mắn', N'daymayman.jpg', 135000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00020', N'NCC0001', N'LSP0009', N'Kẹo quà tết', N'keo.jpg', 235000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00021', N'NCC0003', N'LSP0013', N'chuối sấy', N'chuoisay.jpg', 45000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00022', N'NCC0003', N'LSP0013', N'mít sấy', N'mitsay.jpg', 55000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00023', N'NCC0003', N'LSP0013', N'khoai lang sấy', N'khoailangsay.jpg', 45000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00024', N'NCC0002', N'LSP0008', N'bình tầm xuân', N'binhtamxuan.jpg', 350000.0000, N'bình tầm xuân', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00025', N'NCC0003', N'LSP0012', N'mứt hỗn hợp', N'saythapcam.jpg', 65000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00026', N'NCC0001', N'LSP0014', N'thạch táo', N'thachtao.jpg', 35000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00027', N'NCC0001', N'LSP0014', N'thạch trái cây', N'thachtraicay.jpg', 35000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00028', N'NCC0002', N'LSP0003', N'cây quất', N'cayquat.jpg', 350000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00029', N'NCC0002', N'LSP0006', N'cây đào', N'hoadao.jpg', 350000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00030', N'NCC0002', N'LSP0006', N'cành đào', N'canhdao.jpg', 135000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00031', N'NCC0002', N'LSP0007', N'cây mai', N'hoamai.jpg', 350000.0000, N'Banh chuoi nuong', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00032', N'NCC0002', N'LSP0007', N'canh mai', N'canhmai.jpg', 350000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00033', N'NCC0002', N'LSP0008', N'hoa tầm xuân', N'tamxuan.jpg', 235000.0000, N'hoa tầm xuân', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00034', N'NCC0002', N'LSP0008', N'bình tầm xuân', N'binhtamxuan.jpg', 235000.0000, N'bình tầm xuân', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00035', N'NCC0004', N'LSP0002', N'câu đối', N'caudoi.jpg', 235000.0000, N'caudoi', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00036', N'NCC0001', N'LSP0009', N'Kẹo quà tết', N'banhkeo1.jpg', 435000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00037', N'NCC0001', N'LSP0009', N'Kẹo quà tết', N'banhkeo2.jpg', 365000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00038', N'NCC0001', N'LSP0009', N'Kẹo quà tết', N'banhkeo3.jpg', 350000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00039', N'NCC0001', N'LSP0009', N'Kẹo quà tết', N'banhkeo4.jpg', 395000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00040', N'NCC0001', N'LSP0001', N'bánh tét', N'banhtet.jpg', 130000.0000, N'Thành phần: Gạo nếp, Đậu xanh, Lá cẩm, Lá Dong, Thit Heo, Gia Vị', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00041', N'NCC0001', N'LSP0001', N'bánh tét', N'banhtet2.jpg', 110000.0000, N'Thành phần: Gạo nếp, Đậu xanh, Lá cẩm, Lá Dong, Thit Heo, Gia Vị', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00042', N'NCC0001', N'LSP0001', N'bánh tét', N'banhtet3.jpg', 90000.0000, N'Thành phần: Gạo nếp, Đậu xanh, Lá cẩm, Lá Dong, Thit Heo, Gia Vị', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00043', N'NCC0004', N'LSP0002', N'câu đối', N'caudoi1.jpg', 235000.0000, N'caudoi', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00044', N'NCC0004', N'LSP0002', N'câu đối', N'caudoi2.jpg', 235000.0000, N'caudoi', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00045', N'NCC0004', N'LSP0002', N'câu đối', N'caudoi3.jpg', 235000.0000, N'caudoi', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00046', N'NCC0004', N'LSP0004', N'Decal dán tường', N'decan1.jpg', 460000.0000, N'Giấy H?', N' Hết')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00047', N'NCC0004', N'LSP0004', N'Decal dán tường', N'decan2.jpg', 240000.0000, N'Giấy H?', N' Hết')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00048', N'NCC0003', N'LSP0011', N'Mứt me', N'mutman1.jpg', 90000.0000, N'Thành phần: Dừa, Đường', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00049', N'NCC0003', N'LSP0011', N'Mứt omai', N'mutman2.jpg', 90000.0000, N'Thành phần: Dừa, Đường', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00050', N'NCC0003', N'LSP0011', N'Mứt me', N'mutman3.jpg', 90000.0000, N'Thành phần: Dừa, Đường', N'Còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00051', N'NCC0002', N'LSP0003', N'cây quất', N'cayquat.jpg', 450000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00052', N'NCC0002', N'LSP0003', N'cây quất', N'cayquat.jpg', 450000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00053', N'NCC0002', N'LSP0003', N'cây quất', N'cayquat.jpg', 370000.0000, N'', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00054', N'NCC0001', N'LSP0001', N'banh que', N'', 12000.0000, N'ngon', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00055', N'NCC0002', N'LSP0003', N'cay quyt', N'', 200000.0000, N'dep', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00056', N'NCC0001', N'LSP0001', N'banh da', N'', 120000.0000, N'5 cai', N'còn')
INSERT [dbo].[SANPHAM] ([MaSP], [MaNCC], [MaLoaiSP], [TenSP], [AnhSP], [Gia], [MoTa], [TinhTrang]) VALUES (N'SP00057', N'NCC0001', N'LSP0001', N'kẹo dẻo', N'', 120000.0000, N'keo deo mềm', N'còn')
INSERT [dbo].[TAIKHOAN] ([MaTK], [MaKH], [MatKhau]) VALUES (N'TK00001', N'KH00001', N'123456')
INSERT [dbo].[TAIKHOAN] ([MaTK], [MaKH], [MatKhau]) VALUES (N'TK00002', N'KH00002', N'hongnghigia999')
INSERT [dbo].[TAIKHOAN] ([MaTK], [MaKH], [MatKhau]) VALUES (N'TK00003', N'KH00003', N'hanhfhf444')
INSERT [dbo].[TAIKHOAN] ([MaTK], [MaKH], [MatKhau]) VALUES (N'TK00004', N'KH00004', N'thanh1996')
INSERT [dbo].[TAIKHOAN] ([MaTK], [MaKH], [MatKhau]) VALUES (N'TK00005', N'KH00005', N'Phuongadd1777')
INSERT [dbo].[TAIKHOAN] ([MaTK], [MaKH], [MatKhau]) VALUES (N'TK00006', N'KH00006', N'thanhgialuu')
INSERT [dbo].[TAIKHOAN] ([MaTK], [MaKH], [MatKhau]) VALUES (N'TK00007', N'KH00007', N'ahgfjdj344')
INSERT [dbo].[TAIKHOAN] ([MaTK], [MaKH], [MatKhau]) VALUES (N'TK00008', N'KH00008', N'argre543')
INSERT [dbo].[TAIKHOAN] ([MaTK], [MaKH], [MatKhau]) VALUES (N'TK00009', N'KH00009', N'anguyeenffj5485')
INSERT [dbo].[TAIKHOAN] ([MaTK], [MaKH], [MatKhau]) VALUES (N'TK00010', N'KH00010', N'honganh2001')
ALTER TABLE [dbo].[CHITIETDONHANG]  WITH CHECK ADD  CONSTRAINT [CTDH_MaDH_FK] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DONHANG] ([MaDH])
GO
ALTER TABLE [dbo].[CHITIETDONHANG] CHECK CONSTRAINT [CTDH_MaDH_FK]
GO
ALTER TABLE [dbo].[CHITIETDONHANG]  WITH CHECK ADD  CONSTRAINT [CTDH_MaSP_FK] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CHITIETDONHANG] CHECK CONSTRAINT [CTDH_MaSP_FK]
GO
ALTER TABLE [dbo].[CHITIETDONNHAPHANG]  WITH CHECK ADD  CONSTRAINT [CTDDH_Madnh_FK] FOREIGN KEY([MaDNH])
REFERENCES [dbo].[DONNHAPHANG] ([MaDNH])
GO
ALTER TABLE [dbo].[CHITIETDONNHAPHANG] CHECK CONSTRAINT [CTDDH_Madnh_FK]
GO
ALTER TABLE [dbo].[CHITIETDONNHAPHANG]  WITH CHECK ADD  CONSTRAINT [CTDDH_MaSP_FK] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[CHITIETDONNHAPHANG] CHECK CONSTRAINT [CTDDH_MaSP_FK]
GO
ALTER TABLE [dbo].[DONHANG]  WITH CHECK ADD  CONSTRAINT [DH_MaKH_FK] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[DONHANG] CHECK CONSTRAINT [DH_MaKH_FK]
GO
ALTER TABLE [dbo].[DONNHAPHANG]  WITH CHECK ADD  CONSTRAINT [DH_MaNCC_FK] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNCC])
GO
ALTER TABLE [dbo].[DONNHAPHANG] CHECK CONSTRAINT [DH_MaNCC_FK]
GO
ALTER TABLE [dbo].[KHOHANG]  WITH CHECK ADD  CONSTRAINT [KH_MaSP_FK] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SANPHAM] ([MaSP])
GO
ALTER TABLE [dbo].[KHOHANG] CHECK CONSTRAINT [KH_MaSP_FK]
GO
ALTER TABLE [dbo].[LOAISANPHAM]  WITH CHECK ADD  CONSTRAINT [LSP_MaDM_FK] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DANHMUC] ([MaDM])
GO
ALTER TABLE [dbo].[LOAISANPHAM] CHECK CONSTRAINT [LSP_MaDM_FK]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [SP_MaLoaiSP_FK] FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LOAISANPHAM] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [SP_MaLoaiSP_FK]
GO
ALTER TABLE [dbo].[SANPHAM]  WITH CHECK ADD  CONSTRAINT [SP_MaNCC_FK] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NHACUNGCAP] ([MaNCC])
GO
ALTER TABLE [dbo].[SANPHAM] CHECK CONSTRAINT [SP_MaNCC_FK]
GO
ALTER TABLE [dbo].[TAIKHOAN]  WITH CHECK ADD  CONSTRAINT [TK_MaKH_FK] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KHACHHANG] ([MaKH])
GO
ALTER TABLE [dbo].[TAIKHOAN] CHECK CONSTRAINT [TK_MaKH_FK]

