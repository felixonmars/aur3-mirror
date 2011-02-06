# Maintainer: John Schug <xtr dot xtrnet at gmail dot com>
pkgname=z88dk-cvs
pkgver=20100209
pkgrel=2
pkgdesc="A small C compiler for the Zilog Z80."
arch=('i686' 'x86_64')
url="http://z88dk.org"
license=('custom:The Clarified Artistic License')
groups=()
depends=('glibc')
makedepends=('cvs')
optdepends=()
provides=('z88dk')
conflicts=()
replaces=()
backup=(etc/profile)
options=()
install=INSTALL
source=()
noextract=()
md5sums=()

_cvsroot=":pserver:anonymous@z88dk.cvs.sourceforge.net:/cvsroot/z88dk"
_cvsmod="z88dk"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"

  cd "$srcdir/$_cvsmod-build"

  mkdir -p $pkgdir/usr/share/licenses/z88dk-cvs/
  cp LICENSE $pkgdir/usr/share/licenses/z88dk-cvs
  
  mkdir "bin"

  make || return 1
  make prefix=/usr DESTDIR="$pkgdir/" install || return 1

  echo "export ZCCCFG=/usr/share/z88dk/lib/config/" > $pkgdir/usr/share/z88dk/exports
  echo "export Z80_OZFILES=/usr/share/z88dk/lib/" >> $pkgdir/usr/share/z88dk/exports
}

# vim:set ts=2 sw=2 et:
