# Maintainer: Josh VanderLinden <arch@cloudlery.com>
pkgname=haste-server-git
pkgver=r235.6c31389
pkgrel=2
pkgdesc="open source pastebin written in node.js"
arch=("any")
url="http://hastebin.com/about.md"
license=('MIT')
depends=('nodejs' 'redis')
provides=('haste-server')
backup=('usr/lib/node_modules/haste/config.js')
source=(
    "${pkgname}::git+https://github.com/seejohnrun/haste-server"
    "haste-server.service"
)
md5sums=('SKIP'
         '2d6602bf6f7b946763e48fbf59a44d59')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  local _npmdir="${pkgdir}/usr/lib/node_modules"
  mkdir -p "${_npmdir}"

  cd "${srcdir}/${pkgname}"
  npm install -g --prefix "${pkgdir}/usr"

  install -Dm644 config.js "${_npmdir}/haste/config.js"
  install -Dm644 about.md "${_npmdir}/haste/about.md"
  install -Dm644 ../haste-server.service "${pkgdir}/usr/lib/systemd/system/haste-server.service"
}
