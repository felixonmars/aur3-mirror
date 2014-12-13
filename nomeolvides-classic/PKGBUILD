#maintainer desarrolladores@softwareperonista.com.ar
pkgname=nomeolvides-classic
_pkgname=nomeolvides
pkgver=0.10
pkgrel=1
pkgdesc="A simple historical facts manager - Classic UI"
arch=('i686' 'x86_64')
url="http://github.com/softwareperonista/nomeolvides"
license=('GPL')
depends=('gtk3' 'xdg-utils')
makedepends=('git' 'vala' 'autogen' 'libltdl' 'intltool')
install='nomeolvides-classic.install'
conflicts=('nomveolvides')
source=("https://github.com/softwareperonista/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('22c6e0c0bf0d3b8308f9f7267a90d3b3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./autogen.sh --prefix=/usr --bindir=/usr/bin --disable-gnome3-support
  
   make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
