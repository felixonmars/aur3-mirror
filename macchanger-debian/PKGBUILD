# Maintainer: x33a

pkgname=macchanger-debian
pkgver=1.5.0
pkgrel=9
pkgdesc="A utility for manipulating the MAC address of network interfaces (with debian patches)"
arch=('any')
url="http://www.alobbs.com/macchanger"
depends=('glibc')
conflicts=('macchanger')
license=('GPL')
_pkgname="macchanger"

source=("ftp://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "01-fix_manpage.patch"
        "02-fix_usage_message.patch"
        "03-fix_random_seed.patch"
        "04-fix_exit_code.patch"
        "05-fix_spelling_error.patch"
        "06-update_OUI_list.patch"
        "07-implement_reset_to_permanent_MAC.patch"
        "08-fix_random_MAC_choice.patch"
        "09-change_default_behaviour.patch")

md5sums=('79b7cdaeca3d8ebafa764c4b0dd03ab7'
         'aa675ea8ff4e6283e1c396e21fc92229'
         '84d5274ea7de053459dd3c438bc91203'
         '446fa21b41e6e34d16a288d41ce56b9d'
         '8debcd0e510eeb83d12fe1d8f8ca1b0d'
         'afd6af51772d215d5b6332d170c9e851'
         'c62e517b396a9c6783ba36fd9b021765'
         '7fb0c401487fd3c2eb355863bbe6b888'
         'c22d46e5d1316875c5e9fad84e9259b6'
         '52c80e9ce66a5e20a0b87595777f53f3')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    patch -p1 -i "../01-fix_manpage.patch"
    patch -p1 -i "../02-fix_usage_message.patch"
    patch -p1 -i "../03-fix_random_seed.patch"
    patch -p1 -i "../04-fix_exit_code.patch"
    patch -p1 -i "../05-fix_spelling_error.patch"
    patch -p1 -i "../06-update_OUI_list.patch"
    patch -p1 -i "../07-implement_reset_to_permanent_MAC.patch"
    patch -p1 -i "../08-fix_random_MAC_choice.patch"
    patch -p1 -i "../09-change_default_behaviour.patch"

    ./configure --prefix=/usr \
                --mandir=/usr/share/man \
                --infodir=/usr/share/info

    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    make DESTDIR=${pkgdir} install
}
