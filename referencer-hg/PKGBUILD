# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>

pkgname=referencer-hg
pkgver=900
pkgrel=3
pkgdesc="a Gnome application to organise documents or references, and \
         ultimately generate a BibTeX bibliography file"
arch=('i686' 'x86_64')
url="http://icculus.org/referencer/index.html"
license="GPL"
makedepends=('autoconf' 'automake' 'pkgconfig' 'glib2' 'intltool' \
	'mercurial' 'gnome-common' 'gnome-doc-utils')
depends=('poppler-glib' 'boost' 'libgnomeuimm' 'python2>=2.5')
conflicts=('referencer' 'referencer-svn')
replaces=referencer-svn
provides=referencer
install=referencer.install
source=("https://bugs.launchpad.net/referencer/+bug/661503/+attachment/1695637/+files/referencer-poppler-0.15.patch")
md5sums=()

_hgroot="http://hg.icculus.org/jcspray"
_hgrepo="referencer"

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

#  msg "Patching for python2..."
#  patch -p0 < ../python2.diff

  msg "Patching for poppler>=0.15"
  patch -p0 < ../referencer-poppler-0.15.patch

  msg "Starting autogen.sh..."
  ./autogen.sh --prefix="/usr" --disable-update-mime-database
  PYTHON="/usr/bin/python2" ./configure --prefix="/usr" --disable-update-mime-database \
    --enable-python
  sed -i 's|$(MAKE) $(AM_MAKEFLAGS) install-data-hook||' data/Makefile
  make || return 1
  make DESTDIR=${startdir}/pkg/ install
}
md5sums=('372091c5fee8b2e183c6abaf5ac0727d')
