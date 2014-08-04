# Maintainer: Dian Hanifudin Subhi <dhanifudin@gmail.com>
pkgname=elforkane
pkgver=1.2
pkgrel=0
pkgdesc="Koran based on qt"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/elforkane"
license=('GPL3') #To be common
depends=('qt4' 'phonon')
source=("https://build.opensuse.org/source/home:abouzakaria/${pkgname}/${pkgname}_${pkgver}.tar.gz")
md5sums=('b3b09a6ead8e88d79a7197a1fdb4ee0c')

build() {
    cd "${srcdir}/${pkgname}_${pkgver}"
    qmake-qt4 PREFIX=/usr LIB=/usr/lib || return 1
    #qmake-qt4 elforkane.pro || return 1
    make || return 1
}

package() {
    cd "${srcdir}/${pkgname}_${pkgver}"
    make INSTALL_ROOT="${pkgdir}"/ install || return 1
    find "$pkgdir" -type d -print0 | xargs -0 chmod -R 755
    find "$pkgdir" -type f -print0 | xargs -0 chmod -R 644
    chmod 755 "$pkgdir/usr/bin/elforkane"
}
