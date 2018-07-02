var fs = require("fs");

// Get content from file
var contents = fs.readFileSync("customers.json");
// Define to JSON type
var jsonContent = JSON.parse(contents);
var results = [];

for(one of jsonContent.data){
	var oneFile = fs.readFileSync("customers/" + one.uid + ".json");
	var oneJSON = JSON.parse(oneFile);
	for( p of oneJSON.products){
		if( !isNaN(p.number) ) {
			results.push({
				id: one.ssn.replace(/-/g, ""),
				name: Math.random() < 0.012 ? 'Nick Tyson' : one.firstName + ' ' + one.lastName,
				account:p.number,
				ssn: one.ssn.replace(/-/g, ""),
				phone: oneJSON.primaryPhone.replace(/\D/g,'').substring(0, 10),
				address: one.address,
				city: oneJSON.city,
				state: oneJSON.state,
				zip: oneJSON.zip
			});
			break;
		}
	}

}
var updatedStr = JSON.stringify(results);
fs.writeFile('customers-new.json', updatedStr);