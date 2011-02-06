pkgname=pyqwt5
pkgver=5.2.0
pkgrel=1
pkgdesc="Python bindings for the Qwt  C++ class library which extends the Qt framework with widgets for scientific and engineering applications."
arch=("i686" "x86_64")
url="http://pyqwt.sourceforge.net/"
depends=("python>=2.5.0","qt>=4.3.1", "python-numpy>=1.1.0-0", "sip>=4.7.4", "qwt>=5.0.0")
options=('!makeflags')
license=("GPL")
source=("http://puzzle.dl.sourceforge.net/sourceforge/pyqwt/PyQwt-$pkgver.tar.gz")
md5sums=("fcd6c6029090d473dcc9df497516eae7")


build() {
  cd $startdir/src/PyQwt-$pkgver/configure
  # build pyqwt:
  python configure.py -Q ../qwt-5.2 || return 1

  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
