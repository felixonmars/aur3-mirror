# Contributor: _AND_ <and@ebrilo.jp>
license=('unknown')
arch=('i686')
pkgname=modernforex
pkgver=1.1.9
pkgrel=1
pkgdesc="Forex Club trade terminal"
url=http://www.fxclub.org/tools_soft
depends=('qt')
makedepends=('rpmextract' 'sed')
source=(http://download.fxclub.org/Modern/modernforex.rpm)
md5sums=('805c7fc17789037a9d6d64ac00566094')

build() {
cd "${srcdir}"
rpmextract.sh "../modernforex.rpm"
install -d ${pkgdir}/usr/
cp -r ${srcdir}/usr/local/* ${pkgdir}/usr/
install -d ${pkgdir}/usr/share/applications/
sed -e 's/\/usr\/local/\/usr/g' ${pkgdir}/usr/share/apps/modernforex/etc/modern.desktop > ${pkgdir}/usr/share/applications/modern.desktop
}
