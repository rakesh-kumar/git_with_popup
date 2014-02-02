class Demon < ActiveRecord::Base
  attr_accessible :address, :name


def self.for_dashboard
  order('created_at DESC').limit(5)
end
  def word_count
  	name.split.count
  end
	def self.total_word_count
		all.inject(0) { |total, var| total += var.word_count }
	end

end

