function check_develop(remote_url, verbose=true)
    # Check if the `develop` branch exists in the remote repository
    branch_exists = false

    try
        cmd_str = String(read(Cmd(`git ls-remote --heads $remote_url develop`))
        branch_exists = occursin("develop", cmd_str)
    catch e
    end
    
    if branch_exists
        println("$remote_url - has develop")
    else
        println("$remote url - does not have develop")
    end

    branch_exists
end
