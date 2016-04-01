function toAlert(str){
				alert(str);
			}
			function buttonClicked(){
				alert("点击了按钮");
			}
			function gotoBaidu(){
				var url="http://www.baidu.com";
				document.location=url;
			}
			function jsWant(){
				var str="yang://buy?productId=good001";
				document.location=str;
			}
			function fromOC(some){
				alert(some);
                return '1234fromJS';
			}
			function add(){
				var a=document.getElementById("numA").value;
				var b=document.getElementById("numB").value;
				document.getElementById("result").innerHTML="结果："+(Number(a)+Number(b));
			}