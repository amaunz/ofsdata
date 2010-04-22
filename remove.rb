# removes trees without edges

File.open(ARGV[0].to_s, "r") { |file|
    lines_arr = file.readlines
    in_tree_and_no_edges = false
    tree_nr = ""
    graph = ""
    lines_arr.each { |line|
        if (line.include?("t") && !in_tree_and_no_edges) then
		puts graph
		graph = ""
		graph << line
	    	in_tree_and_no_edges = true
	elsif (in_tree_and_no_edges && line.include?("e")) then
		in_tree_and_no_edges = false
		graph << line
	elsif (line.include?("t") && in_tree_and_no_edges)
		graph = ""
		graph << line 
	else
		graph << line
        end
    }
    if (!in_tree_and_no_edges) then
	    puts graph
    end
}
