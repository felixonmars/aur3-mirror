arch=(i686 x86_64)
pkgname=emacs-dtrt-indent-mode-git
pkgver=20130214
pkgrel=2
pkgdesc="emacs minor mode to guess a file's indentation offset"
url="http://savannah.nongnu.org/projects/dtrt-indent/"
license="GPL2"
depends=('emacs')
makedepends=('git')
provides=('emacs-dtrt-indent-mode')
conflicts=()
replaces=('emacs-dtrt-indent-mode')
backup=()
source=('emacs-dtrt-indent-mode-git.install')
md5sums=('0dadb83b0616a4a4e4ca6a8dedea2f5d')
install='emacs-dtrt-indent-mode-git.install'

_gitroot="git://git.savannah.nongnu.org/dtrt-indent.git"
_gitname="dtrt-indent"
build() {
  cd $startdir/src
  msg "Connecting to github.com GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cp -r $startdir/src/$_gitname $startdir/src/$_gitname-build
  cd $startdir/src/$_gitname-build
  
  # install the directory in emacs site-lisp
  install -d $pkgdir/usr/share/emacs/site-lisp/$_gitname

  # install the files in directory created above
  install -m644 * -t $pkgdir/usr/share/emacs/site-lisp/$_gitname
} 
