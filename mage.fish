# fish completion for mage                               -*- shell-script -*-

# this function handles the mage targets and descriptions
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

# function to get completions for mage
function __fish_mage_completions
  __fish_mage_targets
end

complete -c mage -f -a "(__fish_mage_completions)"
