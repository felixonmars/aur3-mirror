# Contributor: Filip Graliński <filipg@amu.edu.pl>
# Maintainer: Filip Graliński <filipg@amu.edu.pl>
pkgname=psi-toolkit-git
pkgver=20130201
pkgrel=1
pkgdesc='Natural language processing toolkit'
arch=('i686' 'x86_64')
url='http://mrt.wmi.amu.edu.pl'
license=('GPL3+')
makedepends=('cmake' 'aspell' 'aspell-pl' 'aspell-en' 'link-grammar' 'poppler-glib')
depends=('pcre' 'boost' 'boost-libs' 'swig' 'java-environment' 'cmph' 'graphviz' 'gsfonts' 'log4cpp' 'zsh')
optdepends=('aspell: aspell processor'
            'aspell-ca: aspell processor with --lang ca option'
            'aspell-cs: aspell processor with --lang cs option'
            'aspell-de: aspell processor with --lang de option'
            'aspell-en: aspell processor with --lang en option'
            'aspell-es: aspell processor with --lang es option'
            'aspell-fr: aspell processor with --lang fr option'
            'aspell-hu: aspell processor with --lang hu option'
            'aspell-it: aspell processor with --lang it option'
            'aspell-nl: aspell processor with --lang nl option'
            'aspell-pl: aspell processor with --lang pl option'
            'aspell-pt: aspell processor with --lang pt option'
            'aspell-ru: aspell processor with --lang ru option'
            'aspell-uk: aspell processor with --lang uk option'
            'link-grammar: link-parser processor with --lang en option'
            'poppler-glib: pdf-reader')
replaces=()
provides=()
install=psi-toolkit.install

source=(psi-server psi-server.service)
md5sums=('09d57616d8f5f5024d5a241c54a0abd7'
         '35953e94918dc1aa334364c995276069')

_gitroot="git://mrt.wmi.amu.edu.pl/psi-toolkit.git"
_gitname="psi-toolkit"

build() {
  mkdir -p $pkgdir/etc/rc.d
  cp psi-server $pkgdir/etc/rc.d/

  mkdir -p $pkgdir/usr/lib/systemd/system
  cp psi-server.service $pkgdir/usr/lib/systemd/system

  cd $srcdir
  msg "Connecting to GIT server $_gitroot"
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/build
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build || return 1

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUSE_JAVA=ON -DIS_INSTALLABLE=ON -DPACKAGE_OS_NAME=archlinux CMAKE_BUILD_TYPE=Release ../${_gitname}

  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
