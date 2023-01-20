function check_develop(remote_url)
    # Check if the `develop` branch exists in the remote repository
    branch_exists = false

    try
        cmd_str = String(read(Cmd(`git ls-remote --heads $remote_url develop`)))
        println(cmd_str)
        branch_exists = occursin("develop", cmd_str)
    catch e
    end

    branch_exists
end
