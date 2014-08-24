# Maintainer: Rogof <rogof /at/ gmx /dot/ com>

pkgname=fizsh
pkgver=1.0.8
pkgrel=1
pkgdesc="The Friendly Interactive ZSHell"
arch=('any')
url="http://sourceforge.net/projects/fizsh/"
license=('CUSTOM')
depends=('zsh>=4.3.4')
install=fizsh.install
source=("http://downloads.sourceforge.net/project/fizsh/$pkgname-$pkgver.tar.gz")
sha1sums=('515f8828c8bd9f2da1e2716bb3d60727e2f26e90')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # move copyright file
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  mv "$pkgdir/usr/share/doc/fizsh/copyright" "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim:set ts=2 sw=2 et:
