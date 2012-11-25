pkgname=emacs-lout-git
pkgver=20121124
pkgrel=1
arch=('any')
pkgdesc="Emacs mode for the Lout document formatting system."
url="http://savannah.nongnu.org/projects/lout/"
depends=('emacs')
makedepends=('git')
license=('GPL')
_gitroot="git://github.com/emacsmirror/lout-mode.git"
_gitname=lout-mode


build() {
  cd $srcdir
  msg "Connecting to GIT server..."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "Local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/share/emacs/site-lisp/lout-mode"
  install -Dm644 *.el "$pkgdir/usr/share/emacs/site-lisp/lout-mode"
} 
