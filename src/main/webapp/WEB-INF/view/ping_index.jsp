<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<div>
    <button type="button" id="buy">
        commit order
    </button>
</div>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>
    $(function () {
        var url = "http://ht.kam365.com/kam/pingplus/createCode";
//        var url = "http://localhost:8080/pingplus/createCode";
        $("#buy").click(function () {
            $.get(url,function (data) {
                window.location.href = data;
            });
        });
    });
</script>
</body>

</html>