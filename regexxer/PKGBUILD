# Maintainer:  TDY <tdy@gmx.com>
# Contributor: AqD <aquila.deus@gmail.com>

pkgname=regexxer
pkgver=0.9
pkgrel=3
pkgdesc="A graphical search/replace tool featuring Perl-style regular expressions"
arch=('i686' 'x86_64')
url="http://regexxer.sourceforge.net/"
license=('GPL')
depends=('gconfmm' 'hicolor-icon-theme' 'libglademm')
makedepends=('intltool>=0.35.0' 'pkgconfig>=0.9.0')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3c45ed51f28c3d1c7228dff7fb904459')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/ install-schemasDATA$//' Makefile.in
  ./configure --prefix=/usr --disable-schemas-install
  make || return 1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/$pkgname.schemas" \
    ui/$pkgname.schemas || return 1
}
