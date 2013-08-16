# Maintainer: Skydrome <skydrome@i2pmail.org>

pkgname=grid-updates
pkgver=1.2.0
pkgrel=2
pkgdesc="Helps keep Tahoe-LAFS nodes' configurations up-to-date"
url='http://killyourtv.i2p.to/grid-updates'
license=('Public Domain')
arch=('any')
install='grid-updates.install'
optdepends=('python2-numpy: enables reliability calculator')
source=("http://killyourtv.i2p.us/${pkgname}/download/${pkgname}-${pkgver}.tar.gz"
        #"http://darrob.i2p.to/${pkgname}/download/${pkgname}-${pkgver}.tar.gz"
        #"http://darrob.i2p.to/${pkgname}/download/${pkgname}-${pkgver}.tar.gz.sig"
        '0001-style-fix.patch')
sha256sums=('37b434f42ff571279a33f627a216768aaa6d87664732fb8c4aad8c18eee6a268'
            '08346a9747b44ad956e313db4bf472d20e66452261d264e94f82755db3aa482d')
_patchver="${pkgver}-${pkgrel}-ARCH"

build(){
    cd "${srcdir}/${pkgname}-${pkgver}"

    patch -Np1 -i ${srcdir}/0001-style-fix.patch
    sed "s|VERSION=.*|VERSION=${_patchver} */|"      -i share/tahoe.css.patched19
    sed "s|VERSION=.*|VERSION=${_patchver} -->|"     -i share/welcome.xhtml.patched19
    sed "s|version__ .*|version__ = '${_patchver}'|" -i gridupdates/version.py

    python2 setup.py build
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    python2 setup.py install --root="$pkgdir"
}
