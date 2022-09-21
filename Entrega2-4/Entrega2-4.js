use('test')

db.restaurants.find( {});
db.restaurants.find( {} , {restaurant_id: 1, name: 1, borough: 1, cuisine: 1});
db.restaurants.find( {} , {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find( {} , {restaurant_id: 1, name: 1, borough: 1, address: {zipcode: 1}, _id:0});
db.restaurants.find({borough: "Bronx"});.
db.restaurants.find({borough: "Bronx"});.limit(5)
db.restaurants.find({borough: "Bronx"});.skip(5).limit(5)
db.restaurants.find({grades: {$elemMatch: { score: {$gt: 90}}}});
db.restaurants.find({grades: {$elemMatch: { score: {$gt: 80, $lte: 100}}}});
db.restaurants.find({'address.coord.1': {$gt: -95.754168}});
db.restaurants.find({$and: [{cuisine: {$not: {$regex: /American/}}}, {grades: {$elemMatch: { score: {$gt: 70}}}}, {'address.coord.1': {$gt: -65.754168}}]});
db.restaurants.aggregate([{$match: {cuisine: {$not: {$regex: /American/}}}}, {$group: {grades}])
db.restaurants.find({$and: [{cuisine: {$not: {$regex: /American/}}}, {grades: {$elemMatch: { grade: 'A'}}}, {borough: {$not: {$regex: /Brooklyn/}}}]});.sort({cuisine: -1});
db.restaurants.find( {name: {$regex: /^Wil/}} , {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find( {name: {$regex: /ces$/}} , {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find( {name: {$regex: /Reg/}} , {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find({$and: [{borough:"Bronx"}, {$or: [{cuisine:'Chinese'}, {cuisine: 'American'}]}]});
db.restaurants.find( {$or: [{borough:"Staten Island"}, {borough:"Queens"} , {borough:"Bronx"}, {borough:"Brooklyn"} ]}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find( {$nor: [{borough:"Staten Island"}, {borough:"Queens"} , {borough:"Bronx"}, {borough:"Brooklyn"}]}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.aggregate({$unwind: grades}, {$group: {_id: "$grades.score"}, "score": {$avg : "grades.score"}});
db.restaurants.find({$and: [{cuisine: 'fish'}, {cuisine: {$not: {$regex: /American/}}}, {cuisine: {$not: {$regex: /Chinese/}}}, {name: {$not: {$regex: /^Will/}}}]}, {restaurant_id: 1, name: 1, borough: 1, cuisine: 1, _id:0});
db.restaurants.find({$and: [{grades: {$elemMatch: { grade: 'A'}}},{'grades.date': {"$gte": ISODate("2014-08-11T00:00:00Z")}}, {'grades.score': {$gte: 11}}]}, {restaurant_id: 1, name: 1, grades: 1, _id:0});
db.restaurants.find({$and: [{'grades': {$elemMatch: { grade: 'A'}}},{'grades.date': {"$gte": ISODate("2014-08-11T00:00:00Z")}}, {'grades.score': {$gte: 9}}]}, {restaurant_id: 1, name: 1, grades: 1, _id:0});
db.restaurants.find({'address.coord.1': {$gt: 42, $lt: 52}},{restaurant_id: 1, name: 1, address: 1, coord:1, _id:0});
db.restaurants.find().sort( { name: 1 } )
db.restaurants.find().sort( { name: -1 } )
db.restaurants.find().sort({cuisine:1}, {borough: - 1});
db.restaurants.find({ "address.street": { "$in": [ null, "" ] } });
db.inventory.find( { 'address.coord': { $type: "double" } });
db.database.aggregate([{$unwind: "$grades"}, {$project: {"score_to_zero": {$divide: ["$grades.score", 7]}}}, {$match: {"score_to_zero" : {$lte: 1}}}, {restaurant_id: 1, name: 1, score: 1, _id:0});
db.restaurants.find( {name: {$regex: /mon/}} , {name: 1, borough: 1, 'address.coord': 1, cuisine: 1, _id:0});
db.restaurants.find( {name: {$regex: /^Mad/}} , {name: 1, borough: 1, 'address.coord': 1, cuisine: 1, _id:0});