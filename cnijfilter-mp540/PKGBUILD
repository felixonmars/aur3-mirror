pkgname=cnijfilter-mp540
_pkgname=cnijfilter
pkgver=3.00
pkgrel=7
pkgdesc="Canon Printer Driver (For Multifunction MP540)"
url="http://software.canon-europe.com/products/0010641.asp"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-sqlite3' 'lib32-gtk2' 'lib32-libcups' 'lib32-popt' 'cnijfilter-common' 'lib32-libpng12' 'lib32-heimdal' 'ghostscript')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('sqlite3' 'gtk2' 'libcups' 'popt' 'cnijfilter-common' 'libpng12' 'heimdal' 'ghostscript')
fi
makedepends=('rpmextract')
source=(http://files.canon-europe.com/files/soft31329/software/MP540_RPM_drivers.tar)
md5sums=('a4b9d98fd1269668254a0f70181bdba9')

build() {
  cd ${srcdir}
  install -d ${pkgdir}
  tar -xf MP540_RPM_printer.tar
  rpmextract.sh ${_pkgname}-mp540series-${pkgver}-1.i386.rpm
  mv "usr" ${pkgdir}

  cd "$pkgdir"
  msg "Moving from /usr/local to /usr"
  mv usr/local/share/* usr/share/
  rmdir usr/local/share/
  mv usr/local/* usr/
  rmdir usr/local/
}
