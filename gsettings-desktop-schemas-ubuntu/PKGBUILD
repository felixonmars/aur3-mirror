# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Adam Hani Schakaki (krzd) <krzd@krzd.net>

pkgname=gsettings-desktop-schemas-ubuntu
_ubuntu_rel=1ubuntu1
_ubuntu_ver=3.14.1
pkgver=3.14.1
pkgrel=1
pkgdesc="Shared GSettings schemas for the desktop"
arch=('any')
url="http://live.gnome.org/"
license=('GPL')
depends=('glib2')
makedepends=('intltool' 'gobject-introspection')
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
install=${pkgname%-*}.install
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/${pkgver%.*}/${pkgname%-*}-${pkgver}.tar.xz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gsettings-desktop-schemas_${_ubuntu_ver}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('0cca1d8a94f760dd49395c090d72a204080a684ba7c1d55ee831ee85e4beeb6ea7891eafef79a6d2905557e1015383524c82b93751bdf8c67ca446b4d2a4fc0c'
            'fe99ec3e0497cf27d21a9a00e33ab7e27c1d74863b65a73bd3a88264b54be0f440226279a37dd83dfbb11d9d88f82009406dbedf89f63a9d5fb95b66ee791453')

prepare() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  # Apply Ubuntu's patches

  # Disable patches
    sed -i '/01_no_metacity_theme.patch/d' "${srcdir}/debian/patches/series"

  for i in $(grep -v '#' "${srcdir}/debian/patches/series"); do
    msg "Applying ${i} ..."
    patch -p1 -i "${srcdir}/debian/patches/${i}"
  done
}

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-schemas-compile
  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
