# Maintainer: Lazaros Koromilas <koromilaz@gmail.com>
pkgname=dtdgen
pkgver=7.0
_filever=7-0
pkgrel=1
pkgdesc="A tool to generate XML DTDs"
arch=('any')
url="http://saxon.sourceforge.net/dtdgen.html"
arch=('any')
license=('MPL')
depends=('java-runtime')
source=("http://prdownloads.sourceforge.net/saxon/${pkgname}${_filever}.zip"
        "dtdgen.sh")
md5sums=('523d6aaa44ea61592845bde0081d3e3c'
         'd93030b36f0c8f3f21813682909345ac')

build() {
  _pkghome=/usr/share/java/${pkgname}
  cd ${srcdir}
  install -dm755 ${pkgdir}${_pkghome} || return 1
  install -m644 ./${pkgname}.jar ${pkgdir}${_pkghome} || return 1
  install -m644 ./doc.html ${pkgdir}${_pkghome} || return 1
  install -dm755 ${pkgdir}/usr/bin || return 1
  install -m755 ./${pkgname}.sh ${pkgdir}/usr/bin/${pkgname} || return 1
}

# vim:set ts=2 sw=2 et:
