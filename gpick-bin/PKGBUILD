# Maintainer: Tevin Zhang <mail2tevin{at}gmail{dot}com>

pkgname=gpick-bin
pkgver=0.2.4
_debname=gpick_${pkgver}-2_amd64.deb
pkgrel=1
pkgdesc="Advanced color picker written in C++ using GTK+ toolkit, binary version"
arch=('x86_64')
url="http://gpick.googlecode.com/"
license=('BSD')
depends=('dbus-glib>=0.76' 'gtk2>=2.12.0' 'hicolor-icon-theme' 'lua>=5.1')
source=(https://gpick.googlecode.com/files/${_debname})

md5sums=('1a825e467c17e860a0343793e50f279d')

build() {
  cd "$srcdir/"
  ar xvf ${_debname}
}

package() {
  cd "$srcdir/"
  tar xvf data.tar.gz -C "$pkgdir"
}
