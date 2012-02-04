# Contributor: marc.weidinger@gmail.com
# Contributor: Tanguy Bouzéloc <the.zauron@gmail.com>
pkgname=eclipse-qt-eclipse-integration
pkgver=1.5.1
pkgrel=1
pkgdesc="Qt Eclipse integration for C++"
arch=('i686' 'x86_64')
url="http://www.qtsoftware.com/developer/eclipse-integration"
license=('LGPL')
depends=('qt=4.5.1' 'eclipse>=3.4' 'eclipse-cdt>=4.0')
makedepends=('apache-ant' 'java-environment')
conflicts=('eclipse-qt4')
_qtver=4.5.1
_qtpkgfqn="qt-x11-opensource-src-${_qtver}"
_qtpkgurl="ftp://ftp.qtsoftware.com/qt/source/${_qtpkgfqn}.tar.bz2"
_qtpkgsum='afc43e566341cf3e5ed0bcb974f0c3b2'
install=${pkgname}.install
[ $CARCH = "i686" ] && {
    source=("http://dist.trolltech.com/developer/download/qt-eclipse-integration-linux.x86-${pkgver}-src.tar.gz" "${_qtpkgurl}")
    md5sums=('b540286381a974355e99ad48a482c395' "${_qtpkgsum}")
    _pltfrm="linux.x86"
} || {
    source=("http://dist.trolltech.com/developer/download/qt-eclipse-integration-linux.x86_64-${pkgver}-src.tar.gz" "${_qtpkgurl}")
    md5sums=('648f35ee4ae0c8044e3d885b2dfc77b1' "${_qtpkgsum}")
    _pltfrm="linux.x86_64"
}


build() {
  _blt=${pkgname:8}-${_pltfrm}-${pkgver}
  cd $srcdir/${_blt}

  export QTDIR=/usr
  export JAVADIR=${JAVA_HOME}
  export ECLIPSEDIR=/usr/share/eclipse

  sed -i 's|\(^.*grep "org\[.\]eclipse\[.\]cdt.*jar".*$\)|#makepkg_edit#\1|' build.sh
  # Ensure $QTDIR does not point to Qt3:
  ${QTDIR}/bin/qmake --version | egrep '[^\.]4' >/dev/null || { 
      echo '$QTDIR might not point to a Qt4 build'; return 1;
  }

  patch com.trolltech.qtcppproject/build.xml ${startdir}/include_dropins.patch || return 1

  # qswt requires designer private headers
  mkdir -p qswt/designer/QtDesigner/private
  cp ${srcdir}/${_qtpkgfqn}/tools/designer/src/lib/shared/*_p.h qswt/designer/QtDesigner/private
 
  ./build.sh || return 1

  mkdir -p ${pkgdir}/${ECLIPSEDIR}/dropins/eclipse 
  cp -R ${srcdir}/${_blt}/eclipse/plugins ${pkgdir}/${ECLIPSEDIR}/dropins/eclipse/.
  cp -R ${srcdir}/${_blt}/eclipse/features ${pkgdir}/${ECLIPSEDIR}/dropins/eclipse/.
  chmod -R +r,go-w ${pkgdir}/${ECLIPSEDIR}/dropins/eclipse/*
  install -m644 -D LICENSE.TXT ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.TXT
}
