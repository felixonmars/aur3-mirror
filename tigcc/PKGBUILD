# Contributor: slubman <slubman@slubman.net>
# Contributor: hardfalcon <hardfalcon@gpfclan.net>
# Maintainer: Laszlo Papp <djszapi at gmail com>

pkgname=tigcc
pkgver=0.96b8
pkgrel=6
pkgdesc="C compiler for the Texas Instruments TI-89, TI-89 Titanium, TI-92 Plus and Voyage 200 calculators"
url=http://tigcc.ticalc.org
license=(GPL2)
arch=(i686 x86_64)
options=(!emptydirs !libtool !strip)
source=($url/linux/tigcc_src.tar.bz2
    tigcc.sh)
sha256sums=('e8bccad2c887f91f4d6ab79f4ebef467a7173f9d77fbad20377699246915fcd3'
    '92530a7f2ca936c3e83e1b03a21b0d06d9a88507e103f89fdc953f683b1781ce')
sha512sums=('e28415b309b73fa949fe9f0224239f07e62136e93c4d8fe98ad2fe32a99475620092c9317bfdd098d37a2a1dfb826c2f6fd23ab26fdcc444650dc66643cfb0e7'
    'ab9a61f9e193267905ed8c6032cd83dfc51f673ec67d57723a4d6d81a01ddf611eb7386c451e7185ef7ce19716713b8bbfd8d6153ddceadd9ea95f1913770848')

prepare() {
    sed -i 's:\./launch\.envreg::' scripts/Install_step_2
}

package() {
    export TIGCC="$pkgdir"/usr/share/$pkgname/
    install -d "$TIGCC"/{bin,include/asm}

    cd scripts/
    ./Install_All_nopatch

    cd "$pkgdir"/usr/
    install -d bin/
    cd bin/
    for i in "$TIGCC"/bin/*; do
        ln -s /usr/share/$pkgname/bin/$(basename $i)
    done
}
