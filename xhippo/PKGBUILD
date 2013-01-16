# Maintainer: TDY <tdy@archlinux.info>

pkgname=xhippo
pkgver=3.3
pkgrel=1
pkgdesc="A simple GTK+ playlist manager"
arch=('i686' 'x86_64')
url="http://offog.org/code/xhippo.html"
license=('GPL')
depends=('gtk2' 'libid3tag')
source=(http://offog.org/files/$pkgname-$pkgver.tar.gz
        $pkgname.desktop $pkgname.launcher $pkgname.xpm)
md5sums=('28ef26e3a0199daa9e5535a8b682bffe'
         '997ee3864016f269d44dc7eed6bde9a1'
         '2e0220f36730f1d215e177a62fa0ec54'
         'd8b3cdf714a302a66690d4ba4a904bd3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --bindir=/usr/lib/$pkgname \
    --mandir=/usr/share/man \
    --with-gtk2
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm755 ../$pkgname.launcher "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../$pkgname.xpm "$pkgdir/usr/share/pixmaps/$pkgname.xpm"
  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
