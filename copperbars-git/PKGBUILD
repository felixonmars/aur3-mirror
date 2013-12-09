# Maintainer ilikenwf <parwok@gmail.com>
# Based on bitcoin-git by Richard "Nothing4You" Schwab <mail NOSPAM w.tf-w.tf>

pkgname=copperbars-git
pkgver=0.1
pkgrel=1
epoch=1
pkgdesc="Copperbars is a CPU only peer-to-peer network based digital currency."
arch=('i686' 'x86_64')
url="https://github.com/copperbars/copperbars"
depends=('qt4>=4.6' 'libpng>=1.4' 'expat' 'gcc-libs' 'boost-libs>=1.46' 'miniupnpc>=1.5' 'openssl' 'db4.8' 'protobuf')
makedepends=('git' 'boost' 'gcc' 'make' 'automoc4')
provides=('copperbars')
license=('MIT')
source=(git://github.com/copperbars/copperbars.git
'copperbars.desktop'
'copperbars.png')
sha512sums=('SKIP'
            '41965e366f58863e25095e2ee0a067dc638a5eff1c133ac3b9bb8c9d1cb06c35c31312294097f6498b4cc60adba633423a96be24c79eaf497e97537da75d3ac6'
            'c79618ef8dc982a6a6c7eaf180db3ca4f2bbbd70cb961ad7be5e2b1016326f00004a204b2052d4c871c9ab1e3a42aa7bffca1166c81e1f3dfc21ac4b28b2eb69')

pkgver() {
  cd "$srcdir/quark"
  git describe | sed "s/^v//; s/-/./g"
}

build() {
  cd "$srcdir/copperbars"
  qmake-qt4 copperbars-qt.pro

  make # $MAKEFLAGS
}

package() {
  cd "$srcdir/copperbars"

  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  
  cp CopperBars "$pkgdir/usr/bin"  
  cp "$srcdir/copperbars.desktop" "$pkgdir/usr/share/applications"
  cp "$srcdir/copperbars.png" "$pkgdir/usr/share/pixmaps"
}
