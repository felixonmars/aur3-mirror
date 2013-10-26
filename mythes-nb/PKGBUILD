# Maintainer: Futuro <evan@cs.umn.edu>
# Contributor: Tor Inge Røttum <tor@toringe.no>
pkgname=('mythes-nb')
pkgver=2.1
pkgrel=2
pkgdesc="Norwegian Bokmål thesaurus"
arch=(any)
url="http://no.speling.org/"
license=('GPL')
optdepends=('libmythes: offers thesaurus library functions')
makedepends=('unzip')
source=(http://alioth.debian.org/frs/download.php/file/3764/no_NO-pack2-$pkgver.zip)
sha512sums=('64061ef09eaee57f9851d4acfd4d3c14ee63994e880b39dc0ae2d7a8218b40bcec91e6da37bb39eeac5d25f2c3cc0666ab0e3bea3796b9c48a8e0134d9330d18')

package() {

    cd "$srcdir"

    # Get the thesaurus files from inside the source
    unzip th_nb_NO_v2.zip

    install -dm755 ${pkgdir}/usr/share/mythes
    install -m644 th_nb_NO_v2.dat th_nb_NO_v2.idx ${pkgdir}/usr/share/mythes

    install -dm755 ${pkgdir}/usr/share/myspell/dicts
    ln -s /usr/share/mythes/th_nb_NO_v2.dat ${pkgdir}/usr/share/myspell/dicts/th_nb_NO_v2.dat
    ln -s /usr/share/mythes/th_nb_NO_v2.idx ${pkgdir}/usr/share/myspell/dicts/th_nb_NO_v2.idx
  
    install -dm755 ${pkgdir}/usr/share/doc/${pkgname}
    install -m 644 README_th_nb_NO_v2.txt ${pkgdir}/usr/share/doc/${pkgname}
}
