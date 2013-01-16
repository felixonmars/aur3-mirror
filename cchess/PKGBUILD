# Maintainer: TDY <tdy@archlinux.info>

pkgname=cchess
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple network client for chinese chess"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/cchess/"
license=('GPL')
depends=('sdl_mixer')
[[ $CARCH == x86_64 ]] && depends=('lib32-sdl_mixer')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname.$pkgver.linux.tar.gz
        $pkgname.launcher
        $pkgname.menu)
md5sums=('7a80f20e7a5897817a25ba3b25730f0e'
         'a9082f7e5e12fd37c0ab56bb4d5db71b'
         'e52ec2a14d8952d9a23581105eb8eb28')

build() {
  cd "$srcdir/$pkgname.$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname.$pkgver"
  install -dm755 "$pkgdir/usr/share/$pkgname/res"
  find res -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/$pkgname/res" \;
  install -Dm644 res/r_j.bmp "$pkgdir/usr/share/pixmaps/$pkgname.bmp"
  install -Dm755 $pkgname "$pkgdir/usr/share/$pkgname/$pkgname"
  install -Dm755 ../$pkgname.launcher "$pkgdir/usr/bin/$pkgname"
  install -Dm644 ../$pkgname.menu "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
