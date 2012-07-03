# Maintainer : Skydrome <irc.freenode.net>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: giniu <gginiu@gmail.com>

pkgname=python-foolscap-i2p
pkgver=0.6.4
pkgrel=1
pkgdesc="RPC protocol for Python and Twisted over the I2P network"
url="http://foolscap.lothar.com"
license=('MIT')
arch=('any')
conflicts=("python-foolscap")
provides=("python-foolscap")
options=(!emptydirs)

depends=('twisted'
         'python2'
         'python2-pyopenssl')

_patchver="${pkgver}-r0"
source=("http://foolscap.lothar.com/releases/foolscap-${pkgver}.tar.gz"
        "http://foolscap.lothar.com/releases/foolscap-${pkgver}.tar.gz.asc"
        #"0001-proxy-support.patch"
        #"0002-recognize-i2p-dests.patch"
        "http://killyourtv.i2p.to/tahoe-lafs/patches/foolscap-i2p-${_patchver}.patch")

sha256sums=('74b283dd68a3c9d68ebf4e9b4ebf5cfb37480915b6a808ac930fe858a66f8d99'
            'b43da5e62edf04bf08acf060b3c01f97ac6d148bdcbffe95d42f39931c39feed'
            #'acdd51cb148ef4cd401e849c34f157bc062eee2d95454fc03a25f1544666604f'
            #'6cb52821cea2d6c9670fcefe1d09fe258a755461f5539c58ebf6fb7f1ca094f4'
            'c0b6239119f85fa79b3b983886a2aa42d9bf588c649c5a13ad8f8a358f90b9b7')

build() {
    cd "${srcdir}/foolscap-${pkgver}"

    for p in $(ls ${srcdir}/*.patch); do
        msg "Patch: $p"
		patch -Np1 -i $p
	done
    python2 setup.py build
}

package() {
    cd "${srcdir}/foolscap-${pkgver}"
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

