### terminal notes RUBY


* User.first.comments << p.comments.create({body: "sometext"})
	* pushes a comment to a user 
* User.first.comments << Post.first.comments.first.comments.create({body: "hillarious"})
	* pushes a sub comment to the first post, first comment
* User.first.comments << Post.first.comments.first.comments.first.comments.create({body: "subcommenting like a mo-fo"})
	* sub comment
