$(function() {
	$('ul.tabs').tabs('#itenerary div.tab-panes > div');

	$('div.contentWrap form').live('submit', function () {
		var action = $(this).attr('action');
		$.post(action, $(this).serialize());
		return false;
	});

	$("a[rel]").live('click', function(e) {
		e.preventDefault();
		$(this).overlay({
			mask: 'black',
			closeOnClick: false,
			load: true,
			onBeforeLoad: function() {
				// grab wrapper element inside content
				var wrap = this.getOverlay().find(".contentWrap");
				// load the page specified in the trigger
				wrap.load(this.getTrigger().attr("href"));
				$open_overlay = this;
			},
			onClose: function() {
				reset_form('.event_form');
			}
		});
	});
});