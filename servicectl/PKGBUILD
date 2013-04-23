# Contributor: Alexander Sobolevkiy <smak.nsk@gmail.com>

pkgname=servicectl
pkgver=1.0
pkgrel=1
pkgdesc="Control daemons for systemd in chroot environment"
arch=('i686' 'x86_64')
url="https://github.com/smaknsk/servicectl"
license=('GPL')
depends=('systemd')
source=("https://github.com/smaknsk/servicectl/archive/${pkgver}.tar.gz")
md5sums=('31f370ee73c9f1839cab8b54170a39c4')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    
    mkdir -p "${pkgdir}/usr/lib/servicectl/enabled" || return 1
    install -D -m 755 servicectl "${pkgdir}/usr/lib/servicectl/servicectl" || return 1
    install -D -m 755 serviced "${pkgdir}/usr/lib/servicectl/serviced" || return 1
    cp {README.md,README_ru.md} "${pkgdir}/usr/lib/servicectl/" || return 1

    mkdir -p "${pkgdir}/usr/bin" || return 1
    ln -s "/usr/lib/servicectl/servicectl" "${pkgdir}/usr/bin/servicectl" || return 1
    ln -s "/usr/lib/servicectl/serviced" "${pkgdir}/usr/bin/serviced" || return 1
}