# Maintainer: Mael Kerbiriou <mael.kerbiriouATfreeDOTfr>

pkgname=st-wl-git
pkgver=r746.a9ea9c6
pkgrel=1
pkgdesc='Simple Terminal built for wayland'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/michaelforney/st'
depends=('wld-git')
makedepends=('git')
provides=('st-wl')
conflicts=()
source=('git+https://github.com/michaelforney/st.git')
md5sums=('SKIP')

_gitname="st"

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
	mv "${pkgdir}/usr/bin/st" "${pkgdir}/usr/bin/st-wl"
	mv "${pkgdir}/usr/share/man/man1/st.1" "${pkgdir}/usr/share/man/man1/st-wl.1"
}

# vim: set noet ff=unix:
