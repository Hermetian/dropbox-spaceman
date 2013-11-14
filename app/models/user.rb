class User < ActiveRecord::Base
	has_many :dbmetas
	attr_accessible :uid, :total_space, :shared_used, :normal_used


	# If we already have an authorized DropboxSession, returns a DropboxClient.
	def get_dropbox_client
	    if session[:access_token]
	        return DropboxClient.new(session[:access_token])
	    end
	end

	# -------------------------------------------------------------------
	# File/folder display stuff

	def update(client)
		self.recurse_metadata(client, '/')
		#todo: add /delta operations. 
	end

	def recurse_metadata(client, path)
		metadata = client.metadata(path)
		Dbmeta.create(is_dir: metadata["is_dir"], size: metadata["size"], path: path)
		if "is_dir"
			metadata["contents"].each do |element|
				recurse_metadata(client, element["path"])
			end
		end
	end

	def find_largest(n)
		return Dbmeta.order("size").first(n)
	end

#	def find_largest_files(n)
#		return Dbmeta.order("size").where(:is_dir = false).first(n)
#	end

#	def find_largest_directories(n)
#		return Dbmeta.where(:is_dir = true).order("size").first(n)
#	end

end