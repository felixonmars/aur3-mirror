# Contributor: Premek Jordak <premysl.jordak@fsv.cvut.cz>
pkgname=linpopup
pkgver=2.1.0
pkgrel=2
pkgdesc="A Linux Enhanced port of Winpopup"
arch=(i686 x86_64)
url="http://linpopup2.sourceforge.net/"
license="GPL"
depends=('atk' 'gdk-pixbuf' 'pango')
source=("http://download.sourceforge.net/sourceforge/linpopup2/$pkgname-$pkgver.tar.bz2"
        "linpopup.desktop"
        "linpopup.png")
sha1sums=('8443a746a3770d54f36e0f802a5bb98d0e5bde94'
          'a6f31c84dab7f488cc63bf16764f0fc9e4f690c7'
          '31a7dacc1d4cac296a908f2e892c5010b56353b1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '/^linpopup_LDADD =/ {s/$/ -lX11/}' src/Makefile.*
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  cd "$srcdir"
  install -Dm0644 "linpopup.png" "$pkgdir/usr/share/pixmaps/linpopup.png"
  install -Dm0644 "linpopup.desktop" "$pkgdir/usr/share/applications/linpopup.desktop"
}

# vim: ts=2:sw=2:et
