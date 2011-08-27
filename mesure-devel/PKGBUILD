# Contributor: Andreas Wagner <A dot Wagner at stud dot uni-frankfurt dot de>

pkgname=mesure-devel
pkgver=3
pkgrel=1
pkgdesc="This tool allows to mesure how a file grows, network transfer, disk free, memory usage, stdin flux, etc. \
	 It supports ETA and progressbar output too. (Current Development Snapshot)"
arch=('i686' 'x86_64')
url="http://nopcode.org/blog/mesure.html"
license="GPL"
depends=(gmp libpcap)
makedepends=(coreutils tar mercurial)
provides=(mesure)
conflicts=(mesure)
options=(docs)
source=()
md5sums=()

_hgroot="http://hg.youterm.com/"
_hgrepo="mesure"

build() {
  cd ${startdir}/src/

  [ -d ${_hgrepo}-build ] && rm -rf ${_hgrepo}-build

  if [ -d ${_hgrepo} ]; then
    cd ${_hgrepo} 
    if hg verify ; then
	cd ${startdir}/src/${_hgrepo}
	msg "Starting pull..."
	hg pull -u || return 1
    else
	cd ..
	msg "Starting clone..."
	hg clone ${_hgroot}${_hgrepo} || return 1
	cd ${startdir}/src/${_hgrepo}
    fi
  else
    msg "Starting clone..."
    hg clone ${_hgroot}${_hgrepo} || return 1
    cd ${startdir}/src/${_hgrepo}
  fi
  msg "Mercurial checkout done or server timeout"

  cp -a ${startdir}/src/${_hgrepo} ${startdir}/src/${_hgrepo}-build
  cd ${startdir}/src/${_hgrepo}-build

  ./configure --prefix=/usr --install=/bin/install || return 1
  make || return 1

  install -D -s     src/mesure      $startdir/pkg/usr/bin/mesure
  install -D -m 644 doc/mesure.1    $startdir/pkg/usr/share/man/man1/mesure.1
  install -D -m 644 doc/mesure.txt  $startdir/pkg/usr/share/doc/mesure/mesure.txt
  install -D -m 755 doc/mesure.wmii $startdir/pkg/usr/share/doc/mesure/mesure.wmii
}


# vim:set ts=2 sw=2 et:
