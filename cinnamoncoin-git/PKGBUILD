# Maintainer ilikenwf <parwok@gmail.com>
# Based on bitcoin-git by Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

pkgname=cinnamoncoin-git
pkgver=0.1
pkgrel=2
epoch=1
pkgdesc="Cinnamoncoin is a peer-to-peer network based digital currency."
arch=('i686' 'x86_64')
url="http://cinnamoncoin.org/"
depends=('qt4>=4.6' 'libpng>=1.4' 'expat' 'gcc-libs' 'boost-libs>=1.46' 'miniupnpc>=1.5' 'openssl' 'db4.8' 'protobuf')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('cinnamoncoin')
license=('MIT')
source=(git://github.com/cinnamoncoin/cinnamoncoin.git
'cinnamoncoin.desktop'
'cinnamoncoin.png')
sha512sums=('SKIP'
            '8885a1b0d47d64bfdf7e1ae18aaa4602a7b7fde4c06038bb37033258c31dd5959f6696f712ae6a94462180da27e232c4bcadfebc127682bf25e0b144d8ac839d'
            '7eb3adeb216598fc933aea4e4b8a436c7ac977b23613632610054f42d02b334eccb0f67a04023a5ec31db224e6add63a75ebd73c4a4198e15a09a2c888797399')

pkgver() {
  cd "$srcdir/cinnamoncoin"
  git describe | sed "s/^v//; s/-/./g"
}

build() {
  cd "$srcdir/cinnamoncoin"
  qmake-qt4 cinnamoncoin-qt.pro

  make # $MAKEFLAGS
}

package() {
  cd "$srcdir/cinnamoncoin"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  
  cp cinnamoncoin-qt "$pkgdir/usr/bin"  
  cp "$srcdir/cinnamoncoin.desktop" "$pkgdir/usr/share/applications"
  cp "$srcdir/cinnamoncoin.png" "$pkgdir/usr/share/pixmaps"
}
