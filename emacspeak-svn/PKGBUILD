# Maintainer: Hussain Jasim <hussainmkj@gmail.com>
# Contributors: Chris Brannon <cmbrannon79@gmail.com>
pkgname=emacspeak-svn
pkgver=r9377
pkgrel=1
pkgdesc="Emacs extension that provides spoken output"
arch=(i686 x86_64)
url="http://emacspeak.sourceforge.net/"
license=('GPL' 'custom')
makedepends=('subversion')
depends=('emacs' 'tcl>=8.6' 'tcl<8.7' 'tclx' 'espeak')
optdepends=(  'eflite: software speech via the FLite TTS engine')
provides=(emacspeak)
conflicts=(emacspeak)
install='emacspeak-svn.install'
source=($pkgname::svn+http://emacspeak.googlecode.com/svn/trunk/)
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$pkgname
  echo r$(svnversion)
}

prepare() {
  cd $srcdir/$pkgname
  sed -i -e 's, /etc/info-dir, $(DESTDIR)$(infodir)/dir,g;s, $(infodir)/, $(DESTDIR)$(infodir)/,' info/Makefile
}

build() {
  cd $srcdir/$pkgname
  ./configure
  make emacspeak
}

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir" install
  # Espeak isn't compiled by default, but lots of folks use it.
  cd "$pkgdir/usr/share/emacs/site-lisp/emacspeak/servers/linux-espeak"
  make TCL_VERSION=8.6
  rm -f tclespeak.cpp Makefile
  # A handful of files have permissions of 750 and 640; fix.
  cd "$pkgdir"
  find . -perm 640 -print0
  find . -perm 750 -print0
  gzip -9nf "${pkgdir}"/usr/share/info/*
  rm -f "$pkgdir/usr/share/info/dir"
}
