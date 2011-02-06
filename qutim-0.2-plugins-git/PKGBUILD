# Contributor: LaFin
pkgname=qutim-0.2-plugins-git
pkgver=20100514
pkgrel=1
pkgdesc="plugins for Qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qutim')
makedepends=()
optdepends=()
provides=()

_gitroot="git://gitorious.org/qutim/plugins.git"
_gitname="plugins"

build() {
  msg "Git checkout"
  if [ -d $srcdir/$_gitname ]
  then
  msg "Updating local repository..."
  cd $_gitname
  git pull origin sdk02 || return 1 
  msg "The local files are updated."
  else
  git clone $_gitroot
  cd $_gitname
  git checkout origin/sdk02
  fi
  msg "Git checkout done or server timeout"
  msg "Creating temporary build directory..."
  cp -r $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  msg "Building and installing..."
  for i in *; do
    cd $i
    if [[ $i = "plugman" ]]; then
      cmake ./ || return 1
      make || return 1
    else
      qmake || return 1
      make || return 1
    fi
    mkdir -p $_gitname/pkg/usr/lib/qutim/
    install -Dm644 -p $srcdir/$_gitname-build/$i/lib$i.so $pkgdir/usr/lib/qutim/lib$i.so
    cd ..
  done
  msg "Removing build directory..."
  cd ${srcdir}
  rm -Rf ${_gitname}-build
}
