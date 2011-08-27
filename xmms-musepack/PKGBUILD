# Contributor: Tomasz Gorol <gavian@o2.pl>
pkgname=xmms-musepack
pkgver=1.2.1
pkgrel=1
pkgdesc="xmms mpc plugin "
arch=('i686' 'x86_64')
url="http://www.musepack.net"
license=('GPL')
groups=('multimedia')
makedepends=('pkgconfig' 'make' 'gcc')
depends=('libmpcdec' 'taglib' 'xmms')
source=(http://files.musepack.net/linux/plugins/$pkgname-$pkgver.tar.bz2)
md5sums=('d9d5ee7720d39f466ea71f4a7a285e83')

build() {
	  cd $startdir/src/$pkgname-$pkgver
	  chmod u+x ./configure
	  ./configure  prefix=`xmms-config --input-plugin-dir`
	  make || return 1
	  make DESTDIR=$startdir/pkg install || return 1
	}

