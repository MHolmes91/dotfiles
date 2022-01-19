# Override existing .zprofile by sourcing this at the end after installing zprezto

# Mac-specific
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'

  # Homebrew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling would bedisabled by -X (disable screen clearing).
# We Removed -X to enable it.
export LESS='-g -i -M -R -S -w -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

