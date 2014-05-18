# Maintainer: Alois Nespor <info@aloisnespor.info>
pkgname=glyr
pkgver=1.0.6
pkgrel=1
pkgdesc="A metadata searchengine utility and library written in C"
arch=('i686' 'x86_64')
depends=('glib2' 'curl' 'sqlite')
url="https://github.com/sahib/glyr"
conflicts=('glyr-git')
makedepends=( 'cmake')
license=('GPL3')
source=("https://github.com/sahib/glyr/archive/$pkgver.tar.gz")


build() 
{
    cd "${srcdir}/$pkgname-$pkgver"

    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install || return 1
}
sha256sums=('8ed5839dbe0645315a4674036416747f713106ceaee6d43fecbbf91fb57f8feb')
