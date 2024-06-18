# fish completion for mage                               -*- shell-script -*-

# function that handles the mage targets and descriptions
function __fish_mage_targets
  # get targets from mage
  # suppress stderr output
  set -l targets (mage -l 2>/dev/null)

  if test "$targets[1]" = ''
    return
  end

  # loop over targets and skip the first line
  for target in $targets[2..]
    # first trim leading and trailing whitespaces
    # then split the target into two parts on the first space
    set -l split (string split -m 1 ' ' (string trim $target))

    # format the output as a fish completion
    # first string is the command, second is the description
    printf %s\t%s\n $split[1] $split[2]
  end
end

# function to get parameters for a specific target
function __fish_mage_target_params
set -l target $argv[1]
  set -l params (mage -h $target 2>/dev/null)

  # extract parameters from the help output
  set -l in_usage 0
  for line in $params
    if test $in_usage -eq 1
      # we are in the "Usage" section, so extract parameters
      if string match -q -r '^\s*mage\s+' $line
        # trim whitespace and split the helper string
        set -l param_line (string trim $line)
        set -l params (string split ' ' $param_line)

        # print parameters for autocompletion
        for param in $params
          # only match mage target parameter
          if string match -q -r '<.+>' $param
            printf %s\n $param
          end
        end
        return
      end
    else if string match -q -r '^Usage:' $line
      set in_usage 1
    end
  end
end

# function to get completions for mage
function __fish_mage_completions
  __fish_mage_targets
end

# complete mage command
complete -c mage -f -k -a "(__fish_mage_completions)"
