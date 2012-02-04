# Contributor: Andrea Zucchelli <zukka77@gmail.com>
# Contributor: Jonathan Liu <net147@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

pkgname=lxc
pkgver=0.7.5
pkgrel=1
pkgdesc="Linux Containers"
arch=('i686' 'x86_64')
url="http://lxc.sourceforge.net/"
depends=('bash' 'perl')
license=('LGPL')
source=("http://lxc.sourceforge.net/download/lxc/$pkgname-$pkgver.tar.gz")
md5sums=('04949900ff56898f4353b130929c09d1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --localstatedir=/var --prefix=/usr --libexecdir=/usr/bin --sysconfdir=/etc --disable-doc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -d -m755 "$pkgdir/var/lib/lxc"
  cd doc
  find . -type f -name '*.1' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man1/{}" \;
  find . -type f -name '*.5' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man5/{}" \;
  find . -type f -name '*.7' -exec install -D -m644 "{}" "$pkgdir/usr/share/man/man7/{}" \;
}
# vim:set ts=2 sw=2 et:
