<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  body {
        margin: 0;
        font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
        font-size: 14px;
        line-height: 20px;
        color: #333;
        background-color: #fff;
  padding-left: 15px;
    }
    
    .btn {
        display: inline-block;
        padding: 6px 12px;
        margin-bottom: 0;
        font-size: 14px;
        font-weight: 400;
        line-height: 1.42857143;
        text-align: center;
        white-space: nowrap;
        vertical-align: middle;
        -ms-touch-action: manipulation;
        touch-action: manipulation;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
        background-image: none;
        border: 1px solid transparent;
        border-radius: 4px;
    }
    
    .btn-default {
        color: #333;
        background-color: #fff;
        border-color: #ccc;
    }
    
    h1{
        font-size: 36px;
    }
    
    h1{
        font-family: inherit;
        font-weight: 500;
        line-height: 1.1;
        color: inherit;
    }
    
    h1 small{
        font-size: 65%;
    }
    
    h1 small {
        font-weight: 400;
        line-height: 1;
        color: #777;
        display: block;
       padding-top: 15px;
    }
    .specific{
    	background-color: #fff;
    }

p a{
  padding: 5px;
}
</head>
<body>

<div class="specific">
		<h1>Click to Take a Screenshot & Download it! <small>using html2canvas.js + canvas2image.js</small></h1> 
		<p>
		    This is a simple demo.
		</p>
  <p>
		   Use html2canvas.js to take a screenshot of a specific div and then use canvas2image.js to download the screenshot as an image locally to your filesystem.
		</p>
		<button type="button" class="btn btn-default">Take a Screenshot!</button>
  <p>References:  <a href="https://html2canvas.hertzen.com/">html2canvas.js</a><a href="https://github.com/SuperAL/canvas2image">canvas2image.js</a></p>
	</div>
</body>
</html>
