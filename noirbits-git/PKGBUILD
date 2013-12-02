# Maintainer ilikenwf <parwok@gmail.com>
# Based on bitcoin-git by Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

pkgname=noirbits-git
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="Noirbits is a community based p2p network based digital currency."
arch=('i686' 'x86_64')
url="http://www.noirbits.com/"
depends=('qt4>=4.6' 'libpng>=1.4' 'expat' 'gcc-libs' 'boost-libs>=1.46' 'miniupnpc>=1.5' 'openssl' 'db4.8' 'protobuf')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('quarkcoin')
license=('MIT')
source=(git://github.com/ftcminer/Noirbits
'fix.patch'
'noirbits.png'
'noirbits.desktop')
sha512sums=('SKIP'
            '80b4827406c10284b5a81cbf46611151cb0dc08ec2edd27cc0180a53c6e5c4d36f92ba22ea12f20304b65a508111f03cdf6e0f0a284412ef30f7f3505dff3651'
            'fbe8afd88d867499d0a77fefa00d0999776b995e3c9c68a81fc9656082b0a6718021acb5d0bdd64f52f1c510be9313ec1b10a86cfa2db2aacf5ed89545cc2779'
            '8cebee5498bd6a0111a8b88e532368f94d0c431cf3dec58311d7ee2539a4c1ba1deda250ab0591024df3bddf62c46316727a1dc6717ecdb0e21b8aa548b90fbf')
            
pkgver() {
  cd "$srcdir/quark"
  git describe | sed "s/^v//; s/-/./g"
}

build() {
  cd "$srcdir/Noirbits"
  patch -Np1 -i "$srcdir/fix.patch"
  
  qmake-qt4 Noirbits-qt.pro

  make # $MAKEFLAGS
}

package() {
  cd "$srcdir/Noirbits"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  mkdir -p "$pkgdir/usr/share/applications"
  
  cp Noirbits-qt "$pkgdir/usr/bin/noirbits-qt"
  cp "$srcdir/noirbits.png" "$pkgdir/usr/share/pixmaps"
  cp "$srcdir/noirbits.desktop" "$pkgdir/usr/share/applications"
}
