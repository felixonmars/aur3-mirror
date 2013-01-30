# Contributor: Sean Bartell <wingedtachikoma@gmail.com>
pkgname=opencxx
pkgver=2.8
pkgrel=1
pkgdesc="OpenC++ is C++ frontend library (lexer+parser+DOM/MOP) and source-to-source translator. OpenC++ enables development of C++ language tools, extensions, domain specific compiler optimizations and runtime metaobject protocols."
url="http://opencxx.sourceforge.net"
license=('GPL')
source=("http://nchc.dl.sourceforge.net/project/opencxx/opencxx/$pkgver/$pkgname-$pkgver.tar.gz"
"opencxx.patch")
arch=('i686' 'x86_64')
depends=('gcc')
md5sums=("0f71df82751fe8aba5122d6e0541c98a"
"814cf3c83527b5d4168c19e8f58a884a")

build() {
  cd "$srcdir"
	patch -p0 < $srcdir/../opencxx.patch
  cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
  make -j4
  make DESTDIR=${pkgdir} install 
}

