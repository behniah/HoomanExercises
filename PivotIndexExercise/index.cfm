<!DOCTYPE html>
<html lang="en">
<head>
    <title>Exercises</title>
    <meta charset="utf-8"/>
    <link rel="stylesheet" href="library/css/styles.css" media="screen" />
    <script src="library/scripts/jquery-min.js" type="text/javascript"></script>
	<script src="library/scripts/pivotIndex.js" type="text/javascript"></script>
</head>

<body>
    <div id="content">
	 	<section id="contact">
            <hgroup>
				<h1>Pivot Array</h1>
                <h3>Please input the comma separated members of your array below(e.g 1,3,4,5,6)</h3>
            </hgroup>
            <form name="arrayForm" id="arrayForm" method="POST" action="dsp_check_pivot_index.cfm"> 
				
					   
                	<input class="data" id="arrayList" name="arrayList" type="text" required />
				

                <input class="linkButton" id="submitForm" name="submitForm" type="button" value="Submit" /> 
            </form>
    	</section>
       
    </div>
</body>
</html>