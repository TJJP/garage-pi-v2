// Authentication and Authorization Middleware //Also forces https

const auth = function(req, res, next) {
	if (req.session && req.session.admin) //if signed in then continue
		return next();
	else
		return res.redirect('/login'); //redirect to login page
};

module.exports = {auth};