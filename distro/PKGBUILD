# Maintainer: Ali H. Caliskan <ahc (at) selflex.org>

pkgname=distro
pkgver=1.5.0
pkgrel=1
pkgdesc="A simple package manager."
arch=('i686' 'x86_64')
url='https://github.com/selflex/distro'
license=('GPL-3')
depends=('curl' 'bash' 'fakeroot')
source=("https://github.com/selflex/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
md5sums=('5c8e399724535aefe8315addcda4a881')

package() {
	cd ${srcdir}/${pkgname}-${pkgname}-${pkgver}

	sh ./install.sh root=$pkgdir
}