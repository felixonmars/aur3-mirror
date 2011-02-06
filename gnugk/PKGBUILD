# Maintainer: Milo Mirate <mmirate at ymail dot com>
pkgname=gnugk
pkgver=2.3.2
pkgrel=1
pkgdesc="A free software H.323 gatekeeper from GNU"
arch=('i686' 'x86_64')
url="http://www.gnugk.org/"
license=('GPL2')
depends=('glibc' 'ptlib28' 'h323plus-svn')
source=("http://downloads.sourceforge.net/project/openh323gk/Sources/${pkgver}/${pkgname}-${pkgver}-3.tar.gz")
md5sums=('d0485bf0c3734b58cd1bcf23c38ccfb1')
optdepends=('asterisk: pbx server'
'yate: pbx server, call center, and more')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

  rm -f "${pkgdir}/usr/share/info/dir"
}

# vim:set ts=2 sw=2 et: