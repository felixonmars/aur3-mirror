# mantainer: Berseker <berseker86 at gmail dot com>
# Based on Extra Metacity PKGBUILD by  Jan de Groot
# Patch supplied by anshuljain in a comment here http://aur.archlinux.org/packages.php?ID=35238

pkgname=metacity-better-button-layout
_realname=metacity

pkgver=2.30.3
pkgrel=2
pkgdesc="A window manager for GNOME2 - patched for better button layout support"
arch=(i686 x86_64)
license=('GPL')
depends=('startup-notification>=0.10' 'gconf>=2.32.0' 'zenity>=2.32.0' 'libcanberra>=0.25' 'libgtop>=2.28.2')
makedepends=('intltool' 'pkgconfig' 'gnome-doc-utils>=0.20.2')
url="http://www.gnome.org"
groups=('gnome')
options=('!libtool' '!emptydirs')
provides=('metacity')
conflicts=('metacity')
install=metacity.install
source=(http://ftp.gnome.org/pub/gnome/sources/${_realname}/2.30/${_realname}-${pkgver}.tar.bz2
        metacity-restartstyle.patch
        metacity-better-button-layout.patch
        http://bazaar.launchpad.net/~ubuntu-desktop/metacity/ubuntu/download/head:/06_add_uxd_shadows_a-20110113155819-k10mr1iitlo3vi6g-1/06_Add_UXD_shadows_and_borders.patch)

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  patch -Np1 -i "${srcdir}/metacity-restartstyle.patch"
  patch -Np1 -i "${srcdir}/metacity-better-button-layout.patch"
  patch -Np1 -i "${srcdir}/06_Add_UXD_shadows_and_borders.patch"

  
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/metacity \
      --localstatedir=/var --disable-static
  make
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

  install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
  gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${_realname}.schemas" --domain metacity ${pkgdir}/etc/gconf/schemas/*.schemas
  rm -f ${pkgdir}/etc/gconf/schemas/*.schemas
}

sha256sums=('08f887018fa5e447cf184d03bae3fe2c05fdb7583bed6768e3b4d66392fc18dd'
            '3a7e484ec2eb97e7b7f1baaa33e5d925e67a35c84e49c5abe6c32cf2c25f16eb'
            'bb8f17a6a2eafb364422dc9ec4918a058d1c93025644559b76c169b784b90d3c'
            '152271f5262715c616a98ac95d65dc4108504c9eb9227c279d82fe67d39c1631')
