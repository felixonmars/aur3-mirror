# Contributor: Juergen Graefe <jg72@gmx.de>
pkgname=taxbird
pkgver=0.18
pkgrel=2
pkgdesc="A tax client with German ELSTER compliance"
arch=('i686' 'x86_64')
url="http://www.taxbird.de/"
license=('GPL3')
depends=('guile' 'libgeier>=0.13' 'libgnomeui' 'libgtkhtml' 'gtkhtml')
makedepends=('pkgconfig')
optdepends=('cups: for printing transmission protocols'
            'html2ps: for optimal formatting of transmission protocols')
source=(http://www.$pkgname.de/download/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr || return 1
  sed -i 's/string char/string const char/' pixmaps/$pkgname.xpm
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
  ln -sf /usr/share/pixmaps/$pkgname.xpm "$pkgdir/usr/share/$pkgname/$pkgname.xpm"
}
md5sums=('213e63cb9283fbcc539259742271445f')
