# Maintainer: William Giokas <1007380@gmail.com>

pkgname=makepkg-templates-ks-git
_pkgname=makepkg-templates-ks
pkgver=0.9.g6c8d8ae
pkgrel=1
pkgdesc="A collection of templates for makepkg-template"
arch=('any')
url="http://git.kaictl.net/wgiokas/makepkg-templates.git"
license=('MIT')
makedepends=('git')
provides=('makepkg-templates-ks')
conflicts=('makepkg-templates-ks')
source=("${_pkgname}::git://git.kaictl.net/pub/wgiokas/makepkg-templates")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "0.$(git rev-list --count HEAD).g$(git log -1 --format="%h")"
}

package() {
  cd "$srcdir/$_pkgname"

  for template in *.template; do
    unset nover
    nover=${template%-*.template}
    install -Dm644 $template "$pkgdir/usr/share/makepkg-template/$template"
    ln -sv $template "$pkgdir/usr/share/makepkg-template/${nover}.template" 
  done
}
