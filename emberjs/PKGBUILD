# Maintainer: Simon Hafner <hafnersimon@gmail.com>
pkgname=emberjs
pkgver=1.4.0
pkgrel=1
epoch=
pkgdesc="Ember is a JavaScript framework for creating ambitious web applications that eliminates boilerplate and provides a standard application architecture."
arch=(any)
url="http://emberjs.com"
license=('MIT')
groups=()
depends=('jquery')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://builds.emberjs.com/tags/v1.4.0/ember.prod.js http://builds.emberjs.com/tags/v1.4.0/ember.min.js)
md5sums=('eb929c7ccffa9256f23145941696c298'
       '861112f5f69ace5d76d7a6d7db9b9724')
noextract=()

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/share/emberjs
  install -m644 ember.min.js $pkgdir/usr/share/emberjs
  install -m644 ember.prod.js $pkgdir/usr/share/emberjs
}

# vim:set ts=2 sw=2 et:
