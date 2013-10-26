# Maintainer: Futuro <evan@cs.umn.edu>
pkgname=('hyphen-nn')
pkgver=2.1
pkgrel=1
pkgdesc="Norwegian Nynorsk hyphenation"
arch=(any)
url="http://no.speling.org/"
license=('GPL')
optdepends=('hyphen: offers hyphenation library functions')
makedepends=('unzip')
source=(http://alioth.debian.org/frs/download.php/file/3764/no_NO-pack2-$pkgver.zip)
sha512sums=('64061ef09eaee57f9851d4acfd4d3c14ee63994e880b39dc0ae2d7a8218b40bcec91e6da37bb39eeac5d25f2c3cc0666ab0e3bea3796b9c48a8e0134d9330d18')

package() {

    cd "$srcdir"

    # Get the thesaurus files from inside the source
    unzip hyph_nn_NO.zip

    install -dm755 ${pkgdir}/usr/share/hyphen
    install -m644 hyph_nn_NO.dic ${pkgdir}/usr/share/hyphen

    install -dm755 ${pkgdir}/usr/share/myspell/dicts
    ln -s /usr/share/hyphen/hyph_nn_NO.dic ${pkgdir}/usr/share/myspell/dicts/hyph_nn_NO.dic
  
    install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
    install -m 644 README_hyph_nn_NO.txt ${pkgdir}/usr/share/doc/${pkgname}
}
