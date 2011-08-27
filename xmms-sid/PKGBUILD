# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: damir <damir@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=xmms-sid
pkgver=0.8.0beta19
pkgrel=1
pkgdesc="An XMMS plugin for playing SID music files"
arch=('i686' 'x86_64')
url="http://www.tnsp.org/$pkgname.php"
license=('GPL')
depends=('sidplay2-libs>=2.1.1-4' 'xmms>=1.2')
groups=('xmms-plugins' 'xmms-io-plugins')
source=(http://www.tnsp.org/xs-files/$pkgname-$pkgver.tar.bz2)
md5sums=('1f580736787f9c4d7cbc8166d96363ba')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
