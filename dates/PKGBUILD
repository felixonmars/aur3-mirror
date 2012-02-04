# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=dates
pkgver=0.4.11
pkgrel=3
pkgdesc="A small, lightweight calendar"
arch=(i686 x86_64)
url="http://pimlico-project.org/dates.html"
license=(GPL)
depends=(gtk2 'evolution-data-server>=3.2.0' xdg-utils)
makedepends=(intltool)
options=(!emptydirs)
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2
        0001-Replaced-the-calls-to-the-deprecated-functions-e_sou.patch)
sha256sums=('60b0cfe1fa6dee684e255c2a0cd02febafb9d16607ba4b05196e983cd8012c03'
            '88ab8de4861253be1a8db1be4432f71307fcffa376be95e9495cff021b7ead62')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/0001-Replaced-the-calls-to-the-deprecated-functions-e_sou.patch"
  sed -i 's/        $(MAKE)/	$(MAKE)/' Makefile.{am,in}

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --enable-owl
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
