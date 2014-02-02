class Numberdetail < ActiveRecord::Base
  attr_accessible :amount, :mobile_number, :service_provider, :serviceprovider, :details
  belongs_to :serviceprovider
	

	# def self.search(search)
	# 	if search
	# 	  where('details LIKE ?', "%#{search}%")
	# 	else
	# 	  scoped
	# 	end
	# end
	def self.search(term)

		if term
			search_condition = "%" + term + "%" 
			find(:all, :conditions => ["details like ?", search_condition])
		else
			find(:all)
		end
	end
  
end
