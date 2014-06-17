# Maintainer: Aristides Caldeira <ari@laumi.org>
pkgname=ca-certificates-icp-brasil
pkgver=20140616
pkgrel=1
pkgdesc="CA-certificates from Brazil's government's certificate chain"
arch=('any')
url="http://www.iti.gov.br/twiki/bin/view/Certificacao/RepositoriodaACRaiz"
license=('GPL')
depends=('ca-certificates')
makedepends=('unzip')
install='ca-certificates-icp-brasil.install'
source=(
    'http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/ACcompactado.zip'
    )
#
# SHA512 taken from here:
# http://acraiz.icpbrasil.gov.br/credenciadas/CertificadosAC-ICP-Brasil/hashsha512.txt
#
sha512sums=(
    'b57ed8ce516c83aa2f5e38fc29f42d3676168723fff3f715277767ddc81a846f7f91ad82c0cf74df93ecf786627932818514bff15e8711fcce3efd6ab4d5fb70'
    )

package() {
  cd "$srcdir"
  chmod a-x *.crt
  mkdir -p "$pkgdir/usr/local/share/ca-certificates/brasil.gov.br"
  cp *.crt "$pkgdir/usr/local/share/ca-certificates/brasil.gov.br/"
}
