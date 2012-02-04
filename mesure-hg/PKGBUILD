# Contributor: Andreas Wagner <A dot Wagner at stud dot uni-frankfurt dot de>

pkgname=mesure-hg
pkgver=4
pkgrel=1
pkgdesc="This tool allows to mesure how a file grows, network transfer, disk free, memory usage, stdin flux, etc. \
	 It supports ETA and progressbar output too. (Current Development Snapshot)"
arch=('i686' 'x86_64')
url="http://nopcode.org/blog/mesure.html"
license="GPL"
depends=(gmp libpcap)
makedepends=(coreutils tar mercurial)
provides=(mesure)
conflicts=(mesure mesure-devel)
options=(docs)
source=()
md5sums=()

_hgroot="http://hg.youterm.com/"
_hgrepo="mesure"

build() {
  cd $srcdir/

  [ -d ${_hgrepo}-build ] && rm -rf ${_hgrepo}-build

  if [ -d ${_hgrepo} ]; then
    cd ${_hgrepo} 
    if hg verify ; then
	cd $srcdir/${_hgrepo}
	msg "Starting pull..."
	hg pull -u || return 1
    else
	cd ..
	msg "Starting clone..."
	hg clone ${_hgroot}${_hgrepo} || return 1
	cd $srcdir/${_hgrepo}
    fi
  else
    msg "Starting clone..."
    hg clone ${_hgroot}${_hgrepo} || return 1
    cd $srcdir${_hgrepo}
  fi
  msg "Mercurial checkout done or server timeout"

  cp -a $srcdir/${_hgrepo} $srcdir/${_hgrepo}-build
  cd $srcdir/${_hgrepo}-build

  ./configure --prefix=/usr --install=/bin/install || return 1
  make || return 1

  install -D -s     src/mesure      $pkgdir/usr/bin/mesure
  install -D -m 644 doc/mesure.1    $pkgdir/usr/share/man/man1/mesure.1
  install -D -m 644 doc/mesure.txt  $pkgdir/usr/share/doc/mesure/mesure.txt
  install -D -m 755 doc/mesure.wmii $pkgdir/usr/share/doc/mesure/mesure.wmii
}


# vim:set ts=2 sw=2 et:
