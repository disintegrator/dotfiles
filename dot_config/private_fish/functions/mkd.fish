function mkd --description "Create a directory and return its path"
    if test (count $argv) -eq 0
        echo "Usage: mkd <directory_name>"
        return 1
    end
    
    set -l dir_path $argv[1]
    
    # Create the directory (including parent directories if needed)
    mkdir -p $dir_path
    
    if test $status -eq 0
        # Return the absolute path of the created directory
        realpath $dir_path
    else
        echo "Failed to create directory: $dir_path"
        return 1
    end
end
