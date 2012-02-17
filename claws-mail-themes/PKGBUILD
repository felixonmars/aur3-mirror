# Maintainer: S.Leduc <sebastien@sleduc.fr>
# Contributor: SiD/sidious <miste78@web.de>

pkgname=claws-mail-themes
pkgver=20120129
pkgrel=1
pkgdesc="Icon themes for claws-mail"
url="http://www.claws-mail.org/themes.php"
license=('GPL')
depends=('claws-mail')
arch=('any')
source=("http://www.claws-mail.org/themes/$pkgname-$pkgver.tar.gz")
md5sums=('930fdb9ee031275c762781e1e7bc7166')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d -m 0755 "$pkgdir/usr/share/claws-mail/themes"
  cp -r * "$pkgdir/usr/share/claws-mail/themes/"
  cd "$pkgdir/usr/share/claws-mail/themes"
  rm Makefile.am autogen.sh claws-mail-themes configure.ac
}

# vim:set ts=2 sw=2 et:
