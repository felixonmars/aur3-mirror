# Maintainer: 3ED <krzysztof1987 at googlemail>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: pressh <pressh@gmail.com>

pkgname=alacarte
pkgver=0.13.2
pkgrel=4
pkgdesc="Menu editor for gnome (with debian patchset)"
arch=(any)
license=('LGPL')
url="http://www.gnome.org"
depends=('gnome-menus>=2.30.4' 'gnome-panel>=2.32.0' 'hicolor-icon-theme' 'pygtk')
makedepends=('intltool')
install=alacarte.install
options=('!libtool')
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.13/${pkgname}-${pkgver}.tar.bz2
        http://patch-tracker.debian.org/patch/series/dl/alacarte/0.13.2-2/01-new_item_location.patch
        http://patch-tracker.debian.org/patch/series/dl/alacarte/0.13.2-2/02-fix_delete_undo.patch
        http://patch-tracker.debian.org/patch/series/dl/alacarte/0.13.2-2/03-bind_textdomain_codeset.patch
        http://patch-tracker.debian.org/patch/series/dl/alacarte/0.13.2-2/10_settings_menu.patch)
sha256sums=('9fa36e5181b1eea947b184cb0f79d796b25cc5a5f122819a1ac2ff01bc7ee4ed'
            '3a1d48d8104b7b9c6274906bf4a4f336ce4c96316d382e78a38f4bbe82d00172'
            '489cbe78eb804cd6b32f6ac25e95318fa9988a0bf0e45f29053e59a2206b6df5'
            '46c260029ae5b001648776f5b89806f1126c502bd828a879d1002495088742e8'
            '64610f00ed9f0f78c28d6cadbb00e59ca5dc18e1675a8011141199bcecf33deb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 < "${srcdir}/01-new_item_location.patch"
  patch -Np1 < "${srcdir}/02-fix_delete_undo.patch"
  patch -Np1 < "${srcdir}/03-bind_textdomain_codeset.patch"
  patch -Np1 < "${srcdir}/10_settings_menu.patch"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
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
