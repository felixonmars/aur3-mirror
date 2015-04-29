# Maintainer  : Fernando "Firef0x" G.P. da Silva <firefgx { aT ) gmail [ d0t } com>
# Contributor : Fernando "Firef0x" G.P. da Silva <firefgx { aT ) gmail [ d0t } com>

pkgname=forvocl
pkgdesc="Command-line tool for playing, listing and saving Forvo pronunciations."
pkgver=20150427.99b2c03
pkgrel=1
arch=("any")
url="https://github.com/dohliam/forvocl"
license=("MIT")
backup=('etc/xdg/forvocl/config.yml')
depends=('mplayer' 'ruby-nokogiri')
makedepends=('git')
source=("git+https://github.com/dohliam/${pkgname}.git")
sha256sums=('SKIP')
install=${pkgname}.install

pkgver() {
  cd "${pkgname}"
  ( set -o pipefail
  printf "%s.%s" "$(git log -1 --pretty=format:%cd --date=short | sed 's/-//g')" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${pkgname}"

  # Patch for executable name
  sed -i -e 's|forvocl.rb|forvocl|g' \
    -e 's|# ruby|#|g' forvocl.rb

  # Install bin file
  install -Dm755 forvocl.rb "${pkgdir}/usr/bin/forvocl"

  # Install config file
  install -Dm644 config.yml "${pkgdir}/etc/xdg/${pkgname}/config.yml"

  # Install documentation
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  # Install license file
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sts=2 sw=2 ts=2 et:
