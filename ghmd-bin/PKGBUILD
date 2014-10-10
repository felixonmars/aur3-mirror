# Maintainer: Rolinh <robinDOThahlingATgw-computingDOTnet>

pkgname=ghmd-bin
_pkgname=ghmd
pkgver=1.1.1
pkgrel=1
pkgdesc="command line tool that can render GitHub Markdown files to HTML"
arch=('x86_64' 'i686')
url="https://github.com/gilliek/ghmd"
license=('BEERWARE')
depends=('xdg-utils')
_binurl="http://gobuild3.qiniudn.com/github.com/gilliek/${_pkgname}/tag-v-v${pkgver}"
if [ "${CARCH}" = "x86_64" ]; then
  source=("${_binurl}/${_pkgname}-linux-amd64.tar.gz")
  md5sums='9e0fdbad644b4cdc329a226d3c5baef7'
else
  source=("${_binurl}/${_pkgname}-linux-386.tar.gz")
  md5sums='6e65d880c669296ab6f1a82de3178063'
fi

package() {
  cd "${srcdir}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
