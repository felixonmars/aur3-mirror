# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=gmtkbabel
pkgver=0.1
pkgrel=1
pkgdesc="A graphical interface to mtkbabel using zenity"
arch=(any)
url="http://dpaleino.github.com/gmtkbabel/"
license=('BSD')
depends=('zenity' 'mtkbabel' 'gettext')
backup=('etc/gmtkbabel.conf')
install=
changelog=
source=(http://github.com/downloads/dpaleino/gmtkbabel/gmtkbabel-0.1.tar.gz)
noextract=()
md5sums=('c2951a9ee2ef76790ec1762137360e99') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -D -m644 AUTHORS ${pkgdir}/usr/share/licenses/$pkgname/AUTHORS
  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/$pkgname/COPYING

}

# vim:set ts=2 sw=2 et:
