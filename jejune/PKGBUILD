# Author: Zack Corr
# Maintainer: z0w0 <zack@z0w0.me>

_npmname=jejune
pkgname=jejune
pkgver=0.1.1
pkgrel=1
pkgdesc="Generating stereotypical usernames has never been easier"
arch=("any")
url="http://github.com/z0w0/jejune"
license=("MIT")
depends=("nodejs")
optdepends=()
source=("http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha1sums=("0f77ebdc310f2a13dc76669582d9905711716407")

build() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $_npmname@$pkgver
}

