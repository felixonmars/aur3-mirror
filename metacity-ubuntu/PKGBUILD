# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>

pkgname=metacity-ubuntu
_ubuntu_rel=0ubuntu2
pkgver=3.14.2.${_ubuntu_rel}
pkgrel=1
pkgdesc="A window manager for GNOME with Ubuntu's patches"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL')
depends=('dconf' 'gtk2' 'gsettings-desktop-schemas' 'libcanberra' 'libgtop' 'libsm' 'startup-notification' 'zenity')
makedepends=('intltool' 'yelp-tools')
groups=('gnome' 'unity')
provides=("metacity=${pkgver}")
conflicts=('metacity')
options=('!emptydirs')
install=metacity.install
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/${pkgver%.*.*}/${pkgname%-*}-${pkgver%.*}.tar.xz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname%-*}_${pkgver%.*}-${_ubuntu_rel}.debian.tar.xz")
sha512sums=('a615f1be1df7451448279245ec3661c46ddc2c9f028efb7fbef2ae7718e43158713178f2aef3fa30436de9ecd5aa5b661384020b8b4f56dd805896cac03fd4c7'
            '583d344eaac0326382a044115023cccfe1d1d4bed5d3e37464c23d59aeabde27cb428d76edd116cc6ad614887adf63503217a15637fa2d81089de25d07011af3')

prepare() {
  cd "${srcdir}/${pkgname%-*}-${pkgver%.*}"

  # Apply Ubuntu patches
  for i in $(grep -v '#' "${srcdir}/debian/patches/series"); do
    patch -p1 -i "${srcdir}/debian/patches/${i}"
  done
}

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver%.*}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/metacity \
    --localstatedir=/var \
    --disable-static \
    --disable-schemas-compile

  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver%.*}"
  make DESTDIR="${pkgdir}" install

  # Use language packs
  rm -r "${pkgdir}/usr/share/locale/"
}

# vim:set ts=2 sw=2 et:
