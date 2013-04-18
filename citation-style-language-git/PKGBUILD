# Maintainer: Paul Barker <paul@paulbarker.me.uk>
pkgname=citation-style-language-git
pkgver=2557.03b11eb
pkgrel=1
pkgdesc="Official repository of Citation Style Language (CSL) citation styles."
arch=('any')
url="http://citationstyles.org/"
license=('cc-by-sa-3.0')
source=('git://github.com/citation-style-language/styles.git')
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  install -m0755 -d "${pkgdir}/usr/share/citation-style-language"
  install -m0755 -d "${pkgdir}/usr/share/citation-style-language/dependent"
  for f in `find styles -name *.csl`; do
    target="${pkgdir}/usr/share/citation-style-language/`echo $f | sed -e 's#^styles/##'`"
    install -m0644 "$f" "$target"
  done
  install -m0644 styles/README.md "${pkgdir}/usr/share/citation-style-language/README.md"
  install -m0644 styles/CONTRIBUTING.md "${pkgdir}/usr/share/citation-style-language/CONTRIBUTING.md"
}

pkgver() {
  cd "${srcdir}/styles"
  # This repo has no tags!
  echo `git rev-list HEAD --count`.`git rev-parse --short HEAD`
}
