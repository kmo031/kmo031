<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./includes/header.jsp"%>

<div class="card align-middle" style="border-radius: 20px;">
	<div class="card-title" style="margin-top: 30px;">
		<h2 class="card-title text-center" style="color: #113366;">상품등록</h2>
	</div>
	<div class="card-body">

		<form role="form" class="form-signin" method="POST" action="pRegister">
			<p>
				<label for="pTitle" class="sr-only">상품이름</label> <input type="text"
					id="pTitle" class="form-control" placeholder="상품이름을 입력하여주세요"
					name="ptitle" required autofocus>
			</p>

			<p>
				<label for="pContent" class="sr-only">상품설명</label>
				<textarea rows="5" cols="30" id="pContent" class="form-control"
					placeholder="상품내용을 입력하여주세요" name="pcontent" required></textarea>
			</p>
			<p>
				<label for="pPrice" class="sr-only">가격</label> <input
					type="number" id="pPrice" class="form-control"
					placeholder="가격을 입력하여주세요" name="pprice" required>
			</p>
				
				<input type="hidden" name="pwriter" value='<sec:authentication property="principal.member.userName"/>'>
			<!--메인사진업로드 div  -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel-heading">메인 사진</div>
					<div class="panel-body">
						<div class="form-group uploadDiv">
							<input type="file" id="mainfile" name='uploadFile' required>
						</div>
						<div class='uploadResult'>
							<ul>

							</ul>

						</div>
					</div>
				</div>
			</div>
			<!-- / 메인사진업로드 div  -->
			
			<!--내용사진업로드 div  -->
			<div class="row">
				<div class="col-lg-12">
					<div class="panel-heading">내용에 들어갈 사진</div>
					<div class="panel-body">
						<div class="form-group uploadDiv2">
							<input type="file"  id ="subfile" name='uploadFile2' multiple>
						</div>
						<div class='uploadResult2'>
							<ul>

							</ul>

						</div>
					</div>
				</div>
			</div>
			<!-- / 내용사진업로드 div  -->
		



			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
			<div></div>
			<button id="btn-pAdd" class="btn btn-sm btn-primary btn-block"
				type="submit">등록</button>
		


		</form>

	</div>
</div>



<div class="bigPictureWrapper">
	<div class="bigPicture"></div>
</div>

<script>
	$(document).ready(function() {

		$(document).ajaxSend(function(e, xhr, option) {
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});

		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";

	});
</script>

<script>


	
	$(document).ready(function(e) {
		
		 var formObj = $("form[role='form']");
		  
		  $("button[type='submit']").on("click", function(e){
		    
		    e.preventDefault();
		    
		    console.log("submit clicked");
		    
		    var str = "";
		    
		    //메인사진 db 저장 내용
		    $(".uploadResult ul li").each(function(i, obj){
		      
		      var jobj = $(obj);
		      console.dir(jobj);
		      console.log("-------------------------");
		      console.log(jobj.data("filename"));
		      
		      
		      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
		      str += "<input type='hidden' name='attachList["+i+"].mainPicture' value='true'>";
		      console.log(str);
		      
		    });
		    //내용에 들어갈 db 저장 내용
		    
		    $(".uploadResult2 ul li").each(function(i, obj){
		    	
			      var j=0;
			      
			      // 구할 수없어서 임시사용 나중에 교체예정
		    	  $(".uploadResult ul li").each(function(i){
		    		  j++;
		    	  });
		    	  console.log("j" + j);
			      var jobj = $(obj);
			      
			      console.dir(jobj);
			      console.log("-------------------------");
			      console.log(jobj.data("filename"));
			      
			      
			      str += "<input type='hidden' name='attachList["+(i+j)+"].fileName' value='"+jobj.data("filename")+"'>";
			      str += "<input type='hidden' name='attachList["+(i+j)+"].uuid' value='"+jobj.data("uuid")+"'>";
			      str += "<input type='hidden' name='attachList["+(i+j)+"].uploadPath' value='"+jobj.data("path")+"'>";
			      str += "<input type='hidden' name='attachList["+(i+j)+"].fileType' value='"+ jobj.data("type")+"'>";
			      str += "<input type='hidden' name='attachList["+(i+j)+"].mainPicture' value='false'>";

			    });
		   
		     formObj.append(str).submit();
		     
		    
		  });

		/*파일 종류와 사이즈 검사 함수  */
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var maxSize = 5242880; //5MB
		var cloneObj = $(".uploadDiv").clone();

		function checkExtension(fileName, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			if (regex.test(fileName)) {
				alert("사진파일을 넣어주세요.");
				return false;
			}
			return true;
		}
		
		/* 메인사진에 들어갈 파일올리기  */
		$("input[type='file']#mainfile").change(function(e) {

			var formData = new FormData();
			
			var inputFile = $("input[name='uploadFile']"); //메인파일
			
			var files = inputFile[0].files;

			for (var i = 0; i < files.length; i++) {

				if (!checkExtension(files[i].name, files[i].size) ) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					showUploadResult(result);
					
					
				}
			}); //ajax end
		});
		
		/* 내용에들어갈 파일 올리기  */
		$("input[type='file']#subfile").change(function(e) {

			var formData = new FormData();

			var inputFile2 = $("input[name='uploadFile2']");//내용파일
			var files2 = inputFile2[0].files;

			for (var i = 0; i < files2.length; i++) {

				if (!checkExtension(files2[i].name, files2[i].size) ) {
					return false;
				}
				formData.append("uploadFile", files2[i]);
			}
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					showUploadResult2(result);
					
				}
			}); //ajax end
		});

	}); //ready end
	
	//메인사진 li태그생성
	function showUploadResult(uploadResultArr) {
		if (!uploadResultArr || uploadResultArr.length == 0) {
			return;
		}

		var uploadUL = $(".uploadResult ul");
		var str = "";

		$(uploadResultArr)
				.each(
						function(i, obj) {

							//image type
							if (obj.image) {
								var fileCallPath = encodeURIComponent(obj.uploadPath
										+ "/s_" + obj.uuid + "_" + obj.fileName);
								str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
								str += "<span> " + obj.fileName + "</span>";
								str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
								str += "<img src='/display?fileName="
										+ fileCallPath + "'>";
								str += "</div>";
								str + "</li>";
							} else {
								var fileCallPath = encodeURIComponent(obj.uploadPath
										+ "/" + obj.uuid + "_" + obj.fileName);
								var fileLink = fileCallPath.replace(new RegExp(
										/\\/g), "/");

								str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
								str += "<span> " + obj.fileName + "</span>";
								str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
								str += "<img src='/resources/images/attach.png'></a>";
								str += "</div>";
								str + "</li>";
							}
						});
		uploadUL.append(str);
	}
	//내용사진  li태그생성
	function showUploadResult2(uploadResultArr) {
		if (!uploadResultArr || uploadResultArr.length == 0) {
			return;
		}

		var uploadUL = $(".uploadResult2 ul");
		var str = "";

		$(uploadResultArr)
				.each(
						function(i, obj) {

							//image type
							if (obj.image) {
								var fileCallPath = encodeURIComponent(obj.uploadPath
										+ "/s_" + obj.uuid + "_" + obj.fileName);
								str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
								str += "<span> " + obj.fileName + "</span>";
								str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
								str += "<img src='/display?fileName="
										+ fileCallPath + "'>";
								str += "</div>";
								str + "</li>";
							} else {
								var fileCallPath = encodeURIComponent(obj.uploadPath
										+ "/" + obj.uuid + "_" + obj.fileName);
								var fileLink = fileCallPath.replace(new RegExp(
										/\\/g), "/");

								str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
								str += "<span> " + obj.fileName + "</span>";
								str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
								str += "<img src='/resources/images/attach.png'></a>";
								str += "</div>";
								str + "</li>";
							}
						});
		uploadUL.append(str);
	}
	
	
	


	/* 사진 지우는 버튼 클릭시 파일 지우기  */
	$(".uploadResult,.uploadResult2").on("click", "button", function(e) {
		console.log("delete file");
		
		var targetFile = $(this).data("file");
		var type = $(this).data("type");
		
		var targetLi = $(this).closest("li");
		
		$.ajax({
			url: '/deleteFile',
			data: {fileName: targetFile, type:type},
			dataType:'text',
			type: 'POST',
			success: function(result){
				alert("해당 파일이 삭제되었습니다.");
				targetLi.remove();
			}
		});
	});;
</script>


<%@include file="./includes/footer.jsp"%>

</body>
</html>