# Contributor: Norberto Lopes <shelika@mail.telepac.pt>
pkgname=wanderlust-cvs
pkgver=20080622
pkgrel=2
pkgdesc="Mail/News reader supporting IMAP4rev1 for emacs."
arch=(i686 x86_64)
url="http://www.gohome.org/wl"
license=('GPL')
depends=('emacs' 'emacs-apel>=10.7' 'flim' 'semi')
makedepends=('cvs')
optdepends=('bbdb: contact management utility')
source=()
md5sums=()
install=wanderlust-cvs.install

_cvsroot=":pserver:anonymous@cvs.m17n.org:/cvs/root"
_cvsmod="wanderlust"

build() {
  cd $startdir/src
  msg "Connecting to cvs.m17n.org CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z9 update -d
  else
    cvs -z9 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r ../$_cvsmod ../$_cvsmod-build
  cd ../$_cvsmod-build

  make || return 1
  make install LISPDIR=$startdir/pkg/usr/share/emacs/site-lisp PIXMAPDIR=$startdir/pkg/usr/share/emacs/`emacs -batch -eval "(princ (format \"%d.%d\" emacs-major-version emacs-minor-version))"`/etc/wl/icons/ || return 1 
  
  install -m644 $startdir/src/wanderlust/utils/ssl.el ${startdir}/pkg/usr/share/emacs/site-lisp/

  rm -r $startdir/src/$_cvsmod-build
}
