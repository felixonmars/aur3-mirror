# Mantainer: William Díaz <wdiaz [at] archlinux [dot] us>
# Contributor: Matias Korhonen <webadmin@draco-vulgaris.net>
# Contributor: Eric Le Bras <eric.lebras@gmail.com>
# Contributor: Jeroen Op 't Eynde <jeroen [at] xprsyrslf [dot] be>

pkgname=cnijfilter-common-old
_pkgname=cnijfilter-common
pkgver=2.80
pkgrel=3
pkgdesc="An older version of the Canon IJ Printer Driver (Common package)"
url="http://support-my.canon-asia.com/contents/MY/EN/0100159804.html"
arch=('i686' 'x86_64')
license=('custom')
if [ "${CARCH}" = 'x86_64' ]; then
  depends=('lib32-libcups' 'lib32-popt')
elif [ "${CARCH}" = 'i686' ]; then
  depends=('libcups' 'popt')
fi
makedepends=('rpmextract')
source=(http://software.canon-europe.com/files/soft28477/software/${_pkgname}-${pkgver}-1.i386.rpm)
md5sums=('a6b97bf57bd823f21118c0ee65f336d6')

build() {
  cd ${srcdir}
  rpmextract.sh ${_pkgname}-${pkgver}-1.i386.rpm
  chmod -R 755 usr/lib usr/local
  mv usr ${pkgdir}
}
