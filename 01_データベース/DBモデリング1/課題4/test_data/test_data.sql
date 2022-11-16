INSERT INTO customer
	( customer_name, tel_number, tel_number_0, tel_number_1, tel_number_2, is_payment, total_volume, total_price )
	VALUES
	( "test1", "03-1234-5678", "03", "1234", "5678", true, 9, 930 ),
	( "test1", "03-1234-5678", "03", "1234", "5678", true, 3, 3120 );

INSERT INTO product
	( product_name, product_price, product_type )
	VALUES
	( "マグロ", 100, 1 ),
	( "サーモン", 110, 1 ),
	( "はまち", 120, 1 ),
	( "海鮮盛り",1000, 2 );

INSERT INTO customer_detail
	( customer_id, product_id, volume, price, is_wasabi )
	VALUES
	( 1, 1, 3, 300, true ),
	( 1, 1, 3, 300, false ),
	( 1, 2, 1, 110, true ),
	( 1, 2, 2, 220, false ),
	( 2, 3, 1, 120, true ),
	( 2, 4, 2, 2000, false );
