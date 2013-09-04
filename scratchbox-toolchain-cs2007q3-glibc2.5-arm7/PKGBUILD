# Maintainer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=scratchbox-toolchain-cs2007q3-glibc2.5-arm7
pkgver=1.0.16.1
pkgrel=1
pkgdesc="scratchbox cs2007q3-glibc2.5-arm7 toolchain"
arch=('i686' 'x86_64')
url="http://www.scratchbox.org/"
license=('GPL')
source=(http://www.scratchbox.org/download/files/sbox-releases/hathor/tarball/$pkgname-$pkgver-8-i386.tar.gz)
md5sums=('913f63e7fe2364f405aa80677b4eac35')
options=('!strip')

package() {
  cp -R scratchbox "$pkgdir/"
}
