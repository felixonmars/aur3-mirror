# Maintainer: CUI Hao <cuihao.leo at gmail dot com>
#Contributor: Kandu <1123monkey at 163 dot com>

pkgname=zh-autoconvert
pkgver=0.3.16
pkgrel=1
pkgdesc="An intelligent Chinese Encoding converter."
url="http://libhz.googlecode.com/"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('pkgconfig')
source=(${url}/files/${pkgname}-${pkgver}.tar.gz
	autoconvert.patch)
md5sums=('1f4aa2332afc076910b5d510b8c81966'
	'1f7c39af01d6845c064da59224ae503b')

build() {
  cd "${srcdir}/autoconvert-${pkgver}"

  patch -Np1 -i ../autoconvert.patch || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

