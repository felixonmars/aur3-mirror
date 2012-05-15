pkgname=ptrtd
pkgver=0.5.2
pkgrel=2
pkgdesc="Portable Transport Relay Translator Daemon for IPv6, RFC 3142"
arch=('i686' 'x86_64')
url="http://www.litech.org/ptrtd/"
license=('GPL')
groups=(network)
backup=(etc/conf.d/ptrtd)
source=(http://www.litech.org/$pkgname/dist/$pkgname-$pkgver.tar.gz ptrtd ptrtd.c.patch rc-ptrtd)
md5sums=('bfe026445fdc4fe509a9c70ec4551744'
         'a4d97eba83509e72157061759a8f1361'
         '7e54837c4a21e1c32a1313462c4fb40d'
         'b417f38efbb3f7c0c714814c5b84f750')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  patch -Np0 -i "$srcdir/ptrtd.c.patch"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

# default argument file
  install -D -m644 "$srcdir/ptrtd" "$pkgdir/etc/conf.d/ptrtd"

# rc script
  install -D -m755 "$srcdir/rc-ptrtd" "$pkgdir/etc/rc.d/ptrtd"

# license
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYPING"
}

# vim:set ts=2 sw=2 et:
