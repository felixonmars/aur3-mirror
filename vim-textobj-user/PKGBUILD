# Maintainer: Peter Lewis <plewis@aur.archlinux.org>

pkgname=vim-textobj-user
_pkgname=textobj-user
pkgver=0.3.9
_pkgver=12866
pkgrel=1
pkgdesc="a Vim plugin to support writing user-defined text objects."
arch=('any')
url="http://www.vim.org/scripts/script.php?script_id=39"
license=('custom:vim')
groups=(vim-plugins)
depends=(vim-runtime)
install=${pkgname}.install
changelog=
source=("${pkgname}.vba::http://www.vim.org/scripts/download_script.php?src_id=${_pkgver}")
noextract=()
sha256sums=('1cf8d0edf5efc7d212f602db0c4c206ca97269dae3977e1da1d6a07941da3427')

build() {
    /bin/true
}

package() {
  installpath="${pkgdir}/usr/share/vim/vimfiles/"
  cd ${srcdir}/${pkgname}-${pkgver}
    
  /usr/bin/vim -c ":UseVimball ." -c ":q" ${pkgname}.vba

  install -Dm644 autoload/textobj/user.vim ${installpath}/autoload/textobj/user.vim
  
  install -Dm644 doc/${_pkgname}.txt ${pkgdir}/usr/share/vim/vimfiles/doc/${_pkgname}.txt
}


# vim:set ts=2 sw=2 et ft=sh et:
