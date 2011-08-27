pkgname="pdd-by-hg"
pkgver=28
pkgrel=1
pkgdesc="Road rules frontend for Belarus"
arch=('i686' 'x86_64')
url="http://code.google.com/p/pdd-by/"
license=('GPL')
makedepends=('cmake')
depends=('libyaml')
_hgroot=https://pdd-by.googlecode.com/hg
_hgrepo=pdd-by

build() {
    cd $srcdir

      if [ -d ${_hgrepo} ]; then
          cd ${startdir}/src/${_hgrepo}
          hg pull -u
      else
          hg clone ${_hgroot} ${_hgrepo} || return 1
          cd ${startdir}/src/${_hgrepo}
      fi

    msg "Mercurial clone done or server timeout"
    msg "Starting make..."

    [ ! -d $srcdir/${_hgrepo}-build ] && mkdir $srcdir/${_hgrepo}-build
    cp -ar $srcdir/$_hgrepo/* $srcdir/${_hgrepo}-build
    cd $srcdir/${_hgrepo}-build

    cmake -DCMAKE_INSTALL_PREFIX="/usr" -G "Unix Makefiles"
    make
    make DESTDIR=${pkgdir} install 
}
