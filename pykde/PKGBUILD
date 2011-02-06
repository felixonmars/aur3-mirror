# Contributor: Angel 'angvp' Velasquez <angvp[at]archlinux.com.ve> 
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=pykde
pkgver=3.16.7
pkgrel=1
pkgdesc="A set of Python bindings for the KDE desktop environment."
arch=('i686' 'x86_64')
url="http://riverbankcomputing.co.uk/software/pykde/download3"
license=('GPL')
depends=('sip' 'qscintilla-qt3' 'kdelibs3' 'pyqt3')
install=pykde.install
source=(http://www.riverbankcomputing.com/static/Downloads/PyKDE3/PyKDE-$pkgver.tar.bz2)
md5sums=('745562f0c06948c2fcb56a83c37dab9c')

build() {
  cd $srcdir/PyKDE-$pkgver
  [ "${CARCH}" = "x86_64" ] && touch kdecore/sipdcopQValueList.h
  python configure.py -i -k /opt/kde -o /opt/kde/include || return 1
  make || return 1 
  make DESTDIR=$pkgdir install || return 1 
}
