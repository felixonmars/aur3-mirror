arch=(i686 x86_64)
pkgname=swank-clojure-git
pkgver=20081213
pkgrel=1
pkgdesc="swank/slime support for clojure"
url="http://clojure.codestuffs.com/"
license="GPL3"
depends=('emacs' 'slime')
makedepends=('git')
provides=('swank-clojure')
conflicts=()
replaces=('swank-clojure')
backup=()
source=('swank-clojure-git.install')
md5sums=('1c68b352b73e511c887f14c8b79d1425')
install=('swank-clojure-git.install')

_gitroot="git://github.com/jochu/swank-clojure"
_gitname="swank-clojure"
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
  
  rm -f README

  # install the directory in emacs site-lisp
  install -d $pkgdir/usr/share/emacs/site-lisp/$_gitname

  # install the files in directory created above
  cp -R * $pkgdir/usr/share/emacs/site-lisp/$_gitname
} 
