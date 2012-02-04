# Maintainer: Marat Mukhametshin <mukhametshin at yandex dot ru>
pkgname=tomboy-latex
pkgver=0.7
pkgrel=2
pkgdesc="A tomboy plugin to convert LaTeX math code into inline images and back"
arch=(any)
url="http://www.reitwiessner.de/programs/tomboy-latex.html"
license=('LGPL')
depends=('tomboy' 'texlive-bin')
source=(http://www.reitwiessner.de/programs/$pkgname/v$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=(1c0ed73c488b8a4c0f5bf222cebdbe60)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  #install -d $pkgdir/usr/lib/tomboy/addins
  #install Latex.dll $pkgdir/usr/lib/tomboy/addins/
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
