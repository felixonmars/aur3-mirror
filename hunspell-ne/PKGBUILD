# $Id$
# Maintainer: Sagar Chalise <chalisesagar@gmail.com>

pkgname=hunspell-ne
pkgver=2.3
_pkgver=2_3
_date=2008_04_25
pkgrel=1
pkgdesc="Nepali Dictionary for Hunspell"
arch=('any')
url="http://ltk.org.np/nepali_spellchecker.php"
license=('LGPL2')
makedepends=('hunspell')
optdepends=('hunspell: the spell checking libraries and apps')
source=("http://nepalinux.org/downloads/ne_NP_dict.zip")
md5sums=('cfb00708085445afe58d6972bc9a22e8')

build() {
  cd "${srcdir}"

  # Fix dic file empty lines (FS#22275)
  sed '/^\/$/d' -i ne_NP.dic
}

package() {
  cd "${srcdir}"
  install -dm755 ${pkgdir}/usr/share/hunspell

  install -D -m644 ne_NP.dic "${pkgdir}/usr/share/hunspell/ne_NP.dic"
  install -D -m644 ne_NP.aff "${pkgdir}/usr/share/hunspell/ne_NP.aff"

  # the symlinks
  install -dm755 ${pkgdir}/usr/share/myspell/dicts
  pushd $pkgdir/usr/share/myspell/dicts
    for file in $pkgdir/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd
 # docs
  install -dm755 ${pkgdir}/usr/share/doc/$pkgname
  cp -p README_ne_NP.txt ${pkgdir}/usr/share/doc/$pkgname
}
