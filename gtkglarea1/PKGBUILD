# Submitter: dot
# Maintainer: Anntoin Wilkinson <anntoin gmail.com>

pkgname=gtkglarea1
_pkgname=gtkglarea
pkgver=1.2.3
pkgrel=2
pkgdesc="OpenGL context provider for GTK+"
arch=('i686' 'x86_64')
url="http://www.mono-project.com/GtkGLArea"
license=('GPL')
depends=('gtk' 'glu')
options=('!libtool')
source=("http://sourceforge.net/projects/openev/files/$_pkgname/$_pkgname-$pkgver/$_pkgname-$pkgver.tar.gz/download")
md5sums=('44f6804c1a9db61393e18680c81ae602')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
