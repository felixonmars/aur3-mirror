# Maintainer: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=xmms-modplug
pkgver=2.05
pkgrel=2
pkgdesc="MOD plugin for XMMS"
arch=(i686 x86_64)
url="http://modplug-xmms.sourceforge.net/"
license="GPL"
depends=('libmodplug' 'xmms')

source=(xmmod.patch
	"http://kent.dl.sourceforge.net/sourceforge/modplug-xmms/modplugxmms-2.05.tar.gz")
md5sums=('a7fcd07407bf55bb7e8296dc3e92e7bd'
         '2dd9b88a02978d3001b48863b8cffc5b')

build() {
  cd $srcdir/modplugxmms-$pkgver
  patch -p1 < $srcdir/xmmod.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$pkgdir install
}

