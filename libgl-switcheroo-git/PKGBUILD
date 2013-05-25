# Maintainer: Alexander Schneider <sailerboy>

pkgname=libgl-switcheroo-git
pkgver=1
pkgrel=1
pkgdesc="Chose between discrete and integrated graphics when you launch an application."
arch=('i686' 'x86_64')
url="https://github.com/amonakov/libgl-switcheroo"
license=('custom:ISC')
depends=('bumblebee' 'primus' 'gtk2' 'fuse')
provides=('libgl-switcheroo')
conflicts=('libgl-switcheroo')
makedepends=('git')
source=(git://github.com/amonakov/libgl-switcheroo)
sha1sums=('SKIP')

_gitname="libgl-switcheroo"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/-/./g'
}

build() {
  cd "$_gitname"
  make LIB64PATH=\"lib\" LIB32PATH=\"lib32\" gtkglswitch
  make LIB64PATH=\"lib\" LIB32PATH=\"lib32\" libgl-switcheroo
}


package() {  
  cd "$_gitname"
  install -Dm755 gtkglswitch ${pkgdir}/usr/bin/libgl-switcheroo
  install -Dm755 gtkglswitch ${pkgdir}/usr/bin/gtkglswitch
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:

