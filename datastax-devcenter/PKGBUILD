# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
pkgname=datastax-devcenter
pkgver=1.3.0
pkgrel=1
pkgdesc='Visual query tool for Apache Cassandra and DataStax Enterprise clusters'
arch=('i686' 'x86_64')
url='http://www.datastax.com/what-we-offer/products-services/devcenter'
license=('Commercial')
depends=('java-environment')

_arch='x86_64'
if [[ $CARCH = 'i686' ]]; then
  _arch='x86'
fi

source=("http://downloads.datastax.com/devcenter/DevCenter-${pkgver}-linux-gtk-${_arch}.tar.gz"
        'datastax-devcenter.desktop'
        'datastax-devcenter.sh')
sha256sums=('31a40ad4f6bd1066ab57ad20388b8a2367db49d3c6bf93eca230b6ee740b13cc'
            '54db4f64e8ba8b9619dda6c629e4d2cff0d8419ede546f0acd66d5e97ac651a2'
            'c048cc7f8c82bb528550a486669536e3a8cdde270519db66f72e545e98760f3e')
[[ "$CARCH" = 'i686' ]] && sha256sums[0]='a34977aa23fc2c7bd7c976c45d2b51b4d6278f95048636269457b8864acc0fea'

package() {
  mkdir -p ${pkgdir}/usr/share/
  mv "${srcdir}/DevCenter" "${pkgdir}/usr/share/datastax-devcenter"

  install -D -m755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
