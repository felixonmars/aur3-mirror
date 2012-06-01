pkgname=couchbase-memcached-engines
_pkgbase=couchbase-server
pkgver=1.8.0
pkgrel=1
pkgdesc="Memcached backends designed for use with couchbase"
url='http://www.couchbase.com/'
arch=('i686' 'x86_64')
license=('MIT' 'Apache')
depends=('couchbase-memcached' 'sqlite')
optdepends=('python2: For CLI tools')
source=("http://packages.couchbase.com/releases/1.8.0/${_pkgbase}_src-${pkgver}.tar.gz")
md5sums=('b0d7504fa4600d198f5c55b3944e244a')

build() {
	cd "${srcdir}/${_pkgbase}_src/bucket_engine"
	./configure --prefix=/usr --with-memcached="${srcdir}/${_pkgbase}_src/memcached"
	make

	cd "${srcdir}/${_pkgbase}_src/ep-engine"
	# Make sure we can call usleep()
	CXXFLAGS="$CXXFLAGS -D_BSD_SOURCE"
	sed -i -e '4i#include <unistd.h>' common.hh

	# Use default linker behavior
	#LDFLAGS="$LDFLAGS,--no-as-needed"
	CXXFLAGS="$CXXFLAGS -lsqlite3"

	# Build without -Werror
	sed -i -e 's/ac_cv_warnings_as_errors=yes/ac_cv_warnings_as_errors=no/' configure
	./configure --enable-system-libsqlite3 --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgbase}_src/bucket_engine"
	make DESTDIR="${pkgdir}" install

	cd "${srcdir}/${_pkgbase}_src/ep-engine"
	make DESTDIR="${pkgdir}" install

	# Convert to python2
	mv "${pkgdir}/usr/lib/python"  "${pkgdir}/usr/lib/python2.7"
	sed -i -e 's/python/python2.7/g' "${pkgdir}/usr/bin/"* "${pkgdir}/usr/lib/python2.7/"*

}
