# Contributor: TDY <tdy@archlinux.info>

pkgname=swm
pkgver=1.3.4c
pkgrel=6
pkgdesc="A small window manager with a low memory footprint"
arch=('i686' 'x86_64')
url="http://www.small-window-manager.de/"
license=('GPL')
depends=('libxpm')
install=swm.install
source=(http://www.small-window-manager.de/swm-$pkgver-src.tgz
        http://www.small-window-manager.de/swmthemes.tgz swm-$pkgver.diff)
sha256sums=('fc4fdfcb423a75789bb12f8045a3f465bdd66f3413b8ef77833c26e9e035d58b'
            'e1746c3106828172b0cc4589b42ed3aedd3c3bbd8f94344735b251f55090ea1a'
            '845133be486e7149212c8be7c63252aa3d61d1f0a442638796bc33a17993290a')

build() {
  cd "$srcdir/swm-${pkgver%c}/src"
  patch -Np0 -i ../../swm-$pkgver.diff
}

package() {
  cd "$srcdir/swm-${pkgver%c}/src"
  make
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
