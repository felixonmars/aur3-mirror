# Maintainer: Ali H. Caliskan <ali.h.caliskan (at) gmail dot com>

pkgname=pkgmgr
pkgver=0.9.8
pkgrel=1
pkgdesc="Pan - a simple package manager."
arch=('i686' 'x86_64')
url='https://github.com/selflex/pan'
license=('GPL-3')
depends=('curl' 'bash' 'fakeroot')
source=("https://github.com/selflex/pan/archive/pan-${pkgver}.tar.gz")
md5sums=('c7325e8e168144a9ddf7a028b63c7705')

package() {
	cd ${srcdir}/pan-pan-${pkgver}

	sh ./install.sh root=$pkgdir
}