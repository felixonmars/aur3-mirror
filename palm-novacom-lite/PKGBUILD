# Contributor: Ryan Corder <ryanc@greengrey.org>
# Contributor: ava1ar <mail(dot)avatar(at)gmail(dot)com>
# Maintainer: Viliam Pucik <viliam.pucik@gmail.com>

pkgname=palm-novacom-lite
_pkgname=palm-novacom
pkgver=1.0.80
pkgrel=4
pkgdesc="Palm's Novacom terminal to connect your Palm with PC."
url="http://developer.palm.com/index.php"
arch=('i686' 'x86_64')
license=('unknown')
conflicts=('palm-novacom')

# novacomd does not run correctly with default Arch Linux (lib32-)libusb
if [[ "${CARCH}" = "x86_64" ]]; then
    source=(https://cdn.downloads.palm.com/sdkdownloads/3.0.5.676/sdkBinaries/${_pkgname}_${pkgver}_amd64.deb
            http://mirror.ovh.net/ubuntu/pool/main/libu/libusb/libusb-0.1-4_0.1.12-20_amd64.deb
            'novacomd'
            'novacomd-conf.d'
            'novacomd.service')
    noextract=(${_pkgname}_${pkgver}_amd64.deb libusb-0.1-4_0.1.12-20_amd64.deb)
    md5sums=('1719e8c6705b93498fdc7110c4a73ccf'
             'f4e26f69edf4680c779bb0c61f5379f7'
             '7ecd8e531308e741ad9d246510c8da64'
             '832509ecd145b9b93a291f9ad668f0e4'
             'f940cbd87db0de4bdcad1dafdf057bcb')
else
    source=(https://cdn.downloads.palm.com/sdkdownloads/3.0.5.676/sdkBinaries/${_pkgname}_${pkgver}_i386.deb
            http://mirror.ovh.net/ubuntu/pool/main/libu/libusb/libusb-0.1-4_0.1.12-20_i386.deb
            'novacomd'
            'novacomd-conf.d'
            'novacomd.service')
    noextract=(${_pkgname}_${pkgver}_i386.deb libusb-0.1-4_0.1.12-20_i386.deb)
    md5sums=('ef4414ec70ec3a08308692d152960381'
             '111266b044c0b3043a8bf14668657e7f'
             '7ecd8e531308e741ad9d246510c8da64'
             '832509ecd145b9b93a291f9ad668f0e4'
             'f940cbd87db0de4bdcad1dafdf057bcb')
fi

build() {
    cd "${srcdir}"

    install -Dm 0755 "${srcdir}"/novacomd         "${pkgdir}"/etc/rc.d/novacomd
    install -Dm 0644 "${srcdir}"/novacomd-conf.d  "${pkgdir}"/etc/conf.d/novacomd
    install -Dm 0644 "${srcdir}"/novacomd.service "${pkgdir}"/usr/lib/systemd/system/novacomd.service

    ar x ${_pkgname}_${pkgver}_*.deb
    tar zxvf data.tar.gz -C "${srcdir}"
    install -dm 0755 -p "${pkgdir}"/opt/Palm/novacom
    install -m  0755 "${srcdir}"/opt/Palm/novacom/novacom  "${pkgdir}"/opt/Palm/novacom
    install -m  0755 "${srcdir}"/opt/Palm/novacom/novacomd "${pkgdir}"/opt/Palm/novacom
    install -m  0755 "${srcdir}"/opt/Palm/novacom/novaterm "${pkgdir}"/opt/Palm/novacom
    install -dm 0755 -p "${pkgdir}"/usr/bin
    ln -s /opt/Palm/novacom/novacom "${pkgdir}"/usr/bin/novacom
    ln -s /opt/Palm/novacom/novacomd "${pkgdir}"/usr/bin/novacomd
    ln -s /opt/Palm/novacom/novaterm "${pkgdir}"/usr/bin/novaterm

    ar x libusb-0.1-4*.deb
    tar zxvf data.tar.gz -C "${srcdir}"
    install -m  0644 "${srcdir}"/lib/*-linux-gnu/libusb-0.1.so.4.4.4    "${pkgdir}"/opt/Palm/novacom/libusb-0.1.so.4
}

