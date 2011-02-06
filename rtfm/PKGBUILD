# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=rtfm
pkgver=0.5
pkgrel=2
pkgdesc="Cherche de la documentation pour vous."
arch=('i686' 'x86_64')
url="http://calimeroteknik.free.fr/"
license=('GPL2')
depends=('python')
source=(rtfm)
md5sums=('4f23a50ae45f2cf5b94e141474790c20')

build() {
  cd "$srcdir"
  install -D -m755 rtfm "$pkgdir"/usr/bin/rtfm
}
