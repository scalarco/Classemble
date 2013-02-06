// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$().ready(function(){
  $(".chzn-select").chosen();

	//Click project and shrink
	$('.project-wrapper').click(function(){
		var project_id = $(this).data('project');
		var state = $('#project-content').data('state');
		$('.project-wrapper').removeClass('selected');
		$(this).addClass('selected');
		if(state == 'visible'){
			$('#project-content').attr('data-project', project_id);
			$('#project-content').fadeOut();
			$('#project-content').find('.skills-wrapper').html('');
			setTimeout(function(){
				$.get('/projects/' + project_id + '.json', function(data){
					var skillSet = data.skills.split('&');
					_.each(skillSet, function(item){
						if(item !== ''){
							$('#project-content').find('.skills-wrapper').append('<div class="skill">' + item + '</div>');
						}
					});
					$('#project-content').find('.project_title').text(data.title);
					$('#project-content').find('.project_description').text(data.description);
					$('#project-content').find('#applicants').text(data.application_count);
				});
				$('#project-content').fadeIn();
			}, 500);
		} 
		else {
			$(this).parent().animate({
				width: '22%'
			});
			//Expand content
			$('#project-content').attr('data-project', project_id);
			$('#project-content').show()
								.data('state', 'visible')
								.animate({
				'width': '67%',
				'margin-left' : '20px',
				'padding' : '20px'
			});
			$('.project-quick-title').animate({
				'font-size' : '24px',
				'margin-top' : '0px'
			});
			$('#project-content').find('.skills-wrapper').html('');
			$.get('/projects/' + project_id + '.json', function(data){
				var skillSet = data.skills.split('&');
				_.each(skillSet, function(item){
					if(item !== ''){
						$('#project-content').find('.skills-wrapper').append('<div class="skill">' + item + '</div>');
					}
				});
				$('#project-content').find('.project_title').text(data.title);
				$('#project-content').find('.project_description').text(data.description);
				if(data.application_count == 1)
					{ var apps = "1 person has"; } 
				else { 
					var apps = data.application_count + " people have";
				}
				$('#project-content').find('#applicants').text(apps);
			});
			//Hide left content
			$('.project-center').hide();
			$('.project-left').animate({ width: '50%' });
		}
	});

	//APply to join
	$('#join').click(function(e){
		e.preventDefault();
		var project = $('#project-content').attr('data-project');
		var path = $(this).attr('href');
		var newPath = path + '?project_id=' + project;
		location.href= newPath;
	});
});
