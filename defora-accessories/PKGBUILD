# Contributor: Calimero <calimeroteknik@free.fr>
pkgname=defora-accessories
pkgver=0.0.3
pkgrel=1
pkgdesc='The Defora lightweight accessories'
arch=('i686' 'x86_64')
url='http://defora.org/os'
license=('GPL3')
depends=('gtk2')
source=("http://www.defora.org/os/download/download/3700/Accessories-${pkgver}.tar.gz")
md5sums=('60261c81e7d19386e6f62793cb3faf79')

build() {
  cd "$srcdir/Accessories-$pkgver"
  make
}

package() {
  cd "$srcdir/Accessories-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install

  #Pierre, you should change the name of this strange app!
  #Not only is it unexplicit; but it also conflicts with imagemagick!
  mv "$pkgdir"/usr/bin/{,str}compare
}
