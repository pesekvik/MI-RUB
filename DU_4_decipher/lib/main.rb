class Decipher
	def decipher(input_file_name)
		result = ""
		File.open(input_file_name) do |file|
			while contents = file.gets
				contents.to_s().each_byte do |c|
					result +=  "#{(c-7).chr}"
				end
				result += "\r\n"
			end
		end
		return result
	end
end