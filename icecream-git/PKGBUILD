# Maintainer: Sergio Correia <sergio@correia.cc>
# Contributor: Isaac C. Aronson <isaac@pingas.org>

pkgname='icecream-git'
_pkgname='icecream'
pkgver=0.9.98.r145.g51fc506
pkgrel=1
pkgdesc='Distributed compiler with a central scheduler to share build load.'
url='https://github.com/icecc/icecream'
license=('GPL')
depends=('gcc-libs' 'bash' 'libcap-ng')
provides=('icecream' 'icecream1')
optdepends=('iceberg-git: Fork of Icemon, an Icecc monitor.')
conflicts=('icecream1' 'icecream')
backup=('etc/icecream.conf')
arch=('i686' 'x86_64')
options=('!libtool')
install='icecream.install'
source=('git://github.com/icecc/icecream.git'
        'icecream.conf'
        'icecream-git.conf'
        'icecream.service'
        'icecream-scheduler.service'
        'icecreamd'
        'icecream-schedulerd'
        'remove-doc-subdir-from-makefile.patch')
sha256sums=('SKIP'
            'a170a26e8e12181bf491cfc238e60158088b660ce6139faca502a400365a3632'
            '2221f16c3293dfd86e4d0442745b104380a4a1623ca3c9eb6bfe5771552fac65'
            '538797a229695d4c36e83c78c712b300bbc294238ec7964f427a73ecdf23aadc'
            '81a549dcf071cef98ea8a0fdab1aee0686555eb3c67c709a9d90c1e2c9e4b685'
            '856d030d509aa9cdb8ac05a4dc0b18574359f1fc2feea3fdffb3029b026909a0'
            '4790b717b762aead2fc21f0ac2ce62d0d0c31ad5a80b606d2bddd707cb2d44a4'
            '4eed4d9165e74cb847c3c59dd18b60c7e81f770ef04cf1eb97876a27943c63c2')

pkgver() {
    cd "${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/-/.r/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    patch -uNp1 -i ../remove-doc-subdir-from-makefile.patch
}

build() {
    cd "${_pkgname}"
    ./autogen.sh
    ./configure --prefix=/usr/lib/icecream --enable-shared --disable-static --without-man
    make
}

package() {
    cd "${_pkgname}"

    make DESTDIR="${pkgdir}" install
    install -D -m755 ../icecream.conf "${pkgdir}/etc/icecream.conf"
    install -D -m755 ../icecreamd "${pkgdir}/usr/lib/icecream/icecreamd"
    install -D -m755 ../icecream-schedulerd "${pkgdir}/usr/lib/icecream/icecream-schedulerd"
    install -D -m644 ../icecream-scheduler.service "${pkgdir}/usr/lib/systemd/system/icecream-scheduler.service"
    install -D -m644 ../icecream.service "${pkgdir}/usr/lib/systemd/system/icecream.service"
    install -D -m644 ../icecream-git.conf "${pkgdir}/etc/ld.so.conf.d/icecream-git.conf"

    # moving pkg-config file to its usual place
    install -D -m644 "${pkgdir}/usr/lib/icecream/lib/pkgconfig/icecc.pc" "${pkgdir}/usr/lib/pkgconfig/icecc.pc"
    rm -rf "${pkgdir}/usr/lib/icecream/lib/pkgconfig"
}

# vim:set ts=2 sw=2 et:
