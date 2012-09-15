# Contributor: xnitropl <xnitropl at gmail dot com>
pkgname=niceshaper
pkgver=1.0pre1
pkgrel=1
pkgdesc='A tool for bandwidth allocation allowing dynamic traffic shaping, which is more effective than traditional, static HTB shaping.'
url='http://niceshaper.jedwabny.net'
arch=('x86_64' 'i686')
license=('GPL')
depends=('iptables')
source=(http://niceshaper.jedwabny.net/files/niceshaper1.0pre1.tar.bz2
	fix.patch)
md5sums=('7865ecd9c4d4d47b142ba8889107c3e3'
         '018595218c0eb2df29084f7e74c0f1e6')

build() {
    cd "${srcdir}"
    patch src/main.h ../fix.patch
    make
 }

package() {
    cd "${srcdir}"
    prefix="../pkg"

    # install binary
    mkdir -p ${prefix}/usr/local/bin
    sed -i '1c\PREFIX:=$(DESTDIR)/usr/local' Makefile
    make DESTDIR="${pkgdir}" install

    # install config
    mkdir -p ${prefix}/etc/niceshaper
    cp etc/niceshaper/* ${prefix}/etc/niceshaper/

    # install syntax files
    mkdir -p ${prefix}/usr/share/vim/vimfiles/syntax/
    cp editors/niceshaper.vim ${prefix}/usr/share/vim/vimfiles/syntax/

    # install doc
    mkdir -p ${prefix}/usr/share/doc/niceshaper
    cp -r docs ${prefix}/usr/share/doc/niceshaper
}
# vim:set ts=2 sw=2 et: