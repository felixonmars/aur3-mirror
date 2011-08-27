# Maintainer: Jussi Timperi <jussi.timperi at gmail dot com>
# Contributor: Guillermo Vaya Perez <driadan@willinux.net>

_pkgsourcename=mesa
pkgname=bin32-$_pkgsourcename
pkgver=7.7.1
pkgrel=1
pkgdesc="Mesa OpenGL binaries"
url="http://mesa3d.sourceforge.net"
license=('custom')
arch=('x86_64')
groups=('lib32')
depends=('lib32-mesa')
source=(http://mir.archlinux.fr/extra/os/i686/$_pkgsourcename-$pkgver-$pkgrel-i686.pkg.tar.xz)
md5sums=('2f067f1e21ac364f84d82c798e5495ae')

build() {
	cd "$srcdir"
	mkdir -p "$pkgdir/opt/bin32/usr/bin"
	cp -dp usr/bin/glx* "$pkgdir/opt/bin32/usr/bin"
}

# vim:set ts=2 sw=2 et:
