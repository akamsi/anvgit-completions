# bash completion for anvgit cli
_anvgit_complete()
{

    local cur_word prev_word
    cur_word="${COMP_WORDS[COMP_CWORD]}"
    snd_word="${COMP_WORDS[1]}"
    prev_word="${COMP_WORDS[COMP_CWORD-1]}"

    sub_cmds="attest build buildStatus checkout cleanUpDockers clearDockers clone count createFnpsBranch createWorkBranch deliverContentToIntBranch exec help prebase pull push pushMod pushToGerrit quickBuild rebaseFeatureBranchFromInt rebuild removeFeatureBranch removeLocalFeatureBranch removeRemoteFeatureBranch sonar syncUpdatesFromIntBranch updateWebComponentVersions ut validate"
    build_cmds="--all-test --all-test-only --docker --docker-only --help --include-repo --include-repo --m2clean --modified-repo --modified-repo --no-rflint --no-sonar --rflint --sanity --sanity-only --time-metrics --vonu-docker-only -do -DskipTests -ns -sd rebuild"
    case ${COMP_CWORD} in
        1)
            COMPREPLY=($(compgen -W "$sub_cmds" -- $cur_word))
            ;;
        2)
            case ${prev_word} in
                build)
                    COMPREPLY=($(compgen -W "$build_cmds" -- $cur_word))
                    ;;
                clone)
                    COMPREPLY=($(compgen -W "checkout" -- $cur_word))
                    ;;
            esac
            ;;
        *)
            case ${snd_word} in
                build)
                    COMPREPLY=($(compgen -W "$build_cmds" -- $cur_word))
                    ;;
            esac
            ;;
    esac
}
complete -F _anvgit_complete anvGit
complete -F _anvgit_complete anvgit

