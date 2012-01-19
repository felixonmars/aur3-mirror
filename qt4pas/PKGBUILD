# Submitter: Fabien Wang <fabien(dot)wang(at)gmail(dot)com>
# Maintainer: Fabien Wang <fabien(dot)wang(at)gmail(dot)com>

pkgname=qt4pas
pkgver=2.5
pkgrel=1
pkgdesc="Free Pascal Qt4 Binding Library"
arch=('i686' 'x86_64')
url="http://users.telenet.be/Jan.Van.hijfte/qtforfpc/fpcqt4.html"
license=('LGPL')
depends=('qt' 'qtwebkit')
source=(http://users.telenet.be/Jan.Van.hijfte/qtforfpc/V2.5/qt4pas-V2.5_Qt4.5.3.tar.gz)
md5sums=('8249bc17e4167e077d22c7f5fb118bb2')

build()
{
  cd ${srcdir}/qt4pas-V2.5_Qt4.5.3/

	sed -ie "s:target\.path = :target\.path = ${pkgdir}:g" Qt4Pas.pro

  qmake -query
  qmake
  make
  make install

	ln -s ${pkgdir}/usr/lib/libQt4Pas.so.5.2.5 ${pkgdir}/usr/lib/libqt4intf.so
  ln -s ${pkgdir}/usr/lib/libQt4Pas.so.5.2.5 ${pkgdir}/usr/lib/libqt4intf.so.5
  ln -s ${pkgdir}/usr/lib/libQt4Pas.so.5.2.5 ${pkgdir}/usr/lib/libqt4intf.so.5.2
  ln -s ${pkgdir}/usr/lib/libQt4Pas.so.5.2.5 ${pkgdir}/usr/lib/libqt4intf.so.5.2.1
  ln -s ${pkgdir}/usr/lib/libQt4Pas.so.5.2.5 ${pkgdir}/usr/lib/libqt4intf.so.5.2.5
}
