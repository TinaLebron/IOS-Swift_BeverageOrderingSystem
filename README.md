# IOS-Swift_BeverageOrderingSystem


目的:平常很喜歡喝茶類,決定做飲料系統


功能:  <br>
       • 一開始會進入購物車頁面,UI使用tableView有Header(選擇的商品)和Footer(總價錢:0),在按下 "+" 會進入冷飲選購頁面 <br>
	     • 跳頁面使用Navigation,冷飲選購可以選擇想要喝的飲品,甜度,冰塊,加料,然後再按完成,這時會彈出間隔幾秒的通知(資料新增成功) <br>
	     • 購物車頁面按下編輯會出現刪除功能或移動資料位置<br>
	     • 購物車頁面也有刪除功能(向左滑) <br>

改善: <br>
     • 版面要美化 <br>

## Main(ShoppingCart) 

<img src="https://github.com/TinaLebron/IOS-Swift_BeverageOrderingSystem/blob/master/picture/shoppingCartStart.png"  width="650" />
<img src="https://github.com/TinaLebron/IOS-Swift_BeverageOrderingSystem/blob/master/picture/shoppingCart.png" width="650" />
<img src="https://github.com/TinaLebron/IOS-Swift_BeverageOrderingSystem/blob/master/picture/delete.png" width="650" />

| Option | Description |
| ------ | ----------- |
| add (增加) | Press to go to the cold drink purchase page. |
| dalete (刪除)   | Delete selected item.  |

<img src="https://github.com/TinaLebron/IOS-Swift_BeverageOrderingSystem/blob/master/picture/edit.png" width="650" />
<img src="https://github.com/TinaLebron/IOS-Swift_BeverageOrderingSystem/blob/master/picture/editMove.png" width="650" />
<img src="https://github.com/TinaLebron/IOS-Swift_BeverageOrderingSystem/blob/master/picture/editDelete.png" width="650" />

| Option | Description |
| ------ | ----------- |
| edit(編輯)   | Press Edit to display the delete function or move the data location. |

## Cold Drink Purchase(冷飲選購)

&nbsp;
<img src="https://github.com/TinaLebron/IOS-Swift_BeverageOrderingSystem/blob/master/picture/ordering.png" width="650" />
<img src="https://github.com/TinaLebron/IOS-Swift_BeverageOrderingSystem/blob/master/picture/orderingOK.png" width="650" />

| Option | Description |
| ------ | ----------- |
| old drink selection(冷飲選擇)  | Cold drink purchase can choose the drink you want to drink, sweetness, ice cubes, feeding. |
| ok(完成)    | Press ok, and a notification will be displayed for a few seconds (the data is added successfully).|
| return(返回)    | Not stored.




