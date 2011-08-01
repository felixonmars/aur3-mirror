pkgname=eaccelerator
pkgver=0.9.6.1
pkgrel=1
pkgdesc="eAccelerator is a free open-source PHP accelerator, optimizer, and dynamic content cache."
arch=('i686' 'x86_64')
url="http://eaccelerator.net/"
license=('GNU General Public License')
depends=('php')
makedepends=('autoconf' 'automake' 'libtool' 'm4')
conflicts=('xcache' 'turck-mmcache' 'phpexpress' 'eaccelerator-svn')
source=(http://downloads.sourceforge.net/project/eaccelerator/eaccelerator/eAccelerator%20$pkgver/eaccelerator-$pkgver.tar.bz2)
md5sums=('32ccd838e06ef5613c2610c1c65ed228')

build() {
  cd $srcdir/$pkgname-$pkgver
  phpize
  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT=$pkgdir install || return 1
  mkdir -p $pkgdir/etc/php/conf.d/ || return 1
  mkdir -p $pkgdir/var/cache/eaccelerator || return 1
  chmod 777 $pkgdir/var/cache/eaccelerator || return 1
  cat $srcdir/$pkgname-$pkgver/eaccelerator.ini | gawk 'gsub("eaccelerator.cache_dir = \"/tmp/eaccelerator\"","eaccelerator.cache_dir = \"/var/cache/eaccelerator\"")1' > $pkgdir/etc/php/conf.d/eaccelerator.ini || return 1
}
