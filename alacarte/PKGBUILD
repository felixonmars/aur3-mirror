# Maintainer: 3ED <krzysztof1987 at googlemail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=0.13.4
pkgrel=2
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
        03-bind_textdomain_codeset.patch
        50-git_editable_top_level_menus.patch
        90-gnome-desktop-item-edit.patch)
sha256sums=('a45953dfbd799d718ebafe850c0b20e581827023e8da4ee906edb1f60d6a4098'
            'cc8a18284332f98e041d9634b1480d4f27da738fa723f744e19e56d96fc2221e'
            '0f9f7b188dfe41679d7e51fff627dfba7636b558d9c34ac36487b2b783bf9316'
            'b19eb9666d0b760c9eb69ab24e94e14dfa5d6a10ef6edca526a17a76da019088')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

#  for (( i=0; i < ${#source[@]}; i++ )); do
#    test "${source[i]}" = "${source[i]%.patch}" \
#      || patch -Np1 -i "${srcdir}/${source[i]##*/}"
#  done
  patch -Np1 -i "${srcdir}/03-bind_textdomain_codeset.patch"
  patch -Np1 -i "${srcdir}/50-git_editable_top_level_menus.patch"
  patch -Np0 -i "${srcdir}/90-gnome-desktop-item-edit.patch"

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
