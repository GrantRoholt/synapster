module ApplicationHelper
# returns the full title on a per-page basis
def full_title(page_title)    # Definition & Assigment "full_title" method, with "page_title" argument
	base_title = "Synapster"  # Variable assignment
	if page_title.empty?      # Boolean test
		base_title            # Implicit return
	else
		"#{base_title} | #{page_title}" # String interpolation
	end
  end
end
