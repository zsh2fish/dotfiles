#colors
#############################################################################
# prompt
autoload -U colors
setopt prompt_subst
PROMPT="[%n %1~]%(!.#.$) "


# dir_colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dir_colors && eval "$(dircolors -b ~/.dir_colors)" || eval "$(dircolors -b)"
fi

# LS_COLORS completion
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# git prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' max-exports 7
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats '%s' '%r' '%b' '%c' '%u'
zstyle ':vcs_info:*' actionformats '%s' '%r' '%b|%a' '%s' '%c' '%u'

function echo_rprompt () {
    LANG=en_US.UTF-8 vcs_info

    if [[ -n "${vcs_info_msg_0_}" ]] ; then
        # repository path
        repos="%F{blue}${vcs_info_msg_1_}%f"

        # branch
        color="{green}"                                        # ok
        [[ -n "${vcs_info_msg_4_}" ]] && color="{yellow}"      # no commit
        [[ -n "${vcs_info_msg_5_}" ]] && color="{red}"         # unstaged
        [[ -n "${vcs_info_msg_2_}" ]] && branch="%F${color}${vcs_info_msg_2_}%f"

        # right_prompt
        echo "[%35<..<${repos}@${branch}%<<]"
    else
        # right_prompt
        echo "[%F{blue}%100<..<%~%<<%f]"
    fi
}

setopt prompt_subst
RPROMPT='$(echo_rprompt)'

setopt no_prompt_cr
PS1="%{${(pl:COLUMNS+1:: ::\r:)}%}$PS1"

#############################################################################
# docker





