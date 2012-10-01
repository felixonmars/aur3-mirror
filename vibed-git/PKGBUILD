# Maintainer: Dicebot <m.strashun@gmail.com>
pkgname=vibed-git
pkgver=master
pkgrel=1
pkgdesc="Asynchronous I/O web framework written in D"
provides='vibed'
arch=('i686' 'x86_64')
url="http://vibed.org"
license=('MIT')
depends=('dmd>=2.060' 'libevent' 'openssl')
makedepends=('git')
install='vibed.install'
md5sums=('01018fa20372d7b9a9ee1b5957963356')

_url="git://github.com/rejectedsoftware/vibe.d.git"

build() {
    cd "$srcdir"
    rm -rf vibe.d
    git clone $_url
}

package() {
    cd "$srcdir/vibe.d" 
    mkdir -p ${pkgdir}/usr/share/vibed
    mkdir -p ${pkgdir}/usr/share/licenses/vibed
    cp -r ./bin ${pkgdir}/usr/share/vibed/bin
    cp -r ./source ${pkgdir}/usr/share/vibed/source
    cp -r ./benchmark ${pkgdir}/usr/share/vibed/benchmark
    cp -r ./examples ${pkgdir}/usr/share/vibed/examples
    cp ./LICENSE.txt ${pkgdir}/usr/share/licenses/vibed/LICENSE.txt
    cp ./LICENSE_DE.txt ${pkgdir}/usr/share/licenses/vibed/LICENSE_DE.txt
}
