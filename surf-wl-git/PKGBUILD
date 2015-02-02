# Maintainer: Mael Kerbiriou <mael.kerbiriouATfreeDOTfr>

pkgname=surf-wl-git
pkgver=r347.2033f29
pkgrel=1
pkgdesc='Surf: a browser that sucks less, built for wayland'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/michaelforney/surf'
depends=('wld-git' 'webkitgtk')
makedepends=('git')
provides=('surf-wl')
conflicts=()
source=('git+https://github.com/michaelforney/surf.git')
md5sums=('SKIP')

_gitname="surf"

pkgver() { 
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_gitname"
  make
  
}

package() {
  cd "$_gitname"
  #install -Dm644 "velox.conf.sample" "${pkgdir}/etc/velox.conf"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
	mv "${pkgdir}/usr/bin/surf" "${pkgdir}/usr/bin/surf-wl"
	mv "${pkgdir}/usr/share/man/man1/surf.1" "${pkgdir}/usr/share/man/man1/surf-wl.1"
}

# vim: set noet ff=unix:
