# Maintainer: Malte Splietker <maltespl@mail.upb.de>
pkgname=eli
pkgver=4.8.1
pkgrel=1
epoch=
pkgdesc="Eli is a programming environment that supports all phases of translator construction with extensive libraries implementing common tasks, yet handling arbitrary special cases. Output is the C subset of C++."
arch=(i686 x86_64)
url="http://eli-project.sourceforge.net/"
license=('GPL', 'LGPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://sourceforge.net/projects/eli-project/files/Eli/Eli%20$pkgver/eli-$pkgver.tar.bz2/download)
noextract=()
md5sums=('baec5bb0f24a06fdf325b44031ea2520')

build() {
  cd $srcdir/$pkgname-$pkgver/
  ./configure --prefix=/usr
  make nobrowsers 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  cp $startdir/Makefile $srcdir/$pkgname-$pkgver/Makefile
  make DESTDIR="$pkgdir" install

  PKG=$(echo $pkgdir | sed -e 's/[\/&]/\\&/g')
  DEST=$(echo "/usr" | sed -e 's/[\/&]/\\&/g')
  find $pkgdir -type f -exec sed -i "s/${PKG}/${DEST}/g" {} \;
}
