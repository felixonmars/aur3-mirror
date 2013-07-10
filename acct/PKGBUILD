# Maintainer: speps <speps at aur dot archlinux dot org>
# Contributor: damir <damir@archlinux.org>
# Contributor: phrakture

pkgname=acct
pkgver=6.6.1
pkgrel=1
pkgdesc="Login and process accounting utilities for GNU/Linux and other systems."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/acct/"
license=('GPL3')
depends=('glibc')
install="$pkgname.install"
source=("http://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('31a7a2ea81da1fddbc92b9c62cdea1c5')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # textinfo 5.1 fix
  sed -i 's/\(unnumbered\)sub\(subsec\)/\1\2/' accounting.texi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # rename last to prevent conflict with sysvinit-tools
  mv "$pkgdir/usr/bin/last" "$pkgdir/usr/bin/acct-last"
  mv "$pkgdir/usr/share/man/man1/last.1" "$pkgdir/usr/share/man/man1/acct-last.1"
}
