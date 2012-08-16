# 
# Maintainer: ArcherSeven <archermmb@aim.com>
pkgname=dws
pkgver=1.3.3
pkgrel=1
pkgdesc="script to get distrowatch standings"
arch=('any')
url="http://smxi.org"
license=('GPL')
source=(http://smxi.org/dws)

build(){
	sed s/DISTRO=\'debian\'/DISTRO=\'arch\'/ dws > dws.arch
}
package() {
  cd "$srcdir"
  install -D -m755 dws.arch $pkgdir/usr/bin/dws
}

# vim:set ts=2 sw=2 et:
md5sums=('4a553fd52942c2ba28467301ee36fcc0')
