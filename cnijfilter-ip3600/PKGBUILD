# Maintainer: Florian Walch <florian.walch@gmx.at>
# Based on cnijfilter-mp540 package
pkgname=cnijfilter-ip3600
pkgver=3.00
pkgrel=2
pkgdesc="Canon printer driver for Pixma ip3600"
url="http://software.canon-europe.com/software/0031332.asp"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-sqlite3' 'lib32-gtk2' 'lib32-libcups' 'lib32-popt' 'cnijfilter-common' 'lib32-libpng12' 'lib32-krb5' 'ghostscript')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('sqlite3' 'gtk2' 'libcups' 'popt' 'cnijfilter-common' 'libpng12' 'krb5' 'ghostscript')
fi
makedepends=('rpmextract')
source=(http://files.canon-europe.com/files/soft31332/software/iP3600_RPM_printer.tar)
md5sums=('bdcbf20cea9da1c2f22cbae147be88ea')

build() {
  cd ${srcdir}
  install -d ${pkgdir}
  tar -xf iP3600_RPM_printer.tar
  rpmextract.sh ${pkgname}series-${pkgver}-1.i386.rpm
  mv "usr" ${pkgdir}

  cd "$pkgdir"
  msg "Moving from /usr/local to /usr"
  mv usr/local/share/* usr/share/
  rmdir usr/local/share/
  mv usr/local/* usr/
  rmdir usr/local/

  mkdir -p usr/share/licenses/${pkgname}
  mv usr/share/doc/${pkgname}series-${pkgver}/* usr/share/licenses/${pkgname}
  rm -rf usr/share/doc
}

