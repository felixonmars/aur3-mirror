# Maintainer: Marius Knaust <marius.knaust@gmail.com>

pkgname=intel-tbb-pc
pkgver=1.0
pkgrel=1
pkgdesc="Pkg-config support for Intel TBB."
arch=('any')
license=('GPL')
url="https://packages.debian.org/sid/amd64/libtbb-dev"
depends=('intel-tbb' 'pkg-config')
makedepends=('sed')
source=('tbb.pc')
md5sums=('51ce86889245fa5d214063891331fc4a')

prepare()
{
	version=$(pacman -Q intel-tbb | sed 's/.* \(.*\)\-.*/\1/;s/_/~/g')
	sed -i 's/$version/'$version'/g' ${srcdir}/tbb.pc
}

package()
{
	install -D -m655 tbb.pc ${pkgdir}/usr/lib/pkgconfig/tbb.pc
}
