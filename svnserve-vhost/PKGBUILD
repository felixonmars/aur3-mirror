# Contributor: Denis Martinez <deuns.martinez@gmail.com>

pkgname=svnserve-vhost
_pkgname=subversion
pkgver=1.6.6
pkgrel=1
pkgdesc="Replacement for svnserve, patched for vhost support."
arch=(i686 x86_64)
license=('apache' 'bsd')
depends=("subversion=${pkgver}")
makedepends=('heimdal>=1.2' 'db>=4.7' 'autoconf' 'sqlite3')
source=(http://subversion.tigris.org/downloads/${_pkgname}-$pkgver.tar.bz2
        svnserve-vhost{.patch,,.conf})

backup=('etc/conf.d/svnserve-vhost')
url="http://subversion.tigris.org/"
provides=()
options=('!makeflags' '!libtool')
md5sums=('e5109da756d74c7d98f683f004a539af'
         'cefdb7a98f0aa9957b150fed135cd194'
         'f4df07a14c19a1676f74462397bcd31c'
         'c459e299192552f61578f3438abf0664')

build() {
   cd $startdir/src/${_pkgname}-${pkgver}

   patch -Np0 -i $srcdir/svnserve-vhost.patch || return 1

   autoreconf
   ./configure --prefix=/usr --with-apr=/usr --with-apr-util=/usr \
               --with-zlib=/usr --with-neon=/usr \
               --with-sqlite=/usr

   make subversion/svnserve/svnserve || return 1
   install -D -m 755 subversion/svnserve/.libs/svnserve $pkgdir/usr/bin/svnserve-vhost

   install -D -m 755 $srcdir/svnserve-vhost $pkgdir/etc/rc.d/svnserve-vhost
   install -D -m 644 $srcdir/svnserve-vhost.conf $pkgdir/etc/conf.d/svnserve-vhost
}
