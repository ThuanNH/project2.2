<head>
	<script src="js/jquery2.1.js"></script>
	<script src="js/mainJs.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<link href="css/masterStyle.css" rel="stylesheet" type="text/css"  medial="all"/>
	<script language="javascript">
	//Chạy slide show
$(document).ready(function()
	{
		initSlideShow();
		
	});
	function initSlideShow()
	{
		if($(".slideshow div").length > 1) //Only run slideshow if have the slideshow element and have more than one image.
		{
			var transationTime = 5000;//5000 mili seconds i.e 5 second
			$(".slideshow div:first").addClass('active'); //Make the first image become active i.e on the top of other images
			setInterval(slideChangeImage, transationTime); //set timer to run the slide show.
		}
	}
	function slideChangeImage()
	{
		var active = $(".slideshow div.active"); //Get the current active element.
		if(active.length == 0)
		{
			active = $(".slideshow div:last"); //If do not see the active element is the last image.
		}
		
		var next = active.next().length ? active.next() : $(".slideshow div:first"); //get the next element to do the transition
		active.addClass('lastactive');
		next.css({opacity:0.0}) //do the fade in fade out transition
				.addClass('active')
				.animate({opacity:1.0}, 1500, function()
				{
					active.removeClass("active lastactive");	
				});
		 
	}
	</script>
</head>
<body>
	<section id="header" > 
		<div class="top-header">
<div class="wpage">
<a class="logo" href="DeTai.php"></a>
<div class="box_search">
<input type='Text' class="i-search" autofocus="" autocomplete="off"  value="" maxlength="45" placeholder="Tìm bài hát, playist,ca sĩ, video"></input>
<input id="btnSearch" class="b-search" type="submit" value=" "></input></div>
<div class="box_user_login">
<a href="" color=blue class="none-line">Đăng Nhập </a> |
<a href=""  color=blue class="none-line">Đăng ký</a></div>
</div>
</div>
		
	</section>
	<section id="mainMenu" > 
		<div id="header1" class="header1">
<div class="wpage">
<div class="menu-top">
<ul id="menuTop" class="notifi">
    <li id="icon_menu_logo" class="icon_logo_menu hide"></li>
	<li id="icon_menu_home" class="active">
	<a href="DeTai.php"><img src="css/images/home.jpg"></a></li>
	<li class="">Bài hát</li>
	<li class="">Playist</li>
	<li class="">Video</li>
	<li class="">Bảng xếp hạng</li>
</ul>
</div>
</div>
</div>

	</section>
	<section id="topAds" > 
		<div >
<embed   class="posi" src="css/images/clip.swf" wmode="transparent">
</embed></div>


	
	</section>
	<section id="mainContent" > 
		<section id="leftContent" > 
		
			<section id="slideshowBox" > 
				<div class="center">
<div class="left">
<div class="slideshow" >
	<div><a href="#"><img src="css/images/show1.jpg" alt="" border="0" /></a></div>
	<div><a href="#"><img src="css/images/show2.jpg" alt="" border="0" /></a></div>
	<div><a href="#"><img src="css/images/show3.jpg" alt="" border="0" /></a></div>
	<div><a href="#"><img src="css/images/show4.jpg" alt="" border="0" /></a></div>
</div>
<div class="show">
<ul id="anh">
<li rel="1"	 class="active"> 
<img alt="" src="css/images/show1.jpg" width="138px" height="100px"></img>
</li>
<li rel="2" > 
<img alt="" src="css/images/show2.jpg" width="138px" height="100px"></img>
</li>
<li rel="3"> 
<img alt="" src="css/images/show3.jpg" width="138px" height="100px"/>
</li>
<li rel="4"> 
<img alt="" src="css/images/show4.jpg" width="138px" height="100px"/>
</li>
</ul>
</div></div>
			</section>
			<section id="playlistBox" > 
				<p>The playlist box goes here !!! </p>
			</section>
			<section id="ColsVideoBox" > 
				<p>The 2 collumns video box goes here !!! </p>
			</section>
			<section id="videoBox" > 
				<p>The video box goes here !!! </p>
			</section>
			<section id="songBox" > 
				<p>The song box goes here !!! </p>
			</section>
			<div class="clearBox"></div>
		</section>
		<section id="rightContent" > 
		
			<section id="sideAds" > 
				<div class="right">
<div >
<embed   class="posi1" src="css/images/clip3.swf" wmode="transparent">
</embed></div>
</br>
			</section>
			<section id="sideMusicBox" > 
				<div class="green">
<label> Bảng xếp hạng</label>
<img src="css/images/play.jpg"/> 
<select class="right">
<option >Việt Nam</option>
<option >Châu Á</option>
<option >Âu Mỹ</option></select>
</div>
 <div >
 <div class="one"> 1</div>
 <div >
 <a class="one2"> Yêu em là Định Mệnh</a><a class="one3" ><img src="css/images/listen.jpg"/>1231313</a>
 </br>
 <a class="one4"> Cao Thái Sơn</a>
 </div>
 </div>
			</section>
			<section id="sideHotTopicBox" > 
				 </br></br>
 <div class="chude">
 Chủ đề hot
 </div>
<div><img src="css/images/chude1.jpg"/>
</br>
<a href="#" class="style-none">Nhạc tuyển tập</a>
</br>
Xin hân hạnh gửi đến các bạn</br> những tuyển tập các ca khúc hay</br>
 nhất của những nghệ sĩ</br> được yêu thích nhất trên 
 website</br> NhacCuaTui.Com. Mời các</br> bạn cùng lắng nghe và chia sẻ</br><a href="#" class="style-none">Xem Thêm</a>
	</div>
	</br>
	<div><img src="css/images/chude2.jpg"/>
	</br>
<a href="#" class="style-none">Nhạc trữ tình chọn lọc</a>
</br>
Tuyển tập nhạc trữ tình tuyển</br> chọn những playlist nhạc trữ</br> tình hay
 nhất với những giọng ca</br> tài danh hàng đầu sẽ đưa</br> quí vị trở về với khung trời
 hoa</br> bướm ngày xưa. Mời các</br> bạn cùng thưởng...<a href="#" class="style-none">Xem Thêm</a>
	</div>
	
	<a href="#" class="style-none">Nhạc bất hủ-Retro</a>
	</br>
	<a href="#" class="style-none">Song Ca</a>
	</br>
	<a href="#" class="style-none">Nhạc sàn mạnh</a>
			</section>
			<section id="sideSingerBox" > 
				<div class="casi">
	Ca Sĩ / Nghệ Sĩ
	</div>
	<ul>
	<li >
	<img src="css/images/lbh.jpg"/>
	<a> Lương Bích Hữu</a>
	</li>
	<img src="css/images/hqh.jpg"/>
	<a> Hồ Quang Hiếu</a>
	</ul>
</div>
</div>
			</section>
			<div class="clearBox"></div>
		</section>
		<div class="clearBox"></div>
	</section>
	<section id="footer" > <div class="footer">
<div class="wpage">

    <div class="mfooter">
	<ul class="menu">
        <li class="range">
			Phiên bản khác
			<ul>
			<li>
			<label>
    Mobile:
</label>
<a href="#" class="style-none1">Iso</a>,
<a href="#" class="style-none1">Android</a>,</br>
<a href="#" class="style-none1">Windows</a>,
<a href="#" class="style-none1">Nokia</a>
</li>
</br>
<li><label>Khác</label>
<a href="#" class="style-none1">Windows</a>,
<a href="#" class="style-none1">Smart TV</a>
</li></ul></li>
<li class="range">
Kết nối với chúng tôi</br>
<a href="#" class="style-none1">Twitter</a></br>
<a href="#" class="style-none1">Facebook</a></br>
<a href="#" class="style-none1">Linkhey</a></br>
<a href="#" class="style-none1">Google</a>
</li >
<li class="range">Hỗ Trợ</br>
<a href="#" class="style-none1">Quảng cáo</a></br>
<a href="#" class="style-none1">Trợ giúp</a></br>
<a href="#" class="style-none1">Sơ đồ</a></br>
<a href="#" class="style-none1">Thỏa thuận</a>
</li>
<li class="range">
Liên kết & Hợp Tác </br>
<a href="#" class="style-none1">Viss.vn</a>- Làm quen kết bạn</br>
<a href="#" class="style-none1">Nivi.vn</a>-Chơi game,xem phim</br>
<a href="#" class="style-none1">Nava.vn</a>-Mua sắm online
</li>
			</ul>
			</div>
			</div>
</div> </section>
</body>
<html>







	

</body>
</form></html>

