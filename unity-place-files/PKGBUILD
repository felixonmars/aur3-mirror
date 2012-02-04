# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=unity-place-files
pkgver=0.5.36
pkgrel=2
pkgdesc="A daemon exposing your files and file history to Unity"
arch=('i686' 'x86_64')
url="https://launchpad.net/unity-place-files"
license=('GPL')
depends=('glib2>=2.27' 'libzeitgeist>=0.3.0' 'libunity>=3.2.8' 'zeitgeist-extensions')
makedepends=('vala>=0.11.3' 'intltool>=0.40.0')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('25301e0c4e079e6b1cf30596cea31a3e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '/--pkg unity \\/ a --pkg Dbusmenu-0.4 \\' src/Makefile.{in,am}

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
