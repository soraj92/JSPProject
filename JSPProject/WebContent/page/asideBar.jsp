<%--
  Created by IntelliJ IDEA.
  User: Jo
  Date: 2018-01-02
  Time: 오후 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="accordion" role="tablist" style="width: 300px">
    <div>
        <div class="navmenu-header" role="tab" id="headingOne">
            <h6>
                <a data-toggle="collapse" href="#collapseOne" role="button" aria-expanded="true"
                   aria-controls="collapseOne">
                    의류
                </a>
            </h6>
        </div>

        <div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne"
             data-parent="#accordion">
            <div class="card-body">
                <span style="display: block;"><a href="boardList.do?product_type=clothes-top">상의</a></span>
                <span><a href="boardList.do?product_type=clothes-bottom">하의</a></span>
                <span style="display: block;"><a href="boardList.do?product_type=clothes-overall">한벌 옷</a></span>
                <span><a href="boardList.do?product_type=clothes-outerwear">아우터</a></span>
            </div>
        </div>
    </div>

    <div>
        <div class="navmenu-header" role="tab" id="headingTwo">
            <h6>
                <a class="collapsed" data-toggle="collapse" href="#collapseTwo" role="button"
                   aria-expanded="false" aria-controls="collapseTwo">
                    패션 잡화
                </a>
            </h6>
        </div>
        <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo"
             data-parent="#accordion">
            <div class="card-body">
               <span style="display: block;"><a href="boardList.do?product_type=accessory-bag">가방</a></span>
                <span><a href="boardList.do?product_type=accessory-shoes">신발</a></span>
                <span style="display: block;"><a href="boardList.do?product_type=accessory-hat">모자</a></span>
                <span><a href="boardList.do?product_type=accessory-etc-accessory">기타</a></span>
            </div>
        </div>
    </div>
    <div>
        <div class="navmenu-header" role="tab" id="headingThree">
           <h6>
               <a href="boardList.do?product_type=sports">스포츠</a>
            </h6>
        </div>
    </div>
    
    <div>
        <div class="navmenu-header" role="tab" id="headingThree">
            <h6>               
                <a href="boardList.do?product_type=electronics"> 디지털/가전</a>
            </h6>
        </div>
    </div>
    <div>
        <div class="navmenu-header" role="tab" id="headingThree">
            <h6>
               <a href="boardList.do?product_type=etc">기타</a>
            </h6>
        </div>
    </div>
    <div>
        <div class="navmenu-header" role="tab" id="headingThree">
            <h6>
               <a href="boardList.do?product_type=auction">경매장</a>
            </h6>
        </div>
    </div>
    
</div>