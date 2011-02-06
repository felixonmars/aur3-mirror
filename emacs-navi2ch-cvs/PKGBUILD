# Contributor: Anergy <anergy.25110321@gmail.com>
pkgname=emacs-navi2ch-cvs
pkgver=20101211
pkgrel=1
pkgdesc="2ch BBS browser worked on Emacsen"
arch=("i686" "x86_64")
url="http://navi2ch.sourceforge.net/"
license=('GPL2')
groups=()
depends=("emacs")
makedepends=('cvs')
provides=(emacs-navi2ch)
conflicts=(emacs-navi2ch)
replaces=()
backup=()
options=()
install=emacs-navi2ch.install
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_cvsroot=":pserver:anonymous@navi2ch.cvs.sourceforge.net:/cvsroot/navi2ch"
_cvsmod="navi2ch"

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


  ./configure --prefix=/usr
  make || return 1
}

package() {
	cd "$srcdir/$_cvsmod-build"
	make DESTDIR="$pkgdir/" install || return 1
	rm -f $pkgdir/usr/share/info/dir
}
