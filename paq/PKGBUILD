# Contributor: Mladen Pejaković <pejakm@gmail.com>
# Maintainer: Ray Kohler <ataraxia937@gmail.com>

pkgname=paq
pkgver=9a
pkgrel=1
pkgdesc="PAQ is a series of archivers that achieve very high compression rates at the expense of speed and memory"
url="http://www.cs.fit.edu/~mmahoney/compression/#paq"
arch=('x86_64' 'i686')
license=('GPL')
source=(http://www.cs.fit.edu/~mmahoney/compression/$pkgname$pkgver.zip)
md5sums=('be299078941bff9b88613191c9b0568d')

build()
{
  cd $startdir/src
  g++ paq9a.cpp $CFLAGS -o ${pkgname}${pkgver} || 1
  install -D -s -m 755 $startdir/src/${pkgname}${pkgver} ${startdir}/pkg/usr/bin/${pkgname}${pkgver}
}
