# Contributor: Krzysiek Wojszko <w.krzysiek@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libtranslate 
pkgver=0.99
pkgrel=7
arch=('i686' 'x86_64')
pkgdesc="library for translating text and web pages between natural languages"
source=(http://savannah.nongnu.org/download/libtranslate/$pkgname-$pkgver.tar.gz
http://download-mirror.savannah.gnu.org/releases/libtranslate/libtranslate-0.99-condfix.diff
http://download-mirror.savannah.gnu.org/releases/libtranslate/libtranslate-0.99-charsetparse.diff
http://download-mirror.savannah.gnu.org/releases/libtranslate/libtranslate-0.99-int64.diff 
http://download-mirror.savannah.gnu.org/releases/libtranslate/libtranslate-0.99-postmarker.diff
http://download-mirror.savannah.gnu.org/releases/libtranslate/libtranslate-0.99-services.diff)
md5sums=('1fe75a6a6e8a0c6518890b5fa6984d42'
         'b6da2048edec744ba65a47c5b45baca8'
         '7d4d85c2c0881034d4113a65c2307da9'
         'e7ed043a9ea981b3330191375bec85f7'
         '5c53d3b56c6e3e3ec4032bbfd0bc2acb'
         'b6e8208879dbf91192fa5c34c8210363')
depends=('glib2')
makedepends=('perl-xmlrpc-lite')
url="http://www.nongnu.org/libtranslate/" 
license=('custom') 
options=('!libtool')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  find . -name Makefile.in -exec sed -i -e 's/-scrollkeeper-update.*//' {} \;
  if [ -f omf.make ]; then
	  sed -i -e 's/-scrollkeeper-update.*//' omf.make
  fi
  patch -p0 -i $srcdir/libtranslate-0.99-charsetparse.diff
  patch -p0 -i $srcdir/libtranslate-0.99-condfix.diff
  [ $CARCH = "x86_64" ] && patch -p0 -i $srcdir/libtranslate-0.99-int64.diff
  patch -p1 -i $srcdir/libtranslate-0.99-postmarker.diff
  patch -p1 -i $srcdir/libtranslate-0.99-services.diff
}

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure  --prefix=/usr --mandir=/usr/share/man \
    --disable-talkfilters
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$pkgdir install
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
