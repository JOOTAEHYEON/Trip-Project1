

		document.getElementById('selectAll').addEventListener(
				'change',
				function() {
					var checkboxes = document
							.querySelectorAll('.custom-checkbox');
					checkboxes
							.forEach(function(checkbox) {
								checkbox.checked = document
										.getElementById('selectAll').checked;
							});
					  itemSum(document.form);

				}				
		);

	
	<!--  토탈 계산 하는스크립트  -->
	




	function itemSum(frm)
	{
	   var sum = 0;
	   var count = frm.chkbox.length;
	   for(var i=0; i < count; i++ ){
	       if( frm.chkbox[i].checked == true ){
		    sum += parseInt(frm.chkbox[i].value);
	       } 
	       
	   }
	   frm.total_sum.value = sum + '원';
	}
	

	


 

