# Author: Andreas Zwinkau <beza1e1@web.de>

pkgname=cparser
pkgver=0.9.14
pkgrel=1
pkgdesc="a library containing a parser, lexer and semantic analysis for the ISO C99 language"
url="http://sourceforge.net/projects/cparser/"
license=('GPL')
depends=('libfirm>=1.17.0')
source=("http://downloads.sourceforge.net/project/cparser/cparser/0.9.14/cparser-0.9.14.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fcparser%2F&ts=1362644444&use_mirror=switch")
md5sums=('0ff7cdb49e46253e167657dd9a8d0fe8')
arch=('i686')

build() {
	cd ${pkgname}-${pkgver}
	make || return 1
	mkdir -p ${startdir}/pkg/usr/bin
	cp build/cparser ${startdir}/pkg/usr/bin/
}
