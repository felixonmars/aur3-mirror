# Maintainer: William Osendott <william.osendott@gmail.com>

_pkgname=frost-cursor-theme
pkgname=frost-cursor-theme-git
pkgver=9.4f5df9f
pkgrel=1
pkgdesc='Frost-Cursor theme for Arch-Frosh GTK/Shell themes'
arch=('any')
url='https://github.com/osendott/frost-cursor-theme'
license=('GPL3')
makedepends=('git')
provides=('frost-cursor-theme')
conflicts=('frost-cursor-theme')
source=('frost-cursor-theme::git+https://github.com/osendott/frost-cursor-theme.git')
md5sums=('SKIP')


pkgver() {
    cd ${srcdir}/${_pkgname}
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
package() {
  cd ${_pkgname}
  install -dm 755 "${pkgdir}"/usr/share/icons/
  cp -r --no-preserve='ownership' frost-cursor-theme "${pkgdir}"/usr/share/icons/
  
}

