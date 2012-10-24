# Maintainer: 3ED <krzysztof1987 at googlemail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=3.6.1
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
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/3.6/${pkgname}-${pkgver}.tar.xz
        03-bind_textdomain_codeset.patch
        09-configure-gnome_menus-3.5.3_to_3.4.patch
        20-if-has_key-for-XDG_MENU_PREFIX.patch
        40-call-exo-d-i-e-on-xfce.patch)
sha256sums=('7e17bd80e43130afea6372a957777d289c9b9b6d4893aa20ad3f45bbd48dd25e'
            'e52eaa9cf13080cbfa136f2cd3f3887e4bc197318c5a873da7610e4f17b7bfc0'
            '2a28d2dce03b23a6c5ab23fe8f6e5122eda817e0b0b600aee80f0dd56bf2baee'
            '5a7ad4edaab6f87a314c166acf49f7c252cb3d7f9293ef618338782f13186ca3'
            '921af70444ddcf8e720d99a10a3bcefa9d05af45b088ac66aebdb1aabee848e6')

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
