# Maintainer: Yanchenko Igor (yanchenko.igor@gmail.com)

_pkgname=memcached
_patchname=repcached
pkgname=${_pkgname}-${_patchname}
_memcache_pkgver=1.2.8
_patchver=2.2
pkgver=${_patchver}_${_memcache_pkgver}
pkgrel=2
pkgdesc="A distributed memory object caching system with replication patch (repcached)"
arch=(i686 x86_64)
url="http://memcached.org/"
license=('GPL')
depends=('libevent')
optdepends=('perl: for memcached-tool usage')
backup=('etc/conf.d/memcached-repcached')
source=("http://downloads.sourceforge.net/project/repcached/repcached/${_patchver}-${_memcache_pkgver}/${_pkgname}-${_memcache_pkgver}-${_patchname}-${_patchver}.tar.gz"
        memcached-repcached.conf
	memcached-repcached.sh)

build() {
  cd $srcdir/memcached-${_memcache_pkgver}-repcached-${_patchver}
  ./configure --prefix=/usr --enable-replication
  make || return 1
}

package() {
  cd $srcdir/memcached-${_memcache_pkgver}-repcached-${_patchver}
  make DESTDIR=$pkgdir install || return 1
  mv $pkgdir/usr/bin/memcached $pkgdir/usr/bin/memcached-repcached
  mv $pkgdir/usr/bin/memcached-debug $pkgdir/usr/bin/memcached-repcached
  mv $pkgdir/usr/share/man/man1/memcached.1 $pkgdir/usr/share/man/man1/memcached-repcached.1 
  install -D -m 755 scripts/memcached-tool $pkgdir/usr/bin/memcached-repcached-tool
  install -D -m 644 $srcdir/$pkgname.conf $pkgdir/etc/conf.d/$pkgname
  install -D -m 755 $srcdir/$pkgname.sh $pkgdir/etc/rc.d/$pkgname
}

md5sums=('e2da22ab46c68f56d8ef4014de329347'
         'bf15619930dadf0c08669566e4aa809c'
         'ce275a17eea266ab7696fa4515b271fb')
