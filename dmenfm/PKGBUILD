# Maintainer: Scott Garrett <Wintervenom@archlinux.us>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=dmenfm
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple dmenu-based file manager."
url="http://wintervenom.mine.nu"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dmenu')

#install=($pkgname.install)

source=(
    'dmenfm'
)
md5sums=('704fbdb672f4a6b82cd32eacd3eb342b')

build() {
  cd $srcdir
  mkdir $pkgdir/usr $pkgdir/usr/bin
  cp dmenfm $pkgdir/usr/bin
  chmod a+x $pkgdir/usr/bin/dmenfm

  return 0
}
