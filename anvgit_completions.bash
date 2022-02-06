# bash completion for anvgit cli
_anvgit_complete()
{

    local cur_word prev_word
    cur_word="${COMP_WORDS[COMP_CWORD]}"
    snd_word="${COMP_WORDS[1]}"
    prev_word="${COMP_WORDS[COMP_CWORD-1]}"

    sub_cmds="build checkout cleanUpDockers clearDockers clone count createFnpsBranch createWorkBranch deliverContentToIntBranch exec prebase pull push pushToGerrit rebaseFeatureBranchFromInt rebuild removeRemoteFeatureBranch removeFeatureBranch removeLocalFeatureBranch syncUpdatesFromIntBranch updateWebComponentVersions"
    build_cmds="m2clean --no-sonar --docker-only --docker --sanity-only --sanity --include-repo --modified-repo --all-test --all-test-only --vonu-docker-only -DskipTests -do -ns"
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

