# Maintainer: Alex Anthony <alex.anthony28991@googlemail.com>

pkgname=xulrunner-headless-hg
pkgver=29672
pkgrel=1
pkgdesc="Xulrunner for headless, used for embedding"
arch=('i686' 'x86_64')
url="http://www.mozilla.org"
license=('GPL')
depends=('bzip2' 'cairo' 'alsa-lib' 'libxt' 'hunspell' 'nss' 'sqlite3' 'bash' 'nspr')
makedepends=('mercurial')
provides=()
conflicts=()
sources=('mozconfig'
         'mozilla-headless.sh')
install=$pkgname.install
_hgroot="http://hg.mozilla.org/incubator/offscreen/headless"
_hgrepo=headless


build() {
  rm -rf $srcdir/$_hgrepo-build
  cd $srcdir
  hg checkout $_hgrepo
#  cp -r $srcdir/$_hgrepo $srcdir/$_hgrepo-build 
#  cd $srcdir/$_hgrepo-build
#  cp $startdir/mozconfig $srcdir/$_hgrepo-build/.mozconfig
  cd $srcdir/$_hgrepo
  cp $startdir/mozconfig ./
  cp $startdir/mozconfig ./.mozconfig
  make -f client.mk configure || return 1
  cd ../mozilla-build
  make || return 1
  mkdir -p $pkgdir/opt/mozilla-headless
  make SKIP_GRE_REGISTRATION=1 DESTDIR=${pkgdir} install || return 1
  mkdir -p $pkgdir/etc/profile.d
  mkdir -p $pkgdir/usr/lib/pkgconfig
  install -m755 $startdir/mozilla-headless.sh $pkgdir/etc/prodile.d/mozilla-headless.sh
  cp $pkgdir/opt/mozilla-headless/lib/pkgconfig/* $pkgdir/usr/lib/pkgconfig/
}
