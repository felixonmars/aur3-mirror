# Maintainer: Thomas Haider <t.haider@deprecate.de>
pkgname=vim-bbye-git
_pkgname=vim-bbye
pkgver=22.a018cbc
pkgrel=1
pkgdesc="Delete buffers in vim without closing your windows or messing up your layout."
arch=('any')
url="https://github.com/moll/vim-bbye"
license=('custom:vim')
groups=('vim-plugins')
depends=('vim')
conflicts=('$_pkgname')
provides=('$_pkgname')
makedepends=('git')
source=("git://github.com/moll/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  installpath="${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 vim-bbye/plugin/bbye.vim $installpath/plugin/bbye.vim
}

# vim:set ts=2 sw=2 et:
