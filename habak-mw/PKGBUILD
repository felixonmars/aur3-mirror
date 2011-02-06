# Maintainer: Andrej Gelenberg <andrej.gelenberg@udo.edu>
pkgname=habak-mw
pkgver=0.2.5
pkgrel=1
pkgdesc="A background changing app whith width strech patch"
url="http://fvwm-crystal.org"
license=('GPL2')
depends=('imlib2')
source=(http://download.gna.org/fvwm-crystal/habak/$pkgver/habak-$pkgver.tar.gz habak-mW.patch)
arch=('i686' 'x86_64')

md5sums=('bee5c394989367f7a4c5cb9ec99d307c'
         'a2ecfb51231879a1d98e3852886db372')
sha512sums=('4b1ff1484c65f74441b297e558360a8f2ea8f12ac63c4b74f846e41328dd84a1d619bde55e81224c3bd527897625e17bc07a6bb0d4cc3bd0eec6f4e787201277'
            '69e4a6cdbb46e115979d9dee65bacfd63941a7ca4eb10ec9887fc9c0e77e6a9daf3cb4165b81ad59b0a7b72ef0d67baecf2d44b5f027fb9382ec89b7de1d518e')

build() {
  cd $srcdir/habak-$pkgver
  patch -p1 <../habak-mW.patch
  LDFLAGS="-Wl,--hash-style=gnu" make || return 1
  install -m755 -D habak $pkgdir/usr/bin/habak || return 1
}
