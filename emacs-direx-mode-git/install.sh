post_install() {
    echo "Add this to your ~/.emacs:"
    echo "(require 'direx)"
    echo "(global-set-key (kbd \"C-x C-j\") 'direx:jump-to-directory)"
}
