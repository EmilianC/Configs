# ripgrep with clean output.
function rip()
{
    rg -n --no-heading --trim --color always $@
}

# ripgrep with clean output and interactive scrolling.
function ripl()
{
    rg -n --no-heading --trim --color always $@ | less
}

# Create and navigate into a new directory.
function mkcd()
{
    mkdir -p -- "$1"
    cd -- "$1"
}
