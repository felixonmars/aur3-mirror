# Maintainer: Wojciech Siewierski <darkvifon at gmail dot com>
# Contributor: Wojciech Siewierski <darkvifon at gmail dot com>
pkgname=vfnmake
pkgver=2.1.1
pkgrel=1
pkgdesc="User friendly Makefile generator for C/C++"
url="https://github.com/Vifon/vfnmake"
arch=('any')
license=('GPL')
optdepends=('nasm: Assembly support'
  'qt: Qt4 support'
  'zsh: argument completion')
source=("https://github.com/downloads/Vifon/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('e056fb5b9a236662ebc9df8233867725')
install='vfnmake.install'

build() {
  cd "$pkgname-$pkgver"

  make AUR_prepare
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 vfnmake_with_pod "$pkgdir/usr/bin/vfnmake"
  install -D -m 644 vfnmake.1.gz     "$pkgdir/usr/share/man/man1/vfnmake.1.gz"
  install -D -m 644 _vfnmake         "$pkgdir/usr/share/zsh/site-functions/_vfnmake"
  install -D -m 644 vfnmake.conf     "$pkgdir/etc/vfnmake.conf"
}
