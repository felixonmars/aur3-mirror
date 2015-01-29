# Maintainer: alex korobtsov <korobcoff@gmail.com>
pkgname=qtnote-git
pkgver=0.2.3.1.73
pkgrel=1
pkgdesc="Note-taking application written with Qt in mind and able to read tomboy notes"
arch=('i686' 'x86_64')
url="http://ri0n.github.io/QtNote/"
license=('GPL3')
depends=( 'qt4' )
makedepends=('git')
conflicts=(qtnote)
source=(git+https://github.com/Ri0n/QtNote)
md5sums=('SKIP') 

pkgver() {
  cd QtNote
 git describe --tags | cut -d - -f 1-2 --output-delimiter=.
}

_gitroot=https://github.com/RiOn/
_gitname=QtNote

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin master
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"
#  git submodule init
#  git submodule update
  
  # BUILD HERE
  qmake-qt4
make
}


package() {
#  cd "$srcdir/QtNote-build/"
cd $srcdir/QtNote-build 
 make INSTALL_ROOT="$pkgdir/"  install

}
