class Url < ActiveRecord::Base

	validates :long_url, :presence => true , :format => URI::regexp(%w(http https))
	validates :short_url, :presence => true

	def counter
		self.click_count = 0 if self.click_count == nil
	end

	def self.retrieve_short_url(proper_long_url)
		Url.find_by(long_url: proper_long_url).short_url if Url.find_by(long_url: proper_long_url) != nil
	end

	def shorten
		# range = [*'0'..'9', *'A'..'Z', *'a'..'z']

		# @short_url = (0...6).map{range.sample}.join
		# self.short_url = @short_url

		#self.short_url = SecureRandom.urlsafe_base64(8)
		if self.short_url == nil
		  self.short_url = "clone" + SecureRandom.hex(2.5)
	  end
	end

end