let searchBox = $("#search");
let results_container = $("#results-container");

searchBox.on("input" , (e) => {
	let query = $(e.target).val();
	$.getJSON(`getSongs?like=` + query, (data) => {
		console.log(data);
		debounce(fillResults(results_container, data),1000);
	});
});

function fillResults(parentElem, data) {
	parentElem.html("");
	if(typeof(data) === "object"){
		for(let d of data){
			parentElem.append($(`
				<div class="d-flex flex-row">
					<div>${d.title}</div>
					<div class="spacer"></div>
					<form action="updateSong.jsp">
						<input type="hidden" name="songId" value="${d.songId}"> 
						<input type="submit" value="Update">
					</form>
					<form action="deleteSong" method="POST">
						<input type="hidden" name="songId" value="${d.songId}"> 
						<input type="submit" value="Delete">
					</form>
				</div>
			`));
		}	
	}
	
}
function debounce(func, delay){
    let debounceTimer
    return function() {
        const context = this
        const args = arguments
            clearTimeout(debounceTimer)
                debounceTimer
            = setTimeout(() => func.apply(context, args), delay)
    }
} 