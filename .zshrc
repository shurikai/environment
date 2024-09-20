export PATH=$PATH:$HOME/aws/:"/Applications/IntelliJ IDEA.app/Contents/MacOS/"

alias awsLogin=~/aws/awsLogin.account
alias ecrLogin='aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 290503755741.dkr.ecr.us-east-1.amazonaws.com'

alias ls='eza --icons=always --git'
alias cat='bat'

crewProd () {        
        awssaml get-credentials --account-id 637843665543 --name "crew-prod1" --role swa/SWACSOperations --user-name x318323 --duration 14400;
        awssaml populate-aws-credentials;
        awssaml export-active;
        export AWS_DEFAULT_PROFILE=637843665543-SWACSOperations;
        export AWS_PROFILE=637843665543-SWACSOperations;
        export AWS_DEFAULT_REGION=us-east-1;
        export AWS_REGION=us-east-1;
        ecrLogin;
        aws --profile default eks get-token --cluster-name crew-prod1;
}

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/pure.omp.json)"
    #eval "$(oh-my-posh init zsh --config ~/.config/ohmyposh/tokyo.omp.json)"
fi

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

