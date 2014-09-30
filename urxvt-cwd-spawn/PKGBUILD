# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=urxvt-cwd-spawn
pkgver=0.1
pkgrel=1
pkgdesc="Open a new urxvt within the current working directory"
arch=('any')
depends=('rxvt-unicode')
url="https://github.com/atweiden/urxvt-cwd-spawn"
license=('PerlArtistic')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/atweiden/$pkgname/tar.gz/$pkgver)
sha256sums=('ad141cda62adb95909e380b02a1c6684212c1c9d96629b18e8580f36271b5cfc')
install=urxvt-cwd-spawn.install

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg 'Installing docs...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  msg 'Installing...'
  install -Dm 644 cwd-spawn "$pkgdir/usr/lib/urxvt/perl/cwd-spawn"
}
