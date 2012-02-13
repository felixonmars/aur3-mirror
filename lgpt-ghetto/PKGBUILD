# Maintainer: fuxter <fuxterz@gmail.com>

pkgname=lgpt-ghetto
pkgver=1.2A044
pkgrel=1
pkgdesc="LittleGPTracker (a.k.a 'The piggy') is a music tracker optimised to run on portable game consoles. Ghetto builds are intermediate builds that are up for testing as functionality are implemented."
arch=('i686')
url="http://littlegptracker.com/"
license=('custom')
depends=('sdl')
optdepends=('jack: for jack support')
source=(http://dl.dropbox.com/u/323652/ghetto/lgpt.deb-exe)
md5sums=('43be604bc383d1bcdbafeb8d2b0bbd80')

package() {
  cd "$srcdir/$_distname"
  install -Dm755 lgpt.deb-exe "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
