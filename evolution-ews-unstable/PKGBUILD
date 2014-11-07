_pkgname=evolution-ews
pkgname=evolution-ews-unstable
pkgver=3.13.7
pkgrel=2
pkgdesc="MS Exchange integration through Exchange Web Services [Unstable version]"
arch=('i686' 'x86_64')
conflicts=('evolution-ews')
provides=('evolution-ews')
license=('LGPL2.1')
url="https://wiki.gnome.org/Apps/Evolution/EWS"
depends=('evolution-unstable' 'gtkhtml4' 'libmspack')
makedepends=('intltool')
options=('!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/${_pkgname}-${pkgver}.tar.xz)
sha256sums=('01cbac28c84219c3893b2fe43dd81e00802fb4cc900e2ae2e694e3c5aec59a41')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/evolution --disable-static --with-krb5
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
