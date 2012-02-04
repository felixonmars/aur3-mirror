# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Maintainer: Filip Wojciechowski, filip at loka dot pl
pkgname=alac_decoder
pkgver=0.2.0
pkgrel=1
pkgdesc="A basic decoder for Apple Lossless Audio Codec files"
arch=('i686' 'x86_64')
url="http://craz.net/programs/itunes/alac.html"
license=('custom')
depends=('glibc')
source=(http://craz.net/programs/itunes/files/${pkgname}-${pkgver}.tgz \
	    LICENSE.txt)
md5sums=('cec75c35f010d36e7bed91935b57f2d1'
         '19918a12e58dd8a53bc724273ad0161f')

build() {
  cd ${startdir}/src/${pkgname}

  make || return 1

  install -D -m755 alac ${startdir}/pkg/usr/bin/alac || return 1
  install -D -m644 ../LICENSE.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE.txt || return 1
}
