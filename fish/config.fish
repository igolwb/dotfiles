source /usr/share/cachyos-fish-config/cachyos-config.fish

function fish_greeting
  
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

fish_add_path /home/ingot/.spicetify
