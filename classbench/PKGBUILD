# Contributor: Rudy Matela <rudy.matela@gmail.com>
pkgname=classbench
pkgver=20040715
pkgrel=1
pkgdesc="A packet classification benchmark."
arch=('i686' 'x86_64')
url="http://www.arl.wustl.edu/classbench/"
license=('custom')
depends=('glibc')
makedepends=('gcc')
source=('http://www.arl.wustl.edu/classbench/db_generator.tar.gz'
        'http://www.arl.wustl.edu/classbench/parameter_files.tar.gz'
        'http://www.arl.wustl.edu/classbench/trace_generator.tar.gz')
md5sums=('ed11a1659a936a051d3b6c976b043b14'
         '01625a458d3364110e7413307e8c4087'
         '9a8cf10954c201be442689e612972404')

build() {
	for i in db_generator trace_generator; do
		cd $startdir/src/$i || return 1
		make all || return 1
	done
}

package() {
	mkdir -p $startdir/pkg/usr/bin/ || return 1
	mkdir -p $startdir/pkg/usr/share/classbench || return 1
	mkdir -p $startdir/pkg/usr/share/doc/classbench || return 1
	for i in db_generator trace_generator; do
		install -s -m755 $startdir/src/$i/$i $startdir/pkg/usr/bin/ || return 1
		install -m644 $startdir/src/$i/README $startdir/pkg/usr/share/doc/classbench/README.$i || return 1
	done
	install -m644 $startdir/src/parameter_files/* $startdir/pkg/usr/share/classbench/ || return 1
}
