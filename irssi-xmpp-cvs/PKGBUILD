# Contributor: scj, wzff
pkgname=irssi-xmpp-cvs
pkgver=20110210
_irssiver=0.8.15
pkgrel=1
pkgdesc="irssi plugin to connect to the Jabber network"
arch=('i686' 'x86_64')
url="http://cybione.org/~irssi-xmpp/"
provides=('irssi-xmpp')
license=('GPL2')
conflicts=('irssi-xmpp')
depends=('loudmouth' 'irssi')
makedepends=('cvs')
source=("http://irssi.org/files/irssi-$_irssiver.tar.bz2")
md5sums=('1dcb3f511b88df94b0c996f36668c7da')

_cvsroot="anoncvs@cvs.cybione.org:/cvs/irssi-xmpp"
_cvsmod="irssi-xmpp"

build() {
  cd "$srcdir"
  msg "CVS: Connecting to $_cvsroot..."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    CVS_RSH='ssh' cvs -z3 update -d -P
  else
    CVS_RSH='ssh' cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
  fi
  msg "CVS checkout done or server timeout"

  # we need the irssi headers, and they are no longer in the package.
  cd $srcdir/irssi-$_irssiver
  ./configure --prefix=/usr \
    --enable-ipv6 \
    --sysconfdir=/etc \
    --with-perl-lib=vendor

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"
  make IRSSI_INCLUDE=$srcdir/irssi-$_irssiver
}
package() {
  cd $srcdir/$_cvsmod-build
  make install DESTDIR=$pkgdir PREFIX=/usr
}
# vim:set ts=4 sw=4 et:
