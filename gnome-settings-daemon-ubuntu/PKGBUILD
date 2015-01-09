# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>

pkgname=gnome-settings-daemon-ubuntu
_ppa_rel=0ubuntu1~utopic1
_ppa_ver=3.14.2
pkgver=3.14.2
pkgrel=1
pkgdesc="The GNOME Settings daemon with Ubuntu's patches"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL')
depends=('dconf' 'gnome-desktop' 'gsettings-desktop-schemas-ubuntu' 'hicolor-icon-theme' 'libcanberra-pulse' 'libnotify' 'libsystemd' 'libwacom' 'pulseaudio' 'pulseaudio-alsa' 'upower' 'libibus' 'librsvg' 'libgweather' 'geocode-glib' 'geoclue2' 'nss')
makedepends=('intltool' 'xf86-input-wacom' 'libxslt' 'docbook-xsl')
groups=('gnome' 'unity')
provides=("gnome-settings-daemon=${pkgver}")
conflicts=('gnome-settings-daemon')
options=('!emptydirs')
install=gnome-settings-daemon.install
source=("http://ftp.gnome.org/pub/gnome/sources/${pkgname%-*}/3.14/${pkgname%-*}-${pkgver}.tar.xz"
        "http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/pool/main/g/gnome-settings-daemon/gnome-settings-daemon_${_ppa_ver}-${_ppa_rel}.debian.tar.xz"
        '0001-Do-not-hide-cursor.patch')
sha512sums=('3cd125ed89d47b03439f473df861d41696f6281c9df84218f3fe29d86570fbcd13dd2bedb3f63b354e06043d7d8fda0d1304e03a6ca39b9bcbd369a908d88ba2'
            '730697b37b9ef7fd55a97f9b0cea5cb2280601131632ee84861f1106ad94a53be18f3d1fb4560bddad2b21e04413d43e7782c538d67110cefba7e56606285321'
            'f0e4971759ea7553afb998d55124dff7450288d7079057911a61da1b9625272ce19b3dc8f0dbce9b3418e86aaf666954269ed42512e2d1ed37b8b4bf123725e2')

prepare() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  patch -p1 -i "${srcdir}/0001-Do-not-hide-cursor.patch"

  # Apply Ubuntu's patches
    # Disable patches
      # Ubuntu specific
        sed -i '/43_disable_locale_settings.patch/d' "${srcdir}/debian/patches/series"
        sed -i '/53_sync_input_sources_to_accountsservice.patch/d' "${srcdir}/debian/patches/series"

  for i in $(grep -v '#' "${srcdir}/debian/patches/series"); do
    msg "Applying patch ${i} ..."
    patch -p1 -i "${srcdir}/debian/patches/${i}"
  done
}

build() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"

  autoreconf -vfi

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib/gnome-settings-daemon \
    --disable-static
      
  # https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd "${srcdir}/${pkgname%-*}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -dm755 "${pkgdir}/usr/bin/"
  ln -s /usr/lib/gnome-settings-daemon/gnome-settings-daemon \
    "${pkgdir}/usr/bin/unity-settings-daemon"
}

# vim:set ts=2 sw=2 et:
