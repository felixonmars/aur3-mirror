# Maintainer: Peter Lewis <plewis@aur.archlinux.org>

pkgname=vim-textobj-rubyblock
_pkgname=textobj-rubyblock
pkgver=0.0.2
_pkgver=14652
pkgrel=1
pkgdesc="Select blocks of ruby code using 'var'"
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=39"
license=('custom:vim')
groups=(vim-plugins)
depends=(vim-runtime vim-matchit vim-textobj-user)
install=${pkgname}.install
changelog=
source=("${pkgname}.vba::http://www.vim.org/scripts/download_script.php?src_id=${_pkgver}")
noextract=()
sha256sums=('a98c9a68238febae3bbe5ad9bae0fe8aaafb4bd39fa40a7c0687a2ab53d92a33')

build() {
    /bin/true
}

package() {
  installpath="${pkgdir}/usr/share/vim/vimfiles/"
  cd ${srcdir}
    
  /usr/bin/vim -c ":UseVimball ." -c ":q" ${pkgname}.vba

  #install -Dm644 doc/tags ${pkgdir}/usr/share/vim/vimfiles/doc/tags
  install -Dm644 plugin/textobj/rubyblock.vim ${installpath}/plugin/textobj/rubyblock.vim
  
  install -Dm644 doc/${_pkgname}.txt ${pkgdir}/usr/share/vim/vimfiles/doc/${_pkgname}.txt
}


# vim:set ts=2 sw=2 et ft=sh et:
