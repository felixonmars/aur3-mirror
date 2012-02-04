# $Id$
# Maintainer: Sagar Chalise<chalisesagar@gmail.com>

pkgname=mythes-ne
pkgver=2.0
pkgrel=1
pkgdesc="Nepali thesaurus"
arch=(any)
url="http://ltk.org.np/nepali_spellchecker.php"
license=('LGPL')
optdepends=('libmythes: offers thesaurus library functions')
source=(ftp://ftp.iitm.ac.in/openoffice/contrib/dictionaries/thes_ne_NP_v2.zip)
md5sums=('d262acc867a259b23f16301e373128f0')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}"/usr/share/mythes
  install -m644 th_ne_NP_v2.dat "${pkgdir}/usr/share/mythes/th_ne_NP_v2.dat"
  install -m644 th_ne_NP_v2.idx "${pkgdir}/usr/share/mythes/th_ne_NP_v2.idx"

  # the symlinks
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  pushd "${pkgdir}/usr/share/myspell/dicts"
    for file in ${pkgdir}/usr/share/mythes/*; do
      ln -sv /usr/share/mythes/$(basename $file) .
    done
  popd

  # docs
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README_th_ne_NP_v2.txt "${pkgdir}/usr/share/doc/${pkgname}"

  # licences
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../doc/${pkgname}/README_th_ne_NP.txt $pkgdir/usr/share/licenses/$pkgname/README_th_ne_NP_v2.txt
}
