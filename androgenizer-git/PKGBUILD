# Maintainer: Enlightenment Developers <enlightenment-devel@enlightenment.org>
pkgname=androgenizer-git
_pkgname=${pkgname%-*}
pkgver=0.1
pkgrel=1
pkgdesc="Tools to convert autotools build system to Android.mk - GIT development snapshot"
arch=('i686' 'x86_64' 'arm')
url="http://http://cgit.collabora.com/git/android/androgenizer.git"
license=('GPL')
options=('debug')
source=("git://git.collabora.co.uk/git/android/androgenizer.git")
sha256sums=('SKIP')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

build() {
  cd "$srcdir/$_pkgname"

  make
}

package() {
  cd "$srcdir/$_pkgname"

  install -Dm755 androgenizer "$pkgdir/usr/bin/androgenizer"
  install -Dm644 README.txt "$pkgdir/usr/share/$pkgname/README.txt"
  install -Dm644 TODO "$pkgdir/usr/share/$pkgname/TODO"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  ln -s ../licenses/$pkgname/COPYING "$pkgdir/usr/share/$pkgname/COPYING"
}
