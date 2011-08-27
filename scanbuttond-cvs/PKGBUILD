# Contributor: Andrwe Lord Weber <lord-andrwe-weber at renona-studios.org>

pkgname=scanbuttond-cvs
pkgver=20100708
pkgrel=2
pkgdesc="allows you to configure actions for scanner buttons (incl. opticslim 2400(+) patch)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/scanbuttond/"
license=('GPL')
makedepends=('cvs')
conflicts=('scanbuttond')
backup=('etc/scanbuttond/buttonpressed.sh' 'etc/scanbuttond/initscanner.sh')
install=scanbuttond.install
source=(scanbuttond_gt68xxPlustekBackend.patch)
md5sums=('9dc98ffbfae5cd9c78a310396fa0c00f')

_cvsroot="anonymous:@scanbuttond.cvs.sourceforge.net:/cvsroot/scanbuttond"
_cvsmod="scanbuttond"

build() {
  cd "${srcdir}"

	if [ -d "${_cvsmod}/CVS" ]
	then
		msg "Starting CVS update ..."
		cd "${_cvsmod}"
		cvs -z3 update -d
		msg "... updating finished."
	else
		msg "Starting CVS checkout ..."
	  cvs -z3 -f -d:pserver:${_cvsroot} co ${_cvsmod}
		msg "... checkout finished."
    cd ${_cvsmod}
	fi

	if [ -e "${srcdir}/${_cvsmod}-build" ]
	then
		rm -rf "${srcdir}/${_cvsmod}-build"
	fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  cp -r "${srcdir}/${_cvsmod}" "${srcdir}/${_cvsmod}-build"
  cd "${srcdir}/${_cvsmod}"-build

	aclocal
	autoconf
	autoheader
	libtoolize
	automake -a
	automake

  ./configure --prefix=/usr \
    --sysconfdir=/etc
	patch -Np 1 -i ${srcdir}/*.patch

  make || return 1
  make DESTDIR="${pkgdir}" install
	mv ${pkgdir}/etc/scanbuttond/buttonpressed.sh.example ${pkgdir}/etc/scanbuttond/buttonpressed.sh
	mv ${pkgdir}/etc/scanbuttond/initscanner.sh.example ${pkgdir}/etc/scanbuttond/initscanner.sh
	msg "make finished."
}
