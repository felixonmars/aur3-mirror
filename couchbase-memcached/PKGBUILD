pkgname=couchbase-memcached
_pkgbase=couchbase-server
pkgver=1.8.0
pkgrel=1
pkgdesc="A distributed memory object caching system patched for couchbase"
url='http://www.couchbase.com/'
arch=('i686' 'x86_64')
license=('BSD')
depends=('libevent')
optdepends=('perl: for memcached-tool usage')
conflicts=('memcached')
backup=('etc/conf.d/memcached')
provides=('memcached=1.4.5') # Don't know if this is the version, but is is higher if is not
source=("http://packages.couchbase.com/releases/1.8.0/${_pkgbase}_src-${pkgver}.tar.gz"
        "fix_warnings_in_default_engine.patch"
        "fix_warnings_in_daemon.patch"
        "memcached.conf"
        "memcached.sh")
md5sums=('b0d7504fa4600d198f5c55b3944e244a'
         '6ad288ace8c550e9ecec50e352328fad'
         '252bb98add048864cd836575751a04aa'
         'bf15619930dadf0c08669566e4aa809c'
         '65f88b69cf3112b178725af121327765')

build() {
	cd "${srcdir}/${_pkgbase}_src/memcached"

	patch -Np1 -i "${srcdir}/fix_warnings_in_default_engine.patch"
	patch -Np1 -i "${srcdir}/fix_warnings_in_daemon.patch"

	# _FORTIFY_SOURCE=2 throws a warning for `(void)fwrite(...)`
	CFLAGS="$CFLAGS -U_FORTIFY_SOURCE"
	# Using the system libsasl doesn't play nice with the other components
	./configure --enable-isasl --disable-bundled-libevent --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgbase}_src/memcached"
	make DESTDIR="${pkgdir}" install
	install scripts/memcached-tool "${pkgdir}/usr/bin/memcached-tool"

	install -Dm644 "${srcdir}/memcached.conf" "${pkgdir}/etc/conf.d/memcached"
	install -D "${srcdir}/memcached.sh" "${pkgdir}/etc/rc.d/memcached"
}
