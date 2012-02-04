# Contributor: Jussi Timperi <jussi.timperi at gmail dot com>

pkgname=voikko-openoffice
pkgver=3.1.2
pkgrel=1
pkgdesc="Finnish spellchecker, grammar checker and hyphenator extension for OpenOffice.org"
arch=('i686' 'x86_64')
url="http://voikko.sourceforge.net"
license=('GPL3')
depends=('libvoikko')
makedepends=('openoffice-sdk' 'zip')
replaces=('openoffice.org-voikko')
install=voikko-openoffice.install
source=(http://downloads.sourceforge.net/voikko/openoffice.org-voikko-$pkgver.tar.gz)

build() {
  cd "$srcdir/openoffice.org-voikko-$pkgver"

  . /usr/lib/openoffice/basis-link/sdk/setsdkenv_unix.sh

  make oxt
}

package() {
  cd "$srcdir/openoffice.org-voikko-$pkgver/build"

  mkdir -p $pkgdir/usr/lib/openoffice/share/extension/install
  cp voikko.oxt $pkgdir/usr/lib/openoffice/share/extension/install/
}

# vim:set ts=2 sw=2 et:
md5sums=('de254b8ea791b7b86d3b2a05786879f2')
