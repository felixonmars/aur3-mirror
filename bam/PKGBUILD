#Contributors: Bmauet <careil.baptiste@gmail.com>
pkgname=bam
pkgver=0.4.0
pkgrel=3
pkgdesc="A fast and flexible build system using Lua"
arch=('i686' 'x86_64')
url=http://github.com/matricks/bam
license=('ZLIB')
#depends=()
#makedepends=()
#optdepends=()
source=("https://github.com/downloads/matricks/bam/${pkgname}-${pkgver}.tar.gz")
md5sums=('2f8e8336b8884110e8a355b12c9fa58a')

build()
{
	cd ${srcdir}/${pkgname}-${pkgver} || return 1
	sh make_unix.sh || return 1
	install -D -m755 bam ${pkgdir}/usr/bin/bam || return 1
}
