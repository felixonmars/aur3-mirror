# Original Author: zertyz <zertyz@gmail.com>

pkgname=nw.js
pkgver=0.12.0
pkgrel=1
pkgdesc="Framework to build multiplatform desktop applications using HTML5/CSS3/JavaScript and node.js back end"
arch=('x86_64')
url="http://nwjs.io"
license="GPL"
depends=('libsystemd')
makedepends=('git')
options=('!strip')
source=("http://dl.nwjs.io/v0.12.0/nwjs-v0.12.0-linux-x64.tar.gz")

package() {
  mkdir -p "$pkgdir/opt/"

  # zip has a linux64/ folder hierarchy
  _srcdir="$srcdir/nwjs-v$pkgver-linux-x64"

  # build the /opt structure
  mv "$_srcdir" "$pkgdir/opt/$pkgname"

  # get the examples
  cd "$pkgdir"/opt/"$pkgname"
  git clone 'https://github.com/zcbenz/nw-sample-apps.git'

  # link
  mkdir -p "$pkgdir/usr/local/bin"
  ln -s "$_srcdir/nw" "$pkgdir/usr/local/bin"

}

md5sums=('c42a66a7362cac72e3a9cdaa4e479d8c')
