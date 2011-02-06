# Maintainer: Davidov Denis <mail@tux.nsk.ru>

pkgname=qserialport-git
pkgver=20101203
pkgrel=1
pkgdesc="A high performance cross platform serial library based on the QIODevice class from the Qt framework"
arch=('i686' 'x86_64')
url="http://gitorious.org/inbiza-labs/qserialport"
license=('GPL')
depends=(qt)
makedepends=('git')
provides=('qserialport')
_gitroot='git://gitorious.org/inbiza-labs/qserialport.git'
_gitname='qserialport'

build() {
  cd ${srcdir}
  git clone ${_gitroot}
  cd ${_gitname}
  ./configure #--prefix=/usr don't working
  make || return 1
  #make DESTDIR=${pkgdir} install || return 1
  # manual install
  install -Dm644 ${srcdir}/${_gitname}/include/QtSerialPort/qportsettings.h \
	${pkgdir}/usr/include/QtSerialPort/qportsettings.h
  install -Dm644 ${srcdir}/${_gitname}/include/QtSerialPort/qserialport_export.h \
	${pkgdir}/usr/include/QtSerialPort/qserialport_export.h
  install -Dm644 ${srcdir}/${_gitname}/include/QtSerialPort/qserialport.h \
	${pkgdir}/usr/include/QtSerialPort/qserialport.h
  install -Dm644 ${srcdir}/${_gitname}/include/QtSerialPort/qserialportnative.h \
	${pkgdir}/usr/include/QtSerialPort/qserialportnative.h
  install -Dm644 ${srcdir}/${_gitname}/include/QtSerialPort/QSerialPort \
	${pkgdir}/usr/include/QtSerialPort/QSerialPort

  install -Dm755 ${srcdir}/${_gitname}/lib/libQtSerialPort.debug.so.1.0.0 \
	${pkgdir}/usr/lib/libQtSerialPort.debug.so.1.0.0
  install -Dm755 ${srcdir}/${_gitname}/lib/libQtSerialPort.so.1.0.0 \
	${pkgdir}/usr/lib/libQtSerialPort.so.1.0.0
  cd ${pkgdir}/usr/lib/
  ln -s libQtSerialPort.debug.so.1.0.0 libQtSerialPort.debug.so.1.0
  ln -s libQtSerialPort.debug.so.1.0.0 libQtSerialPort.debug.so.1
  ln -s libQtSerialPort.debug.so.1.0.0 libQtSerialPort.debug.so
  ln -s libQtSerialPort.so.1.0.0 libQtSerialPort.so.1.0
  ln -s libQtSerialPort.so.1.0.0 libQtSerialPort.so.1
  ln -s libQtSerialPort.so.1.0.0 libQtSerialPort.so
  
}

