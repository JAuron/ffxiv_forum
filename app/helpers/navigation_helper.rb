module NavigationHelper
	def section_linker(section_id)
		if section_id
			if section_id == 0
				link_to "#{Section.find(section_id).title}", "/forum" 
			else
				link_to "#{Section.find(section_id).title}", "/forum/#{section_id}" 
			end
		end
	end

	def backchain(section_id)
		chain_links = []
		while section_id
			section = Section.find(section_id)
			chain_links << section_linker(section.id).html_safe
			section_id = section.parent_section_id
		end
		chain_links.reverse.join(' > ').html_safe + ' >'
	end
end
