# Maintainer: catwell <catwell@archlinux.us>

pkgname=mksend-hg
pkgver=20130810
pkgrel=1
pkgdesc="Tool to redirect, modify and send frames from a traffic active link."
arch=('i686' 'x86_64')
url="http://nopcode.org/wk.php/mksend"
license=('GPL')
depends=(''libpcap)
makedepends=('mercurial')
conflicts=('mksend')
provides=('mksend')
source=()
md5sums=()

_hgroot='https://bitbucket.org/radare'
_hgrepo='mksend'

build() {
  cd $srcdir
  rm -rf $_hgrepo
  hg clone ${_hgroot}/${_hgrepo}
  cd $_hgrepo
  chmod +x configure
  export LDFLAGS="${LDFLAGS//,--as-needed}"
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_hgrepo
  install -d $pkgdir/usr/share/mksend/db $pkgdir/usr/share/mksend/scripts \
    $pkgdir/var/db/mksend
  install -m0644 db/*.xml $pkgdir/usr/share/mksend/db/
  install -m0755 scripts/*.sh $pkgdir/usr/share/mksend/scripts/
  install -Ds src/mksend $pkgdir/usr/sbin/mksend
  install -Ds pcaptool/pcaptool $pkgdir/usr/bin/pcaptool
  install -Dm0444 doc/man/man1/pcaptool.1 $pkgdir/usr/share/man/man1/pcaptool.1
}
