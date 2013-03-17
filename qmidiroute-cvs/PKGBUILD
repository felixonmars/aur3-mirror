# Contributor: Jiri Prochazka <ojirio@gmail.com>
pkgname=qmidiroute-cvs
pkgver=20130317
pkgrel=1
pkgdesc="A filter/router for MIDI events"
arch=('i686' 'x86_64')
url="http://alsamodular.sourceforge.net/"
license=('GPL')
depends=('alsa-lib' 'qt4')
makedepends=('cvs')
source=()
md5sums=()
conflicts=('qmidiroute')

_cvsroot=":pserver:anonymous@alsamodular.cvs.sourceforge.net:/cvsroot"
_cvsmod="qmidiroute"

build() {
  cd $srcdir
  if [ -d ${_cvsmod}/CVS ]; then
    cd ${_cvsmod}
    cvs -q update -dA
  else
    cvs -q -z3 -d${_cvsroot}/alsamodular co ${_cvsmod}
    cd ${_cvsmod}
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_cvsmod}-build"
  cp -r "${srcdir}/${_cvsmod}" "${srcdir}/${_cvsmod}-build"
  cd "${srcdir}/${_cvsmod}-build"

  autoreconf -i
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  # Install .desktop and icon
  install -D -m644 src/pixmaps/qmidiroute_48.xpm $pkgdir/usr/share/pixmaps/qmidiroute_48.xpm

  # Install doc
  mkdir -p ${pkgdir}/usr/share/doc/$pkgname
  install -m644 {ChangeLog,NEWS,README,TODO} ${pkgdir}/usr/share/doc/$pkgname

}

