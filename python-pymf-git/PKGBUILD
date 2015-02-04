# Maintainer: Robert Orzanna <orschiro@gmail.com>
pkgname=python-pymf-git
_pkgname=pymf
pkgver=r2.484e7fa
pkgrel=1
pkgdesc='A simple command-line uploading tool for pomf.se'
arch=(any)
license=(GPL)
url="https://github.com/savoca/pymf"
depends=('python3' 'python-requests')
makedepends=('git')
source=("$pkgname"::'git://github.com/savoca/pymf.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package ()
{
  cd "$srcdir/$pkgname"
  install -d -m755 "$pkgdir/usr/bin"
  install -m755 "$srcdir/$pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}


# vim: set ts=2 sw=2 et:
