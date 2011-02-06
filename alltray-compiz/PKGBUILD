# Maintainer : Marco Rocco <mr85mr@gmail.com>

pkgname=alltray-compiz
pkgver=0.69
pkgrel=1.1
pkgdesc="Drop's any app in the tray, patched for compiz"
license=("GPL")
arch=(i686 x86_64)
url="http://alltray.sourceforge.net"
depends=('gconf')
conflicts=('alltray')
options=('!libtool')
source=(http://launchpad.net/alltray/historic-releases/0.69/+download/${pkgname%%-*}-$pkgver.tar.gz compiz.patch)
md5sums=('ebc1c8eea945aff703d758e296b76cc9' '574c32c6d1711d72dedccb3e59a497d1')

build()
{
  cp compiz.patch $startdir/src/${pkgname%%-*}-$pkgver
  cd $startdir/src/${pkgname%%-*}-$pkgver
  cat compiz.patch | patch -p1

  ./configure --prefix=/usr

  make || return 1
  make DESTDIR=$startdir/pkg install
}
