# reports trees without edges

File.open(ARGV[0].to_s, "r") { |file|
    lines_arr = file.readlines
    in_tree_and_no_edges = false
    tree_nr = ""
    lines_arr.each { |line|
        if (line.include?("t") && !in_tree_and_no_edges) then
	    	in_tree_and_no_edges = true
		tree_nr = line.split[2]
	elsif (in_tree_and_no_edges && line.include?("e")) then
		in_tree_and_no_edges = false

	elsif (line.include?("t") && in_tree_and_no_edges)
		puts tree_nr << " has no edges!"
        tree_nr = line.split[2]
        end
    }
}
