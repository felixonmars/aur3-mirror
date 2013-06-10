# Maintainer: "Super" Nathan Weber <supernathansunshine@gmail.com>
_pkgname=deathgrip
pkgname=$_pkgname-git
pkgver=20130607.18
pkgrel=1
pkgdesc="Cryptography program for plain text, Deathgrip provides a simple and configurable way to encrypt and decrypt plain text with a custom configuration."
arch=('any')
url="http://github.com/super-nathan/deathgrip"
license=('GPL')
depends=('python')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/super-nathan/deathgrip.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd "$srcdir/$_pkgname"
  gzip deathgrip.1
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.1.gz" "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
  install -Dm644 "$_pkgname.conf" "$pkgdir/etc/$_pkgname.conf"

}

# vim:set ts=2 sw=2 et:
