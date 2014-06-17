# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=conky-manager-bzr
pkgver=r98
pkgrel=1
pkgdesc="Simple tool for managing conky scripts."
arch=('i686' 'x86_64')
url="http://teejeetech.blogspot.in/"
license=('GPL2')
depends=('cairo' 'conky' 'desktop-file-utils' 'gtk3' 'imagemagick'
	 'json-glib' 'libgee06' 'libsoup' 'p7zip' 'rsync')
makedepends=('bzr' 'vala')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}")
options=(!emptydirs)
install="$pkgname.install"
source=('conky-manager::bzr+lp:~teejee2008/conky-manager/trunk')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-*}"
  
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "$srcdir/${pkgname%-*}"

  make
}

package() {
  cd "$srcdir/${pkgname%-*}"

  make DESTDIR="$pkgdir" install
}
