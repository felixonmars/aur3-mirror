# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
pkgname=check-kernel
pkgver=1
pkgrel=1
pkgdesc="Bash script to check/download latest kernel from kernel.org"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/cli-kernel"
license=('GPL3')
depends=('bash' 'wget')
source=(http://downloads.sourceforge.net/cli-kernel/v$pkgver/checkkernel)
md5sums=('43adb56b396df6c1bc72f02f3354e5a2') 

build() {
  cd $srcdir
  install -d $pkgdir/usr/bin
  install -m755 checkkernel $pkgdir/usr/bin
 
}

# vim:set ts=2 sw=2 et:
