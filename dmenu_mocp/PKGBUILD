# Maintainer: Scott Garrett <Wintervenom@gmail.com>
# Contributor: Scott Garrett <Wintervenom@gmail.com>

pkgname=dmenu_mocp
pkgver=0.4.1
pkgrel=1
pkgdesc="A simple Dmenu-based application launcher.  Launches binaries and XDG shortcuts."
url="http://github.com/mutantturkey/mocicon"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dmenu' 'moc')
md5sums=('fb774adcdb785e0097fcdf3f1a20a28d')

source=(
    'dmenu_mocp'
)

build() {
  cd $srcdir
  install -d -m755 $pkgdir/usr/bin || return 1
  install -m755 $srcdir/dmenu_mocp $pkgdir/usr/bin/dmenu_mocp || return 1

  return 0
}
