/*--Kiểm tra cột product_category có giá trị sai chính tả không
select distinct(product_category)
from pet_sales
--Kiểm tra cột pet_size có giá trị sai chính tả không
select distinct(pet_size)
from pet_sales
--Kiểm tra cột pet_type có giá trị sai chính tả không
select distinct(pet_type)
from pet_sales
--Kiểm tra cột rating có giá trị sai không (giá trị của cột rating không được lớn hơn 10)
select distinct(rating)
from pet_sales
--Kiểm tra cột re_buy có giá trị sai không (giá trị của cột re_buy là 0 hoặc 1 hoặc null)
select distinct(re_buy)
from pet_sales*/
/*Tạo CTE định dạng cột sales từ nvarchar thành numeric, định dạng cột price từ  nvarchar thành float,
lọc giá trị cột pet_type thuộc “cat”,“dog”, “fish”, “bird”*/
With sale_CTE As 
     (
     select product_id, 
     product_category, 
	 cast(replace(trim('$' from sales), ',', '') as numeric) as sales, 
	 cast(price as float) as price, 
	 vendor_id, 
	 pet_size, 
	 pet_type, 
	 rating, 
	 re_buy
     from pet_sales where pet_type in ('cat','dog', 'fish', 'bird')
     )
--Select * from sale_CTE
-- How many products are being purchased more than once?
--select re_buy, count(re_buy) as Amount from sale_CTE group by re_buy
-- Do the products being purchased again have better sales than others?
---Lấy ra tổng sales của các sản phẩm được mua lại và tổng sales của các sản phẩm không được mua lại
/*select re_buy, sum(sales) as Total
from sale_CTE 
group by re_buy */
-- What products are more likely to be purchased again for different types of pets?
---Để trả lời cho câu hỏi trên, tôi lấy ra số lượng các lượt đánh giá dựa trên thang điểm từ 1 đến 10. Từ đó lấy ra các sản phẩm có điểm đánh giá cao nhất là 10 điểm, đó sẽ là các sản phẩm có khả năng được mua lại cao nhất.
---Lấy ra số lượng các lượt đánh giá dựa trên thang điểm từ 1 đến 10.
Select rating, count(rating) as Amount from sale_CTE group by rating order by rating
---Lấy ra các sản phẩm có rating bằng 10
--Select * from sale_CTE where rating = 10






