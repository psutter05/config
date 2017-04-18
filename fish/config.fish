# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

# Add virtualfish
eval (python -m virtualfish)

# projs function
set -u project_base_path $HOME"/Projects/"
set -l project_names (ls ~/Projects/)
eval complete -c projs -a "\"$project_names\"" -f

alias vim=nvim

set fish_greeting (date)

# A couple of aliases
alias jmeter="bash /home/pierre/Misc/apache-jmeter-3.1/bin/jmeter.sh"
alias idea="bash /home/pierre/Misc/idea-IC-163.12024.16/bin/idea.sh"
