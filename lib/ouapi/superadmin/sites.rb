module OUApi	
class Superadmin
 	
	#---grabs the asset set from OUAPi----
 	def site
 		OUApi.superadmin_site
	end
	#-------------------------------------

	#--- create site --------------------
	#-- Grabs the default :new account params from the default value, and merges the user values into it. 
	#-- If name is no privided, then the name will be a random string
	#-- params  - a hash of create account params. see the account api set :new
	def create_site(params={name:random_string})
		new_site = site[:new]
		params[:site] = params[:name]
		new_site[:params].merge!(params)
		new_site[:params][:address] = append_ftp_value(new_site[:params][:address],new_site[:params][:ftp_type])
		post(new_site)
	end
	#-------------------------------------

	#--- test_connection------------------
	def test_connection(params)
		test = site[:test_connection]
		test[:params].merge!(params)
		get(test)
	end
	#-------------------------------------
end
end