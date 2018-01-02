<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title> 중고 물품 등록</title>
</head>
<body>
<%--임시 입력 화면 --%>
<form action="../write.com" method="post" enctype= "multipart/form-data">
<%-- 첨부 파일 때문에 enctype = multipart/form-data 사용 --%>
<table>
<caption>중고 물품 등록</caption>
<tr>
<td class="td_left"><label for ="username">글쓴이</label></td>
<td class="td_right"><input type="text" name ="username" size ="10" maxlength='10' required= "required"></td>
</tr>

<tr>
<td class="td_left"><label for ="board_subject">제 목</label></td>
<td class="td_right"><input type="text" name ="board_subject" size ="50" maxlength='100' required= "required"></td>
</tr>

<tr>
<td class="td_left"><label for ="price">희망가격</label></td>
<td class="td_right"><input type="text" name ="price" size ="10" maxlength='10' required= "required"></td>
</tr>

<tr>
<td class="td_left"><label for ="choice_way"></label>거래 유형</td>
<td class="td_right"><!-- <input type="text" name ="choice_way" size ="10" maxlength='10' required= "required"> -->
<select name ="trade_state" >
<option value ="0">직거래</option>
<option value ="1">택배거래</option>
</select>
</td>
</tr>

<tr>
<td class="td_left"><label for ="product_type">물품 분류</label></td>
<td class="td_right"><input type="text" name ="product_type" size ="10" maxlength='10' required= "required"></td>
</tr>

<tr>
<td class="td_left"><label for ="purchasing_time">구입 시기</label></td>
<td class="td_right"><input type="text" name ="purchasing_time" size ="10" maxlength='10' required= "required"></td>
</tr>

<%-- 직거래일 경우에만 입력 --%>
<tr>
<td class="td_left"><label for ="purchasing_time">거래지역</label></td>
<td class="td_right"><input type="text" name ="purchasing_time" size ="10" maxlength='10' required= "required"></td>
</tr>

<tr>
<td class="td_left"><label for ="goods_info">내 용</label></td>
<td class="td_right">
	<textarea name="goods_info" rows= "10" cols="60" required= "required"></textarea>
</td>
</tr>

<tr>
<td class="td_left"><label for ="trade_state">거래 현황</label></td>
<td class="td_right">
<!-- <input type="text" name ="trade_state" size ="10" maxlength='10' required= "required"> -->
<select name ="choice_way">
<option value ="0">판매중</option>
<option value ="1">거래중</option>
<option value ="3">판매 완료</option>
</select></td>
</tr>

<%-- 이미지 크기 검사하는 기능 추가할 예정  --%>
<tr>
<td class="td_left">파일첨부</td>
<td class="td_right"><input type="file" name ="img"></td>
</tr>

<tr>
<td colspan ="2"  class="td_left">
<input type="submit" value="등록">
<input type="button" value="취소" onclick="javascript:history.back();"> <%-- 이전 페이지로 보내기 --%>
<input type="button"  value="목록보기" onclick ="javascript:location.href='../index.com' "></td>
</tr>



</table>

</form>



</body>
</html>