function gotoProject(event, url) {
	debugger;
	const projectId = url.split('/').pop();

	const card = event.target.closest('[id^=\"project-\"]');
	if (card) {
		card.style.viewTransitionName = `project-${projectId}-card`;

		const name = card.querySelector('h1');
		if (name) {
			name.style.viewTransitionName = `project-${projectId}-name`;
		}
	}

	document.startViewTransition(() => {
		window.location.href = url;
	});
}

// Make function available globally
window.gotoProject = gotoProject;
