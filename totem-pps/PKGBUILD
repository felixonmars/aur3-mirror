# Maintainer: kevku <kevku@msn.com>
# Contributor:Xiang Yixiang <lovelinux229-at-gmail-dot-com>
pkgname=totem-pps
pkgver=0.0.19.6
pkgrel=1
pkgdesc="PPStream browser for totem"
arch=("i686" "x86_64")
url="http://code.google.com/p/totem-pps/"
license=('GPL')
depends=('totem' 'gst-plugins-pps' 'gnome-python' 'python-beautifulsoup')
makedepends=('pkgconfig' 'intltool')
source=("http://totem-pps.googlecode.com/files/$pkgname-$pkgver.tar.gz"
	"python2.patch")
conflicts=('totem-pps-git')
md5sums=('899700529824d56cbd1fbaa31fcd052a'
         'f78777a2a7583f1da6061a985e9fa124')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i ../python2.patch
  PYTHON=python2 ./configure --prefix=/usr
  make
}
package(){
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

