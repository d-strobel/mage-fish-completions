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
          string match -r '<.+>' $param
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
  # get current commandline args
  set -l args (commandline -opc)

  # check if args are provided
  if test (count $args) -eq 1
    __fish_mage_targets
  else
    # get available parameters for target
    set -l params (__fish_mage_target_params $args[2])
    set -l arg_count (math (count $args) - 2)

    # check if all available parameters are set
    if test $arg_count -lt (count $params)
      # complete with next available parameter
      set -l next $params[(math $arg_count + 1)]
      string trim --chars='<>' $next
    end
  end
end

# complete mage command
complete -c mage -f -k -a "(__fish_mage_completions)"
