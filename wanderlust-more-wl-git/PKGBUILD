pkgname=wanderlust-more-wl-git
pkgver=20090713
pkgrel=1
pkgdesc="Mail/News reader supporting IMAP4rev1 for emacs."
arch=(i686 x86_64)
url="http://www.gohome.org/wl"
license=('GPL')
depends=('emacs' 'emacs-apel>=10.7' 'flim' 'semi')
makedepends=('cvs')
optdepends=('bbdb: contact management utility')
conflicts=('wanderlust' 'wanderlust-cvs')
provides=('wanderlust')
install=wanderlust-more-wl.install
source=()

_gitroot="git://repo.or.cz/more-wl.git"
_gitname="more-wl"

build() {
  cd $startdir/src
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT clone done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
  make install LISPDIR=$startdir/pkg/usr/share/emacs/site-lisp PIXMAPDIR=$startdir/pkg/usr/share/emacs/`emacs -batch -eval "(princ (format \"%d.%d\" emacs-major-version emacs-minor-version))"`/etc/wl/icons/ || return 1
  install -m644 $startdir/src/$_gitname-build/utils/ssl.el ${startdir}/pkg/usr/share/emacs/site-lisp/ || return

  rm -r $startdir/src/$_gitname-build
}
