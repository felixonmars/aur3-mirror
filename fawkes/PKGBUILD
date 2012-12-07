# Maintainer: Till Hofmann <hofmann@kbsg.rwth-aachen.de>
pkgname=fawkes
pkgver=0.5.0
pkgrel=2
pkgdesc="A component-based Software Framework for Robotic Real-Time Applications for various Platforms and Domains."
url="http://www.fawkesrobotics.org/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=()
optdepends=('flite-fpic-8kvoice: voice support' 
            'asciidoc: man pages'
            'tolua++-fpic: various plugins' 
           )
makedepends=('fawkes-devenv')
conflicts=('fawkes-git')
options=(!buildflags)
source=("http://files.fawkesrobotics.org/releases/fawkes-0.5.0.tar.bz2"
        "arch.patch"
        "skillspace.patch")
md5sums=('70afa25f0cf0a0634f7ab2696dd05abc'
         '26b0f488e6b119e0b0a1f9814c331d96'
         '5e20660cd101217bdf7caf5e74064a7b')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../arch.patch
  patch -p2 < ../skillspace.patch
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d -m755 $pkgdir/usr/bin
  install -D -m755 bin/* $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/lib
  install -D -m755 lib/lib* $pkgdir/usr/lib
  install -d -m755 $pkgdir/usr/lib/fawkes/interfaces
  install -D -m755 lib/interfaces/* $pkgdir/usr/lib/fawkes/interfaces
  install -d -m755 $pkgdir/usr/lib/fawkes/plugins
  install -D -m755 plugins/* $pkgdir/usr/lib/fawkes/plugins
  install -d -m755 $pkgdir/usr/share/man/man1
  install -D -m644 doc/man/man1/* $pkgdir/usr/share/man/man1
  install -d -m755 $pkgdir/usr/share/man/man8
  install -D -m644 doc/man/man8/* $pkgdir/usr/share/man/man8
}
