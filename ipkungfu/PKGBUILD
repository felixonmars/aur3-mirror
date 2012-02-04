# Contributor: Cervesato Andrea <sawk.ita@gmail.com>
#Maintainer: Nathan O <ndowens.aur at gmail dot com>

pkgname=ipkungfu
pkgver=0.6.1
pkgrel=3
pkgdesc="iptables firewall script"
arch=('i686' 'x86_64')
url="http://www.linuxkungfu.org/"
license=('GPL')
install="${pkgname}.install"
depends=('iptables' 'bash' 'sh')
source=(http://www.linuxkungfu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('89f6bc0df356dd4ee650882c54ec9074')

build() {
        cd ${srcdir}/${pkgname}-${pkgver}
        install -d ${pkgdir}/etc/${pkgname}/
        ./configure --prefix=/usr
        make 
        make DESTDIR=${pkgdir} install
        install -Dm 644 files/conf/*.conf ${pkgdir}/etc/${pkgname}/
}
