# Maintainer: Albert Chang <albert.chang@gmx.com>
pkgname=smixer
pkgver=1.0.4
pkgrel=1
pkgdesc='command-line and scriptable program to control and display the mixer volume levels on a sound card in linux.'
arch=('i686' 'x86_64')
url='http://centerclick.org/programs/smixer'
license=('GPL2')

source=("${pkgname}${pkgver}.tgz"::"$url/${pkgname}${pkgver}.tgz")
md5sums=('edfcf1abcc8562491cea3007588ecd41')

package() {
    cd ${srcdir}/${pkgname}

    make || return 1
    install -o root -g root -Dm0755 smixer ${pkgdir}/usr/bin/smixer
    install -o root -g root -Dm0644 man/smixer.1 ${pkgdir}/usr/share/man/man1/smixer.1
    install -o root -g root -Dm0644 smixer.conf ${pkgdir}/etc/smixer.conf
}
