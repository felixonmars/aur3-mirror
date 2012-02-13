# Contributor: Stjepan Henc <sthenc@gmail.com>

pkgname=hunspell-hr
pkgver=20070821
pkgrel=1
pkgdesc="Croatian hunspell dictionaries"
arch=(any)
url="http://pkgs.fedoraproject.org/repo/pkgs/hunspell-hr/hr_HR.zip/"
license=('LGPL')
optdepends=('hunspell:  the spell checking libraries and apps')
source=(http://pkgs.fedoraproject.org/repo/pkgs/hunspell-hr/hr_HR.zip/d8782730f89768d78b2938229d790544/hr_HR.zip)
md5sums=('d8782730f89768d78b2938229d790544')

package() {
  cd "${srcdir}"
  install -dm755 "${pkgdir}/usr/share/hunspell"
  install -m644 hr_HR.dic "${pkgdir}/usr/share/hunspell/hr_HR.dic"
  install -m644 hr_HR.aff "${pkgdir}/usr/share/hunspell/hr_HR.aff"

  # the symlinks
  install -dm755 "${pkgdir}/usr/share/myspell/dicts"
  pushd "${pkgdir}/usr/share/myspell/dicts"
    for file in ${pkgdir}/usr/share/hunspell/*; do
      ln -sv /usr/share/hunspell/$(basename $file) .
    done
  popd

  # docs
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README_hr_HR.txt "${pkgdir}/usr/share/doc/${pkgname}"
}

