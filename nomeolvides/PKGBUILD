#maintainer desarrolladores@softwareperonista.com.ar
pkgname=nomeolvides
pkgver=0.10
pkgrel=1
pkgdesc="A simple historical facts manager"
arch=('i686' 'x86_64')
url="http://github.com/softwareperonista/nomeolvides"
license=('GPL')
depends=('gtk3' 'xdg-utils')
makedepends=('git' 'vala' 'autogen' 'libltdl' 'intltool')
install='nomeolvides.install'
conflicts=('nomeolvides-classic')
source=("https://github.com/softwareperonista/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('22c6e0c0bf0d3b8308f9f7267a90d3b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./autogen.sh --prefix=/usr --bindir=/usr/bin 
  
   make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
