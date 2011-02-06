# Maintainer: Peter Lewis <pete@muddygoat.org>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=geg
pkgver=1.0.2
pkgrel=4
pkgdesc="A GTK+ Equation Grapher, with ease of use and simplicity in mind"
arch=('i686' 'x86_64')
license=('GPL')
url="http://metalab.unc.edu/pub/Linux/science/visualization/plotting/"
depends=('gtk')
source=("http://www.ibiblio.org/pub/Linux/science/visualization/plotting/$pkgname-$pkgver.tar.gz" "$pkgname.desktop")
md5sums=('0c3c15874eb10a0463dc12e680b38081'
         '27c4450a2da9dc17237250f4a15d63e9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 "$srcdir/$pkgname.desktop" \
      "$pkgdir/usr/share/applications/$pkgname.desktop"
}
