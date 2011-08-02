# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=horgand
pkgver=1.14
pkgrel=2
pkgdesc="JACK capable organ softsynth"
arch=(i686 x86_64)
url="http://horgand.berlios.de/"
license=('GPL')
depends=('libxpm' 'fltk' 'jack')
install="$pkgname.install"
source=("http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('e2bd4720a262cb739a2132904c241828'
         'd1ffcaa03c69be2f173d998bff2ddacb')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # build with fltk >= 1.3
  sed -i "s|Fl/|FL/|" src/organ.C

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  # desktop file and icon
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 src/${pkgname}128.xpm \
    "$pkgdir/usr/share/pixmaps/$pkgname.xpm"

  # banks
  install -d "$pkgdir/usr/share/$pkgname/banks"
  for ((_i=2; _i <= 22; _i++)); do
    msg "Downloading bank $_i ..."
    wget -q ${url}Bank$_i.horeb -P "$pkgdir/usr/share/$pkgname/banks"
  done
}

# vim:set ts=2 sw=2 et:
