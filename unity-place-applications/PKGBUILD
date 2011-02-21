# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=unity-place-applications
pkgver=0.2.32
pkgrel=1
pkgdesc="A daemon that exposes you applications with their usage statistics and status to Unity"
arch=('i686' 'x86_64')
url="https://launchpad.net/unity-place-applications"
license=('GPL')
depends=('glib2>=2.27' 'libzeitgeist>=0.3.0' 'libunity>=3.2.8' 'gnome-menus' 'zeitgeist-extensions')
makedepends=('vala>=0.11.3' 'intltool>=0.40.0')
source=(http://launchpad.net/$pkgname/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('86aacc615dafe679a1f9912326220591')

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
