# Maintainer: Janhouse <janis.jansons@janhouse.lv>

pkgname=dsd-git
pkgver=1.4.1.4
pkgrel=1
pkgdesc="Decoder for P25, ProVoice, X2-TDMA, DMR/MOTOTRBO, NXDN"
arch=('i686' 'x86_64')
url="https://github.com/szechyjs/dsd"
license=('custom:copyright')
depends=('glibc' 'mbelib-git')
optdepends=()
provides=('dsd')

_gitname=dsd
_gitroot="git@github.com:szechyjs/${_gitname}.git"

pkgver () {
  cd "$srcdir"
  if [ -d $_gitname ] ; then
    cd $_gitname
    git describe |sed 's/-[^-]*$//;s/^v//;s/-/./g'
  fi
}

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

  cd "$srcdir"
  if [ -d $_gitname-build ] ; then
    rm -rf "$_gitname-build"
  fi

  mkdir "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr "$srcdir/$_gitname"
  make

}

package() {
    cd "$srcdir/$_gitname-build"
    make DESTDIR="$pkgdir" install   
    cd "$srcdir/$_gitname"
    install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
    install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/$pkgname.txt"
}
