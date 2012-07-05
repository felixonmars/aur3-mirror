# Maintainer: 3ED <krzysztof1987 at googlemail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=3.5.3
pkgrel=1
pkgdesc="Menu editor for gnome"
arch=(any)
license=('LGPL')
url="http://www.gnome.org"
depends=('gnome-menus' 'gnome-panel' 'python2-gobject')
conflicts=('alacarte-xfce' 'alacarte-git' 'alacarte-xfce-devel')
makedepends=('intltool')
install=alacarte.install
options=('!libtool')
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/3.5/${pkgname}-${pkgver}.tar.xz
        03-bind_textdomain_codeset.patch
        40-call-exo-d-i-e-on-xfce.patch)
sha256sums=('8febf2f5c5dc77e9d757d8abb78759d181e7db7ec207a340fa20d2285161db30'
            'e52eaa9cf13080cbfa136f2cd3f3887e4bc197318c5a873da7610e4f17b7bfc0'
            'd978ba877ef59dc8da36ec8a1b31d6864e8a171d345e5c289d171306001bcc2b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for (( i=0; i < ${#source[@]}; i++ )); do
    if [ "${source[i]##*.}" = "patch" ]; then
      msg2 "Applying patch: \"${source[i]##*/}\"..."
      patch -Np1 -i "${srcdir}/${source[i]##*/}"
    fi
  done

  msg2 "Configuring make..."
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var

  msg2 "Making..."
  make
}
check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make check
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
