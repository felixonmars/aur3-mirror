# Contributor: Carlo Casta <carlo.casta at gmail dot com>

pkgname=qccpack
pkgver=0.58
pkgrel=1
pkgdesc="Quantization, Compression, and Coding Library"
arch=('i686' 'x86_64')
url="http://qccpack.sourceforge.net"
license=('GPL')
depends=('gsl')
makedepends=('imake')
source=(http://qccpack.sourceforge.net/Download/QccPack-$pkgver-1.tar.gz
        QccPack.config.arch)
md5sums=('3d919fc2bb9e4f2710e4a31b2ab1a1c4'
         'ba2cc8a08a73ff6a8aac2fb8356bab67')

build()
{
	cd "$srcdir/QccPack"
	cp ${srcdir}/QccPack.config.arch QccPack.config
	sed -i -e "s:_SRCDIR_:${srcdir}:" \
	       -e "s:_PKGDIR_:${pkgdir}/usr:" QccPack.config

	imake || return 1
	make Makefiles || return 1

	# sorry for your n-core processor, but compilation fails if
	# more than 1 make jobs are launched
	make -j1 || return 1

	make install || return 1
}
