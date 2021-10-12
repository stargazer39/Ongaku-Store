let searchBox = $("#search");
let results_container = $("#results-container");

searchBox.on("input" , (e) => {
	let query = $(e.target).val();
	$.getJSON(`getArtists?like=` + query, (data) => {
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
					<div>${d.artistName}</div>
					<div class="spacer"></div>
					<form action="addSong.jsp"> 
						<input type="hidden" name="artistId" value="${d.artistId}"> 
						<input type="submit" value="Add Song">
					</form>
						<button>Delete</button>
					<form action="updateArtist.jsp">
						<input type="hidden" name="artistId" value="${d.artistId}"> 
						<input type="submit" value="Update">
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