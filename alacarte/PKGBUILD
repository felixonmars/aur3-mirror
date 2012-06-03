# Maintainer: 3ED <krzysztof1987 at googlemail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=0.13.4
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
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.13/${pkgname}-${pkgver}.tar.xz
        01-desktop-item-edit-exo.patch)
sha256sums=('a45953dfbd799d718ebafe850c0b20e581827023e8da4ee906edb1f60d6a4098'
            'b41684a0f020fcfd4a4f3f3e244bd2e11c73ab1bfca72619973ddf68d59cb14a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  for (( i=0; i < ${#source[@]}; i++ )); do
    test "${source[i]}" = "${source[i]%.patch}" \
      || patch -Np0 -i "${srcdir}/${source[i]##*/}"
  done

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var

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
