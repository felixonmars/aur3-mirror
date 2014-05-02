# Maintainer: Periklis Ntanasis <pntanasis@gmail.com>

pkgname="pavuk-cvs"
pkgver=20140501
pkgrel=1
pkgdesc="A multifunctional open source web grabber"
arch=('i686' 'x86_64')
url="http://pavuk.sourceforge.net/"
license=('custom')
depends=('libxmu' 'gtk2')
makedepends=('cvs')
source=()
md5sums=()
conflicts=('pavuk')
provides=('pavuk')

_cvsroot="anonymous@pavuk.cvs.sourceforge.net:/cvsroot/pavuk "
_cvsmod="pavuk"

pkgver() {
  date +%Y%m%d
}

prepare() {
	cd "${srcdir}"  
  
	if [ -d "${_cvsmod}/CVS" ]
	then
		msg "Starting CVS update ..."
		cd "${_cvsmod}"
		cvs -z3 update -d
		msg "... updating finished."
	else
		msg "Starting CVS checkout ..."
	  cvs -z3 -f -d:pserver:${_cvsroot} co "${_cvsmod}"
		msg "... checkout finished."
    cd "${_cvsmod}"
	fi

	if [ -e "${srcdir}/${_cvsmod}-build" ]
	then
		rm -rf "${srcdir}/${_cvsmod}-build"
	fi

  msg "CVS checkout done or server timeout"
  
  cd "${srcdir}/${_cvsmod}"
  ./bootstrap
  CFLAGS="-march=native -mtune=generic -O2 -pipe -fstack-protector --param=ssp-buffer-size=4"
  echo '#! /bin/sh' > /tmp/pavuk-cvs-tmp-file
  echo 'LIBS="-lX11"' >> /tmp/pavuk-cvs-tmp-file
  cat configure >> /tmp/pavuk-cvs-tmp-file
  mv /tmp/pavuk-cvs-tmp-file configure
  chmod +x configure
  ./configure --prefix=/usr --enable-threads --disable-docbook
}

build() {
  cd "${srcdir}/${_cvsmod}"
  make
}

package() {
  cd "${srcdir}/${_cvsmod}"
  make DESTDIR="${pkgdir}/" install
  install -Dm0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
  cd "${srcdir}/${_cvsmod}/doc"
  install -Dm0644 Pavuk.ManPage.html "${pkgdir}/usr/share/doc/${pkgname}/manpage.html" 
}
