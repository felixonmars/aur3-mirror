# Maintainer : Martin Wimpress <code@flexion.org>
# Contributor: Giovanni Ricciardi <kar98k.sniper@gmail.com>
# Contributor: Xpander <xpander0@gmail.com>

_pkgname=mate-settings-daemon
pkgname=${_pkgname}-pulseaudio
pkgver=1.6.2
pkgrel=1
pkgdesc="The MATE Settings daemon (pulseaudio)"
url="http://mate-desktop.org"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL')
depends=('dbus-glib' 'dconf' 'fontconfig' 'gtk2' 'libcanberra-pulse'
         'libmatekbd' 'libnotify' 'libxt' 'mate-desktop' 'nss' 'polkit'
         'pulseaudio-alsa')
makedepends=('mate-common' 'perl-xml-parser')
options=('!emptydirs')
groups=('mate')
conflicts=("${_pkgname}-gstreamer" 'mate-media-gstreamer')
provides=("${_pkgname}")
replaces=("${_pkgname}")
source=("http://pub.mate-desktop.org/releases/1.6/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('76c50bddcffd6b0415b058c828784bcd11c034ee')
install=${pkgname}.install

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/${_pkgname} \
        --sysconfdir=/etc \
        --enable-polkit \
        --enable-pulse \
        --disable-gstreamer \
        --disable-static
    make
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
