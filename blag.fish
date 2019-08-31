#!/usr/bin/fish

# https://interrupt.memfault.com/blog/building-a-cli-for-firmware-projects

function blag
    set scriptdir (dirname (status --current-filename))
    # test for argument count and bail if none provided
    if test (count $argv) -eq 0
        echo "error: insufficient arguments" 1>&2
        blag help
        return 1
    end

    switch $argv[1]
        case help
            echo
            echo "usage:"
            echo "    help: display help/usage"
            echo "    index: open local index.html in firefox"
            echo "    live: open production fouric.github.io in firefox"
            echo "    jay: open jay's gitlab site in firefox"
        case index
            firefox $scriptdir/index.html
        case live
            firefox "https://fouric.github.io/"
        case jay
            firefox "https://gitlab.com/jaynky/last-lambda"
        case '*'
            echo "error: unrecognized option: " $argv[1] 1>&2
            blag help
    end
end

blag $argv
