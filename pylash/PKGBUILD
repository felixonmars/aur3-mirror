# Maintainer: Bernardo Barros <bernardobarros at gmail dot com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
pkgname=pylash
_pkgname=lash
pkgver=0.6.0~rc2
pkgrel=1
pkgdesc="Python bindings for the session management system for JACK and ALSA"
arch=('i686' 'x86_64')
url="http://lash.nongnu.org/"
license=('GPL')
depends=('lash' 'python2')
makedepends=('swig>=1.3.27')
options=('!libtool')
source=(http://download.savannah.gnu.org/releases/lash/${_pkgname}-${pkgver}.tar.bz2)
md5sums=('af1dc4f4ceb284b1b0845de4f4c2fe47')

build() {
#  cd ${startdir}/src/${_pkgname}-${pkgver}
  cd ${startdir}/src/lash-0.6.0.594 
  sed -i -e 's/1.3.31/1.3.27/g' configure
  PYTHON=/usr/bin/python2 SWIG=/usr/bin/swig ./configure --prefix=/usr || return 1
  make || return 1

  cd pylash
  make DESTDIR=${startdir}/pkg install || return 1
}
