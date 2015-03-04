# Maintainer: caus909 <contact "at" caus909 "dot" net>

pkgname=myst
pkgver=0.2
pkgrel=1
pkgdesc="MY Sniffing Tool: Network sniffing tool"
arch=('any')
url="http://hoper.dnsalias.net/tdc/index.php?post/2015/02/10/myst-:-le-blackhat-tool-de-madame-michu"
license=('custom:"WTFPL"')
depends=('tcpdump' 'scapy' 'tcpflow' 'gupnp-tools')
source=(http://hoper.dnsalias.net/tdc/public/$pkgname
       LICENSE)
sha256sums=('ed4fb71e7b85d4c39db29ac501c8424e5d281aff6cba7a92b0ea67005ed9b2bb'
            '53f322ef6a8cf8074355ae9eeeab5ec14e9206f54ef375568135b30e25451639')

package() {
  cd "$srcdir/"
  sed -i s/"\#\!\/usr\/bin\/env python"/"\#\!\/usr\/bin\/env python2"/g $pkgname
  install -D -m755 $pkgname "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
