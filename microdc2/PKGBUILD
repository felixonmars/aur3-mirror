# Maintainer: Zhukov Pavel <gelios@gmail.com>
# Contributor: Mark Tran <mark@nirv.net>

pkgname=microdc2
pkgver=0.15.6
pkgrel=3
pkgdesc="Command-line based Direct Connect client that uses the GNU Readline library for user interaction."
arch=('i686' 'x86_64')
url="http://corsair626.no-ip.org/microdc"
license=('GPL')
depends=('libxml2')
source=(http://corsair626.no-ip.org/microdc/$pkgname-$pkgver.tar.gz
	logfile_segfault.patch
	libxml2-configure.patch)

md5sums=('9175a7463936fe89e2e22c8ae2f5e020'
         'd069da3695d0a9bdbae94ba64b362395'
         '71414496300587fdfb7506109fb1d364')
                  
build() {
   cd $srcdir/$pkgname-$pkgver

   patch -p1 -i ../logfile_segfault.patch || return 1
   patch -p1 -i ../libxml2-configure.patch || return 1

   ./configure --prefix=/usr || return 1
   make || return 1
   make DESTDIR=$startdir/pkg install
}
