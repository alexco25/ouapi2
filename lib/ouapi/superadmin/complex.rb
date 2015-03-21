module OUApi	
class Superadmin
 	
	#---Create Account,Site,and User---
	def default_account(args)
		accounts = args[:accounts]
		site = args[:site]
		user = args[:user]

		create_account(accounts)

		site[:account] = accounts[:name]
		test = test_connection(site)
		if test.code == "200"
			puts "Site Credenitals passed connection test"
			response = create_site(site)

			user[:account] = accounts[:name]
			create_user(user)
		else
			puts "Site credentials are invalid, Run away, Run away!!!"
			abort
		end
	end
	#----------------------------------

end
end