#Contributor: mathieu.clabaut <mathieu.clabaut@gmail.com>

pkgname=merest
pkgver=20131001
pkgrel=3
pkgdesc="convert WPI from Wacom Inkling pen to SVG"
arch=('i686' 'x86_64')
url="https://gitorious.org/robmyers/merest"
license=('GPL3')
provides=('merest')
conflicts=('merest')
makedepends=('automake' 'gcc')
#optdeps=('cuneiform: alternativer OCR')
source=()
md5sums=()

_gitroot="git://gitorious.org/robmyers/merest.git"
_gitrepo="merest"

build() {
  cd $srcdir

  if [ -d $_gitrepo ]; then
    (cd $_gitrepo && git pull -u origin)
  else
    git clone $_gitroot $_gitrepo
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  [ -d $_gitrepo-build ] && rm -rf $_gitrepo-build 
  cp -r $_gitrepo $_gitrepo-build
  cd $_gitrepo-build
  rm depcomp install-sh missing
  ln -s /usr/share/automake-*/missing .
  ln -s /usr/share/automake-*/depcomp .
  ln -s /usr/share/automake-*/install-sh .
  aclocal
  automake
  ./configure --prefix=/usr
  make install DESTDIR=$pkgdir


}

