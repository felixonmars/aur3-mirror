# Maintainer: Parth Buch <parthbuch115 at gmail dot com>
# Contributor: Tom Vincent <http://tlvince.com/contact/>

pkgname=meteorjs
pkgver=0.3.5
pkgrel=1
pkgdesc="A new way to build apps."
arch=('i686' 'x86_64')
url="https://github.com/meteor/meteor"
license=('GPL')
_source="http://d3sqy0vbqsdhku.cloudfront.net/meteor_$pkgver-1"

if [ "$CARCH" == x86_64 ]; then
  _arch="amd64.deb"
  md5sums=('0ca5035b1f7dfb5df242f6f342a9490e')
else
  _arch="i386.deb"
  md5sums=('7da6a2cddc21c40478eb0c0acb7dfaa3')
fi

source=(${_source}_${_arch})

build() {
  ar x meteor_$pkgver-1_$_arch
  mkdir -p meteor
  tar xf data.tar.gz -C meteor
  cp -r meteor/* $pkgdir
  rm -rf control.tar.gz data.tar.gz debian-binary
}
