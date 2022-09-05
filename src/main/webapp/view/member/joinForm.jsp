<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- �� 3���� ��Ÿ �±״� *�ݵ��* head �±��� ó���� �;��մϴ�; � �ٸ� ���������� �ݵ�� �� �±׵� *������* �;� �մϴ� -->
    <title>t</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>

        let state = 0;
        function openAddressModal() {
            let a = document.querySelector(".myaddress-modal");
            if (state == 0) {
                a.style.display = "block"
                state = 1;
                console.log(state);
            }
            else if (state == 1) {
                a.style.display = "none"
                state = 0;
                console.log(state);
            }
        }

        function sample4_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function (data) {
                    // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                    // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� ǥ���Ѵ�.
                    // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                    var roadAddr = data.roadAddress; // ���θ� �ּ� ����
                    var extraRoadAddr = ''; // ���� �׸� ����
                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.

                    // console.log(data.buildingName);

                    if (data.bname !== '' && /[��|��|��]$/g.order - (data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    console.log(data);
                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    let inputAddress = "";
                    inputAddress = data.roadAddress;
                    if (data.buildingName) {
                        inputAddress = data.roadAddress + " (" + data.buildingName + ")"
                    }
                    // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                    // �����ȣ
                    document.getElementById("addressInput1").value = data.zonecode;
                    document.getElementById('addressInput2').value = inputAddress;

                }
            }).open();
        }
    </script>
    <script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(function(){
    	$('#JBtn').click(function(){
    		if($('#inputId').val()==""){
    			alert("���̵� �Է����ּ���");
    			$('#inputId').focus();
    			return false;
    			
    		}else if($('#inputPass1').val()==""){
    			alert("��й�ȣ�� �Է����ּ���");
    			$('#inputPass1').focus();
    			return false;
    			
    		}else if($('#inputPass2').val()==""){
    			alert("��й�ȣ�� Ȯ�� �Է����ּ���");
    			$('#inputPass2').focus();
    			return false;
    			
    		}else if($('#inputPass1').val()!=$('#inputPass2').val()){
    			alert("�Է��Ͻ� ��й�ȣ�� ��ġ ���� �ʽ��ϴ�.");
    			$('#inputPass2').focus();
    			return false;	
    			
    		}else if($('#inputName').val()==""){
    			alert("�̸��� �Է����ּ���");
    			$('#inputName').focus();
    			return false;
    			
    		}else if($('#addressInput1').val()==""){
    			alert("�ּҸ� �Է����ּ���");
    			$('#addressInput1').focus();
    			return false;
    		}else if($('#rcvMobile').val()==""){
    			alert("��ȣ�� �Է����ּ���");
    			$('#rcvMobile').focus();
    			return false;
    		}
    	})
    	
    })
    
    
    
    
    
    
    
    </script>
    

    <style>
        body {
            margin: 0;
        }

        html {
            line-height: 1.15;
            /*�⺻ �ణ ����*/
        }

        * {
            box-sizing: border-box;
        }

        .center {
            display: block;
            margin: auto;
            width: 100%;
            text-align: center;
        }

        div {
            box-sizing: border-box;
        }

        .title {
            padding-top: 40px;
        }

        table {
            width: 100%;
        }



        th {
            padding: 21px 0;
            border-left: 1px solid #eaeaea;
            background: #b5babd;
            color: #fff;
            font-weight: bold;
        }


        td {
            border-left: 1px solid #eaeaea;
            border-bottom: 1px solid #eaeaea;
            background: #fcfcfb;
        }


        .head-title {
            margin-top: 40px;
            text-align: center;
        }

        .head-title>span {

            width: 100%;
            height: 100%;
            margin: auto;
            font-size: 32px;
            background: linear-gradient(to top, #FFE400 20%, transparent 40%);
        }

        .cont_title01 {
            margin-top: 20px;
            padding: 10px;
            font-size: 20px;
            line-height: 38px;
            font-weight: bold;
            text-align: left;
        }

        .board_write {

            color: black;
            border-top: 1px solid #d9d9d9;
            font-size: 15px;
            line-height: 20px;
            text-align: left;
            box-sizing: border-box;
            border-right: 1px solid #d9d9d9;
        }

        .board_write th {
            color: black;
            padding: 15px 35px;
            background-color: #E5E4E4;


        }

        input.text {
            padding: 0 10px;
            margin: 15px 15px;
            border: 1px solid #c4c4c4;
            font-size: 15px;
            line-height: 33px;
            box-sizing: border-box;
        }

        .address-input {
            padding-top: 10px;
            padding-bottom: 15px;
        }

        .address-input>div>input {
            margin: 5px 0px 0px 15px;
        }

        .btn1 {
            border: 0px;
            width: 120px;
            height: 35px;
            background-color: #92979b;
            color: white;
        }
    </style>


</head>

<body>
    <!--  -->



<form action="${pageContext.request.contextPath}/member/joinPro"  method="post">
    <div class="cont_title01 " style="width: 75%; margin: auto;">
        <!--  -->
        <!--  -->
        <!--  -->
        <div class="head-title">
            <span>ȸ������</span>
        </div>
        <table class="board_write">

            <colgroup>
                <col style="width:172px">
                <col>
            </colgroup>


            <tbody>


                <p class="title">�ʼ��׸�</p>
                <tr>
                    <th scope="row">���̵�</th>
                    <td><input type="text" placeholder="���̵� �Է����ּ���." class="text" name="id" id="inputId" onkeyup="idOverlap()" style="width:200px;">
              		<!-- <button class="btn1">�ߺ�Ȯ��</button> -->
                    </td>
                </tr>
                <tr>
                    <th scope="row">��й�ȣ</th>
                    <td><input type="password" placeholder="��й�ȣ�� �Է����ּ���." class="text" name="pass" id="inputPass1" style="width:200px;">

                    </td>
                </tr>
           <tr>
                    <th scope="row">��й�ȣȮ��</th>
                    <td><input type="password" placeholder="��й�ȣ�� ���Է� �Է����ּ���." class="text" name="pass2" id="inputPass2"style="width:200px;">
                    </td>
                </tr> 
                <tr>
                    <th scope="row">�̸�</th>
                    <td><input type="text" class="text" name="name" id="inputName" style="width:200px;">
                    </td>
                </tr>
                <tr>
                    <th scope="row">�ּ�</th>
                    <td class="address-input">
                        <div>
                            <input type="text" id="addressInput1" class="text" name="address" style="width:200px;">
                            <input type="button" class="btn1" onclick="sample4_execDaumPostcode()"
                                value="�����ȣã��"></input>
                        </div>
                        <div>
                            <input type="text" class="text" style="width:533px;" id="addressInput2">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th scope="row">��ȭ��ȣ</th>
                    <td>
                        <input type="tel" id="rcvMobile" class="text" name="tel" numberonly="true" maxlength="20" value="">
                    </td>
                </tr>


            </tbody>
        </table>
        <table class="board_write">
            <colgroup>
                <col style="width:172px">
                <col>
            </colgroup>
            <tbody>
                <p class="title">�����׸�</p>
            <!--    <tr>
                    <th scope="row">�������</th>
                    <td><input type="text" class="text" name="birthday" style="width:200px;">
                    </td>
                </tr>
                <tr> --> 
                    <th scope="row">�̸���</th>
                    <td><input type="email" class="text" name="email" style="width:200px;">
                    </td>
                </tr>
                <tr>
                    <th scope="row">�г���</th>
                    <td><input type="text" class="text" name="nickname" style="width:200px;">
                    </td>
                </tr>

            </tbody>
        </table>

        <!--  -->
        <!--  -->
        <!--  -->

        <div class="center" style="margin-top: 40px;">
            <button class="btn1" type="submit" id="JBtn">����</button>
        </div>

    </div>


    <!--  -->
    <!--  -->
    <!--  -->
    <!--  -->
</form>
</body>

</html>