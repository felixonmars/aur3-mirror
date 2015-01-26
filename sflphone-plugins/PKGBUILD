# Maintainer: Slack Bob <slack@protos.pw>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

pkgname=sflphone-plugins
_pkgname=sflphone
pkgver=1.4.1
pkgrel=1
pkgdesc="SIP/IAX2 compatible softphone"
arch=('i686' 'x86_64')
url="http://www.sflphone.org/"
license=('GPL3')
depends=('sflphone' 'evolution-data-server')
makedepends=('autoconf')
source=("https://projects.savoirfairelinux.com/attachments/download/14805/${_pkgname}-${pkgver}.tar.gz")
sha1sums=('8f77625c04763dab76df8933f935b60df8eb2777')
options=(!makeflags)

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/plugins"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/plugins"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
