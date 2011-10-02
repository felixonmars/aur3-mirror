# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=gnome-session-unity
pkgver=3.2.0
_ubuntu_ver=0ubuntu2
pkgrel=1
pkgdesc="The GNOME Session Handler"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('upower' 'gtk3' 'gconf' 'json-glib' 'startup-notification' 'hicolor-icon-theme' 'libxtst' 'polkit-gnome' 'libgl' 'gsettings-desktop-schemas' 'consolekit' 'libsm' 'dconf')
makedepends=('intltool' 'mesa' 'xtrans')
provides=("gnome-session=${pkgver}")
conflicts=('gnome-session')
options=('!emptydirs')
install=gnome-session.install
url="http://www.gnome.org"
groups=('gnome')
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/${pkgver%.*}/${pkgname%-*}-${pkgver}.tar.xz"
        "http://archive.ubuntu.com/ubuntu/pool/main/g/${pkgname%-*}/${pkgname%-*}_${pkgver}-${_ubuntu_ver}.debian.tar.gz")
sha512sums=('50b3b68d4c2bca12b20a3bcb11220023018e92bee4f46b0493244974eb7dfde00619a70f29d813953f20d0f2b42e5e0e8c2f68aba97c67666ac994eb2c455900'
            '15baa60396ef62fbf66ee6cefd9840fbc0f43ada4eb4e8c81e58301d43ecec21e4938284e6627c2ef9fda9ac7b4f8d44107201f7123cdc12c3c49efc8f5f79a0')

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  #Apply Ubuntu patches
  for i in $(cat "${srcdir}/debian/patches/series" | grep -v '#'); do
    patch -Np1 -i "${srcdir}/debian/patches/${i}"
  done

  autoreconf

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/gnome-session \
    --disable-schemas-compile \
    --enable-ipv6
  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  #Install Ubuntu files
  install -d -m755 "${pkgdir}/etc/X11/Xsession.d/"
  install -d -m755 "${pkgdir}/usr/bin/"
  install -d -m755 "${pkgdir}/usr/share/applications/"
  install -d -m755 "${pkgdir}/etc/gnome/"
  install -d -m755 "${pkgdir}/usr/share/gnome/applications/"
  install -d -m755 "${pkgdir}/usr/share/glib-2.0/schemas/"
  install -m644 "${srcdir}/debian/55gnome-session_gnomerc" "${pkgdir}/etc/X11/Xsession.d/"
  install -m755 "${srcdir}/debian/scripts/gnome-session-fallback" "${pkgdir}/usr/bin/"
  install -m755 "${srcdir}/debian/scripts/gnome-wm" "${pkgdir}/usr/bin/"
  install -m644 "${srcdir}/debian/gnome-wm.desktop" "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/debian/gnome-session-common.gsettings-override" "${pkgdir}/usr/share/glib-2.0/schemas/10_${pkgname%-*}.gschema.override"
  install -m644 "${srcdir}/debian/defaults.list" "${pkgdir}/etc/gnome/"
  pushd "${pkgdir}/usr/share/gnome/applications/"
  ln -s ../../../etc/gnome/defaults.list .
  popd
}
