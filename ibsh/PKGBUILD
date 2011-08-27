# Maintainer: Carlos Franke <carlos_franke at lemtank dot de>

pkgname=ibsh
pkgver=0.3e
pkgrel=2
pkgdesc="A restricted system shell"
arch=('i686')
url="http://ibsh.sourceforge.net/"
license=('GPL')
depends=(glibc)
backup=('etc/ibsh/globals.cmds' 'etc/ibsh/globals.xtns')
source=(http://sourceforge.net/projects/ibsh/files/ibsh/ibsh-0.3e/$pkgname-$pkgver.tar.gz/download)
md5sums=('41ea08a03c6bd805dff1a5ff25ea1d5b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make $pkgname || return 1

  mkdir -p $pkgdir/bin || return 1
  mkdir -p $pkgdir/etc/ibsh/cmds || return 1
  mkdir -p $pkgdir/etc/ibsh/xtns || return 1
  cp $pkgname $pkgdir/bin/ || return 1
  cp globals.cmds $pkgdir/etc/ibsh/ || return 1
  cp globals.xtns $pkgdir/etc/ibsh/ || return 1
}
