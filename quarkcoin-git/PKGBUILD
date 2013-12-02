# Maintainer ilikenwf <parwok@gmail.com>
# Based on bitcoin-git by Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

pkgname=quarkcoin-git
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="Quarkcoin is a CPU only peer-to-peer network based digital currency."
arch=('i686' 'x86_64')
url="http://www.quarkcoin.com/"
depends=('qt4>=4.6' 'libpng>=1.4' 'expat' 'gcc-libs' 'boost-libs>=1.46' 'miniupnpc>=1.5' 'openssl' 'db4.8' 'protobuf')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('quarkcoin')
license=('MIT')
source=(git://github.com/MaxGuevara/quark.git
'quarkcoin.desktop'
'quarkcoin.png')
sha512sums=('SKIP'
            'f906ba2faab4da6202ea374c26e70cb928c031e392ea1a482b7dc5a0754540fe54f5f447bef21401779d4430c4671a7803dbec16be5cf0c71f3460a190bd237c'
            '2b1c8d8a458b435d6a040e0395fa2653b88a74997ea6cc2431e1cda87e46b17d517e44a14572def4545f51763c6d95bf903909e1b2d4f986c76667076369250b')

pkgver() {
  cd "$srcdir/quark"
  git describe | sed "s/^v//; s/-/./g"
}

build() {
  cd "$srcdir/quark"
  qmake-qt4 quarkcoin-qt.pro

  make # $MAKEFLAGS
}

package() {
  cd "$srcdir/quark"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  
  cp quarkcoin-qt "$pkgdir/usr/bin"  
  cp "$srcdir/quarkcoin.desktop" "$pkgdir/usr/share/applications"
  cp "$srcdir/quarkcoin.png" "$pkgdir/usr/share/pixmaps"
}
