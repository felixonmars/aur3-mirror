# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
pkgname=frei0r-plugins-git
pkgver=20121112
pkgrel=1
pkgdesc="frei0r is a minimalistic plugin API for video sources and filters."
arch=(i686 x86_64)
url="http://www.piksel.org/frei0r"
license=('GPL')
depends=('gcc-libs' 'gavl>=1.0.0' 'opencv')
provides=('frei0r-plugins')
conflicts=('frei0r-plugins')
md5sums=()

_gitroot="git://code.dyne.org/frei0r.git"
_gitname="frei0r"

build() {
  cd $srcdir
  msg "Connecting to the GIT server...."
  if [[ -d $_gitname ]]; then
	(cd $_gitname && git pull origin)
  else
	git clone $_gitroot $_gitname
  fi
  msg "GIT checkout done"
  msg "Starting make..."
  cd $_gitname
  
  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
