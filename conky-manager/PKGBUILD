# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=conky-manager
pkgver=2.2
_ubuntu=~118~ubuntu14.10.1
pkgrel=1
pkgdesc="Simple tool for managing conky scripts. (stable version)"
arch=('i686' 'x86_64')
url="http://teejeetech.blogspot.in/"
license=('GPL2')
depends=('cairo' 'conky' 'desktop-file-utils' 'gtk3' 'imagemagick'
	 'json-glib' 'libgee06' 'libsoup' 'p7zip' 'rsync')
makedepends=('vala')
conflicts=('conky-manager-bzr')
options=(!emptydirs)
install="$pkgname.install"
source=("http://ppa.launchpad.net/teejee2008/ppa/ubuntu/pool/main/c/${pkgname}/${pkgname}_${pkgver}${_ubuntu}.tar.xz")
sha256sums=('862eae880f5b1e277309ce9096bad5561811d25dfc9eb564390fc20877b9514d')

build() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir"/recipe*

  make
}

package() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir"/recipe*

  make DESTDIR="$pkgdir" install
}
