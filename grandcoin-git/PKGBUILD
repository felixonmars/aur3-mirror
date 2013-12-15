# Maintainer ilikenwf <parwok@gmail.com>
# Based on bitcoin-git by Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

pkgname=grandcoin-git
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="grandcoin is a CPU only peer-to-peer network based digital currency."
arch=('i686' 'x86_64')
url="http://www.grandcoin.org/"
depends=('qt4>=4.6' 'libpng>=1.4' 'expat' 'gcc-libs' 'boost-libs>=1.46' 'miniupnpc>=1.5' 'openssl' 'db4.8' 'protobuf')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4' 'libtool')
provides=('grandcoin')
license=('MIT')
source=(git://github.com/grandcoin/grandcoin.git
'grandcoin.desktop'
'grandcoin.png')
sha512sums=('SKIP'
            'ad2dfe749693a364cb23f476b510241071d396feb77a675500c1b38c8a364227fef555856e17847781c9434373121ca57c221fef9e2e4fae176f12675dc93e0e'
            '1ce07be3a8f1ad183e6bed29db07c4b64ff099eca771bb905a99e441d577d5e48d1d122026baac7eefc2994c5baa30fe4586267bd9a23a99f0a7ebb62ac68d15')
pkgver() {
  cd "$srcdir/grandcoin"
  git describe | sed "s/^v//; s/-/./g"
}

build() {
  cd "$srcdir/grandcoin"
  qmake-qt4 grandcoin-qt.pro

  make # $MAKEFLAGS
}

package() {
  cd "$srcdir/grandcoin"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  
  cp grandcoin-qt "$pkgdir/usr/bin"  
  cp "$srcdir/grandcoin.desktop" "$pkgdir/usr/share/applications"
  cp "$srcdir/grandcoin.png" "$pkgdir/usr/share/pixmaps"
}
