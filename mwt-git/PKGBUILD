# Maintainer: "Super" Nathan Weber <supernathansunshine@gmail.com>
_pkgname=mwt
pkgname=$_pkgname-git
pkgver=20130607.18
pkgrel=1
pkgdesc="MWT is a stress testing tool that tries to re-create a monkeys-on-a-typewriter expiriment using a string of random intergers to try and re-create Shakespeare Sonnet 116"
arch=('any')
url="http://github.com/super-nathan/monkeys-w-typewriters"
license=('MIT')
depends=('python')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/super-nathan/monkeys-w-typewriters.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
}

build() {
  cd "$srcdir/$_pkgname"
  gzip mwt.1
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$_pkgname.1.gz" "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
}

# vim:set ts=2 sw=2 et:
