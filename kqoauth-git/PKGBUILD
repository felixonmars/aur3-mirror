# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer:  Martin Stiborsky <martin.stiborsky@gmail.com>
pkgname=kqoauth-git
pkgver=20141014
pkgrel=1
pkgdesc="Easy and powerful OAuth library for Qt"
arch=('i686' 'x86_64')
url="http://www.johanpaul.com/blog/"
license=('LGPL')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/kypeli/kQOAuth.git"
_gitname="kQOAuth"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  qmake-qt4 || return 1
  make || return 1
  make INSTALL_ROOT="$pkgdir/" install || return 1
} 
