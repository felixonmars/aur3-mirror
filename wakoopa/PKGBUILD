# Maintainer: Jonathan Arnold <jdarnold@buddydog.org>
# Contributor: Sigitas Mazaliauskas <sigisnn at gmail dot com>
# Contributor: f0x f0x@f0x.ru

pkgname=wakoopa
pkgver=2.0
pkgrel=3
pkgdesc="Wakoopa tracks what (web) apps you use."
arch=('i686' 'x86_64')
url="http://social.wakoopa.com/"
license=('custom')
depends=(curl libsm gtk2 libxss)
# install=$pkgname.install
_source_arch="i386"
[ "$CARCH" = "x86_64" ] && _source_arch="amd64"

source=("http://apt.wakoopa.com/${pkgname}_${pkgver}_${_source_arch}.deb" "terms.html" "wakoopa.desktop")

md5sums=('28a036239fed02a400bdc728ce50674f' '660a188d06532a3e3d3a6820bd16fde0' '8c6278f8f0edd9ed2fb6cc01aaa7fca9')
[ "$CARCH" = "x86_64" ] && md5sums=('dd7f0c62933638be0d045462dea3f4c1' '660a188d06532a3e3d3a6820bd16fde0' '8c6278f8f0edd9ed2fb6cc01aaa7fca9')

build() {

    ar -x ${pkgname}_${pkgver}_${_source_arch}.deb data.tar.gz
    cd "${pkgdir}"
    tar xfz ${srcdir}/data.tar.gz ./usr/bin ./usr/share
}
