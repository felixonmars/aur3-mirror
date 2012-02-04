# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Contributor: Your Name <youremail@domain.com>
pkgname=pydp-git
pkgver=20100928
pkgrel=1
pkgdesc="A python3 implementation of Dissociated Press"
arch=("any")
url="http://github.com/anschelsc/pydp"
license=('GPL')
groups=()
depends=('python3')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/anschelsc/pydp.git"
_gitname="pydp"

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

  install -d $pkgdir/usr/bin/ || return 1
  install -m 755 $srcdir/$_gitname/pydp.py $pkgdir/usr/bin/pydp || return 1
} 
