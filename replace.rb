# restores original numberings from a smiles file

def GetKeys(keys);
    File.open(ARGV[1].to_s, "r") {|file|
        oldkey = ""
        file.readlines.each{|line|
            key = line.split[0]
            if (key.size && key != oldkey)
                keys << key
            end
            oldkey = key
        }
    }
    keys
end

keys = []
keys = GetKeys(keys)
File.open(ARGV[0].to_s, "r") { |file|
    lines_arr = file.readlines
    i=0
    lines_arr.each { |line|
        if (line.include?("#")) then
            print "t # " << keys[i] << "\n"
            i=i+1
        else
            puts line
        end
    }
}
