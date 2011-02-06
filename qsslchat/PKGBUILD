# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=qsslchat
_pkgname=qSslChat
pkgver=1.1
pkgrel=2
pkgdesc="A chat client/server that connects directly and uses SSL to encrypt communication."
arch=(i686 x86_64)
url="http://qsslchat.sourceforge.net/index.html"
license=('GPL')
depends=('openssl' 'qt')
makedepends=('gcc')
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${_pkgname}-${pkgver}.tar.gz ${pkgname}.desktop)
md5sums=('d08fdd35ab2157c3df1c2d1b9da5753b'
         '54e1a527877e2dc4e61a1c5135a987ea')
sha256sums=('795760d6d347c7e807311ac3c799606edd34cf2e7b78bd3610c9856e0caa1db9'
            '1b86914a614ef7b74ebc9929eebfac87a3159078c17af706db7d0857e1ddca7b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  qmake || return 1
  make || return 1
  install -v -D -m 0755 ${_pkgname} ${pkgdir}/usr/bin/${pkgname}

  cd "${srcdir}/${_pkgname}-${pkgver}"
  install -v -D -m 0755 generatekey.sh ${pkgdir}/usr/share/${pkgname}/generatekey.sh
  install -v -D -m 0644 ${_pkgname}.png  ${pkgdir}/usr/share/icons/${pkgname}.png
  install -v -D -m 0644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}

# vim:set ts=2 sw=2 et:
