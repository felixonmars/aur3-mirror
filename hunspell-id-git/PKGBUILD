# Maintainer: Mhd Sulhan <ms@kilabit.info>
pkgname=hunspell-id-git
pkgver=r9.e9fdfa0
pkgrel=2
pkgdesc="Indonesia hunspell dictionary."
arch=('any')
url="https://github.com/shuLhan/hunspell-id"
license=('LGPL3')
depends=('hunspell')
makedepends=('git')
provides=('hunspell-id-git')
conflicts=('hunspell-id')
backup=()
options=()
install=
noextract=()
source=(
  "${pkgname}::git+https://github.com/shuLhan/hunspell-id"
)
md5sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    # Only uses annotated tags to derive a version number,
    # add --tags to use un-annotated tags as well
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  # nothing to do here
  true;
}

package() {
  cd "${srcdir}/${pkgname}"
  install -D -m 0644 id_ID.aff "${pkgdir}/usr/share/hunspell/id_ID.aff"
  install -D -m 0644 id_ID.dic "${pkgdir}/usr/share/hunspell/id_ID.dic"
}

# vim:set ts=2 sw=2 et:
