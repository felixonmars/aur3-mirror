# Maintainer: Nikita Mikhailov <nslqqq@gmail.com>
# Contributor: Trashman trashman@ya.ru
license=('unknown')
arch=('i686' 'x86_64')
pkgname=rumus2
pkgver=1.7.0
pkgrel=2
pkgdesc="Forex Club trade terminal"
url=http://www.fxclub.org/tools_soft
depends=('qt4' 'qtwebkit')
makedepends=('rpmextract' 'sed')
source=(http://download.fxclub.org/Rumus2/FxClub/Rumus2.rpm)
md5sums=('30108774646df3684712e0b109270225')

build() {
    cd "${srcdir}"
    rpmextract.sh "../Rumus2.rpm"
}

package() {
    cd "${srcdir}"
    install -d ${pkgdir}/usr/
    cp -r ${srcdir}/usr/local/* ${pkgdir}/usr/
    install -d ${pkgdir}/usr/share/applications/
    sed -e 's/\/usr\/local/\/usr/g' ${pkgdir}/usr/share/apps/rumus2/etc/rumus2.desktop > ${pkgdir}/usr/share/applications/rumus2.desktop
}
