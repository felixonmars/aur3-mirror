# Maintainer : Marco Rocco <mr85mr@gmail.com>

pkgname=alltray-compiz
pkgver=0.7.5.1dev
pkgrel=1.1
pkgdesc="Drop's any app in the tray, patched for compiz"
license=("GPL")
arch=('any')
url="http://alltray.sourceforge.net"
depends=('gconf')
conflicts=('alltray')
options=('!libtool')
source=('https://launchpad.net/alltray/trunk/0.7.5.1dev/+download/alltray-0.7.5.1dev.tar.gz' 
	'compiz.patch')
md5sums=('5842253b89a5943031b5a02bbd8fd4fb'
         'a978930e3e21801c595bbd3a6e203b63')

build()
{
  cp compiz.patch $startdir/src/${pkgname%%-*}-$pkgver
  cd $startdir/src/${pkgname%%-*}-$pkgver
  cat compiz.patch | patch -p1

  ./configure --prefix=/usr

  make || return 1
  make DESTDIR=$startdir/pkg install
}
