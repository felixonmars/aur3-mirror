# Maintainer: Bernardo Barros <bernardobarros@gmail.com>

pkgname=supercollider-dfm1
pkgver=1
pkgrel=1
pkgdesc="Filter UGen for SuperCollider. It is a port for SuperCollider of Tony Hardie-Bick's DFM1 digital filter module. It is an accurate model of an analog filter and provides low-pass and high-pass filtering. The filter can be overdriven and will self-oscillate at high resonances."
arch=('i686' 'x86_64')
url="http://jeremah.co.uk/dfm1ugen.html"
license=('GPL')
groups=('supercollider-plugins')
source=('http://jeremah.co.uk/downloads/dfm1/dfm1ugen.tar.gz' 'SConstruct')

md5sums=('83bfc2fe12b32b75b7a12e770184ee49'
         'e039e98eff530df54e43b11d1e85078a')

build() {

  cd "$srcdir/Dfm1UGen"

  mv SConstruct SConstruct.old
  cp $startdir/SConstruct "$srcdir/Dfm1UGen"

  scons
}


package() {

  mkdir -p "$pkgdir/usr/share/SuperCollider/Extensions/TJUGens/"
  mkdir -p "$pkgdir/usr/lib/SuperCollider/plugins"

  install -m 755 $srcdir/Dfm1UGen/TJUGens.so $pkgdir/usr/lib/SuperCollider/plugins
  install -m 644 $srcdir/Dfm1UGen/TJUGens.sc $pkgdir/usr/share/SuperCollider/Extensions/TJUGens/
  install -m 644 $srcdir/Dfm1UGen/DFM1.html $pkgdir/usr/share/SuperCollider/Extensions/TJUGens/
  install -m 644 $srcdir/Dfm1UGen/README $pkgdir/usr/share/SuperCollider/Extensions/TJUGens/

} 
