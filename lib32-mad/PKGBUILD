# Maintainer: Richard Harris <richardjharris@gmail.com>

pkgname=lib32-mad
pkgver=0.15.1b
pkgrel=6
pkgdesc="high-quality MPEG audio decoder"
url="http://www.underbit.com/products/mad/"
arch=('x86_64')
license=('GPL')
groups=('lib32')
depends=('lib32-glibc')
source=(ftp://ftp.archlinux.org/extra/os/i686/libmad-0.15.1b-6-i686.pkg.tar.xz)
md5sums=(d7010ee4dca3924efd19a5dc68a46565)

build() {
  mkdir -p $pkgdir/usr/lib32/
  cp -R $srcdir/usr/lib/*.so* $pkgdir/usr/lib32/
}
