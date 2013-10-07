# $Id: PKGBUILD 186515 2013-05-28 09:58:49Z ioni $
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Bjorn Lindeijer <bjorn lindeijer nl>
# Contributor: Samuel Mendes <heka.lok@gmail.com>

pkgname=telepathy-eri
pkgdesc="An VK connection manager for Telepathy"
pkgrel=1
pkgver=77.b45cd0e
arch=('any')
url="https://github.com/alex-eri/telepathy-eri/"
groups=('telepathy')
license=('GPLv3')
depends=('python2' 'python2-mechanize')
makedepends=('libxslt' 'python2' 'make' 'git')
install=telepathy-eri.install
source=("$pkgname"::'git+https://github.com/alex-eri/telepathy-eri/')
md5sums=('SKIP')

_gitroot="https://github.com/alex-eri/telepathy-eri.git"
_gitname=$pkgname

pkgver() {
	cd $pkgname
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $pkgname
    make LIBEXECDIR="/usr/lib/telepathy"
}

package() {
    cd $pkgname
    make DESTDIR="$pkgdir" LIBEXECDIR="/usr/lib/telepathy" install
}
