if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting
end

alias sl = "ls"

starship init fish | source
