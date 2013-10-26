# Maintainer: Futuro <evan@cs.umn.edu>
pkgname=hunspell-nn
pkgver=2.1
pkgrel=1
pkgdesc="Norwegian Nynorsk dictionary"
arch=(any)
url="http://no.speling.org/"
license=('GPL')
optdepends=('hunspell: the spell checking libraries and apps')
makedepends=('unzip')
source=(http://alioth.debian.org/frs/download.php/file/3764/no_NO-pack2-$pkgver.zip)
sha512sums=('64061ef09eaee57f9851d4acfd4d3c14ee63994e880b39dc0ae2d7a8218b40bcec91e6da37bb39eeac5d25f2c3cc0666ab0e3bea3796b9c48a8e0134d9330d18')

package() {
    cd ${srcdir}

    # Get the dictionary files from inside the source
    unzip nn_NO.zip

    install -dm755 ${pkgdir}/usr/share/hunspell
    install -m644 nn_NO.dic nn_NO.aff ${pkgdir}/usr/share/hunspell

    install -dm755 ${pkgdir}/usr/share/myspell/dicts
    ln -s /usr/share/hunspell/nn_NO.dic ${pkgdir}/usr/share/myspell/dicts/nn_NO.dic
    ln -s /usr/share/hunspell/nn_NO.aff ${pkgdir}/usr/share/myspell/dicts/nn_NO.aff

    install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
    install -m 644 README_nn_NO.txt ${pkgdir}/usr/share/doc/${pkgname}
}
