# Maintainer: perlawk

pkgname=logtalk
pkgver=3.00.0
pkgrel=1
pkgdesc="Logtalk is an object-oriented logic programming language that extends and leverages the Prolog language"
arch=('i686' 'x86_64')
url="http://logtalk.org/download.html"
license=('LGPL' 'GPL')
depends=("gprolog")
#depends=("swi-prolog")
#depends=("xsb")
#depends=("yap")
#depends=("qu-prolog")
options=(!strip)
source=( "http://logtalk.org/files/${pkgname}-${pkgver}.tar.bz2")

md5sums=('242b62444759ec4d9ff5385638e31280')
build() {
  cd "$srcdir"/${pkgname}-$pkgver/scripts
}

package() {
  cd "$srcdir"/${pkgname}-$pkgver/scripts
  mkdir -p $pkgdir/usr/share
  ./install.sh -p $pkgdir/usr/
  rm -rf $pkgdir/usr/share/mime
  echo by put the following command to .bashrc
  echo export LOGTALKHOME=/usr/share/logtalk
  echo mkdir -p ${HOME}/logtalk
  echo export LOGTALKUSER=${HOME}/logtalk
}
