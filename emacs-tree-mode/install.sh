## arg 1:  the new package version
post_install() {
  echo "Add this to your ~/.emacs:"
  echo "(autoload 'imenu-tree \"imenu-tree\" \"Imenu tree\" t)"
  echo "(autoload 'tags-tree \"tags-tree\" \"TAGS tree\" t)"
}
