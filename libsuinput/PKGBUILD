# Maintainer: Florian Dejonckheere <florian@floriandejonckheere.be>
# Contributor: team_plz
# Contributor: Mark S. 

pkgname=libsuinput
pkgver=0.6.1
pkgrel=1
pkgdesc="Simple C-API to the Linux uinput-system"
arch=('i686' 'x86_64')
url="https://launchpad.net/libsuinput"
license=("GPL3")
depends=('libsystemd')
source=("http://launchpad.net/${pkgname}/trunk/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('9070cf1919a343c20bc486a73800418c')

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}
