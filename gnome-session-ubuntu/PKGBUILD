# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>

pkgname=gnome-session-ubuntu
_ubuntu='2ubuntu2'
pkgver=3.14.0
pkgrel=1
pkgdesc="The GNOME Session Handler"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
depends=('systemd' 'dconf' 'gsettings-desktop-schemas' 'gtk3' 'gnome-desktop' 'hicolor-icon-theme' 'json-glib' 'libgl' 'libsm' 'libxtst' 'dbus-glib' 'polkit-gnome')
makedepends=('gnome-common' 'gtk-doc' 'intltool' 'mesa' 'xtrans')
groups=('gnome')
provides=("gnome-session=${pkgver}")
conflicts=('gnome-session')
options=('!emptydirs')
install=gnome-session.install
url="http://www.gnome.org"
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/${pkgver%.*}/${pkgname%-*}-${pkgver}.tar.xz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/gnome-session_$pkgver-$_ubuntu.debian.tar.xz"
        'polkit-gnome-authentication-agent-1-unity.desktop')
sha512sums=('7a1b1bd229e38963d5e104fd9b649ab597b4026a59b87820c8517699e63cb066f2aa52b74eb30a052dc4017c30eb16dc16a779a14580af9c1e876edcdd9bd020'
            '952d26860337924218836557cdfd151a10d4a77f38707d34b6530c655a1c38072bd5cd5b4cafe299ae94429f98d1c318bf920620467338d01af129e773487b38'
            '34e32d1c3fd7c417b5dc70737b9dff9c9b0b660a6c99cb8c29e944818df0cb643fcac01c6c5252849bb8595a348aaf4d2a24985560c6b8a9653544e146e5b4af')


prepare() {
    cd "gnome-session-$pkgver"

    # Disable patches
      # Ubuntu specific
        sed -i '/13_display_session_properties.patch/d' "${srcdir}/debian/patches/series"
       # sed -i '/53_sync_input_sources_to_accountsservice.patch/d' "${srcdir}/debian/patches/series"

    # Apply Patches
    for i in $(grep -v '#' "$srcdir/debian/patches/series" | sort); do
        msg2 "Applying $i ..."
        patch -p1 -i "$srcdir/debian/patches/$i"
    done
}


build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  autoreconf -vfi

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/gnome-session \
    --disable-schemas-compile \
    --enable-systemd \
    --disable-gconf

  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # symlink session files so that KDM can find them
  install -dm755 "${pkgdir}/usr/share/apps/kdm/sessions/"
  ln -s /usr/share/xsessions/ubuntu.desktop "${pkgdir}/usr/share/apps/kdm/sessions/"

  install -dm755 "${pkgdir}/etc/xdg/autostart/"
  install -m644 "${srcdir}/polkit-gnome-authentication-agent-1-unity.desktop" \
    "${pkgdir}/etc/xdg/autostart/"
}

# vim:set ts=2 sw=2 et:
