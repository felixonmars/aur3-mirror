# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=moz-gcc-bin
_gccver=4.7.2
_mozver=0moz1
_shortname=gcc472_${_mozver}
pkgver=${_gccver}_${_mozver}
pkgrel=1
pkgdesc='The GNU Compiler Collection (for Mozilla projects)'
arch=('i686' 'x86_64')
url='https://developer.mozilla.org'
license=('GPL' 'LGPL')
install=$pkgname.install

if [ "$CARCH" = 'i686' ]; then
  _arch='i386'
  md5sums=('3079b4895bc796ad51fbbed2799e6d31')
elif [ "$CARCH" = 'x86_64' ]; then
  _arch='x86_64'
  md5sums=('46cc57d1c48b52e9df43664c2c81856d')
fi

source=("http://puppetagain.pub.build.mozilla.org/data/repos/yum/releng/public/CentOS/6/${_arch}/${_shortname}-${_gccver}-${_mozver}.${CARCH}.rpm")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/mozilla"
  cp -r tools "${pkgdir}/opt/mozilla"
}
