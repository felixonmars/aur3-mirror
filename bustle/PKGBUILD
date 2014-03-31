# Maintainer: Alex Merry <dev@randomguy3.me.uk>
pkgname=bustle
pkgver=0.4.5
pkgrel=1
pkgdesc="A D-Bus profiler"
arch=(i686 x86_64)
url="http://willthompson.co.uk/bustle/"
license=('GPL')
depends=('dbus' 'gtk2' 'libpcap')
# NB: you can remove the help2man makedepend if you do not
#     want the bustle-pcap man page
makedepends=('ghc'
             'haskell-cairo'
             'haskell-dbus>=0.10'
             'haskell-gtk>=0.12.3'
             'haskell-mtl'
             'haskell-pango'
             'haskell-parsec'
             'haskell-pcap'
             'haskell-text'
             'help2man')
source=(http://willthompson.co.uk/$pkgname/releases/$pkgver/$pkgname-$pkgver.tar.gz
        bustle.1 bustle-48x48.png)
install=bustle.install
md5sums=('0e390e1ea7cf5069e019d31c0c74b93e'
         '1ad8189edaa42c01e6f618705e9e9692'
         '3b793fdb11078e5e60bb0e673e6ae1de')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # build the monitor
  make PREFIX=/usr

  # build the graphing tool
  ghc -package Cabal Setup.hs -o setup
  ./setup configure --prefix /usr
  ./setup build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # install the monitor
  make PREFIX=/usr DESTDIR="$pkgdir" install

  # install the graphing tool
  ./setup copy --destdir "$pkgdir"

  cd "$srcdir"
  install -d -m755 "$pkgdir/usr/share/man/man1"
  install -m644 bustle.1 "$pkgdir/usr/share/man/man1/"

  # https://bugs.freedesktop.org/show_bug.cgi?id=76796
  install -d -m755 "$pkgdir/usr/share/icons/hicolor/48x48/apps"
  install -m644 "bustle-48x48.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/bustle.png"

  install -d -m755 "$pkgdir/usr/share/licenses/bustle"
  mv "$pkgdir/usr/share/doc/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/bustle/LICENSE"
  rmdir "$pkgdir/usr/share/doc/$pkgname-$pkgver"
  rmdir "$pkgdir/usr/share/doc"
}

# vim:set ts=2 sw=2 et:
