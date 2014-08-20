# Maintainer: Mael Kerbiriou <mael.kerbiriouATfreeDOTfr>

pkgname=dmenu-wl-git
pkgver=r499.96b567d
pkgrel=1
pkgdesc='Dmenu built for swc(wayland)'
arch=('i686' 'x86_64')
license=('MIT')
url='https://github.com/michaelforney/dmenu'
depends=('wld-git' 'swc-git')
makedepends=('git')
provides=('dmenu-wl' 'dmenu_run-wl' 'dmenu_path')
conflicts=()
source=('git+https://github.com/michaelforney/dmenu.git')
md5sums=('SKIP')

_gitname="dmenu"

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
	mv "${pkgdir}/usr/bin/dmenu" "${pkgdir}/usr/bin/dmenu-wl"
	mv "${pkgdir}/usr/bin/dmenu_path" "${pkgdir}/usr/bin/dmenu-wl_path"
	mv "${pkgdir}/usr/bin/stest" "${pkgdir}/usr/bin/stest-wl"
	mv "${pkgdir}/usr/bin/dmenu_run" "${pkgdir}/usr/bin/dmenu_run-wl"
	mv "${pkgdir}/usr/share/man/man1/dmenu.1" "${pkgdir}/usr/share/man/man1/dmenu-wl.1"
	mv "${pkgdir}/usr/share/man/man1/stest.1" "${pkgdir}/usr/share/man/man1/stest-wl.1"
 
	sed -i 's/dmenu/dmenu-wl/g' "${pkgdir}/usr/bin/dmenu_run-wl"
}

# vim: set noet ff=unix:
