# Maintainer: Daniel Leining <daniel@the-beach.co>
# Contributor: oke3 < Sekereg [at] gmx [dot] com >
# Contributor: Jeremy Newton (Mystro256)
# Contributor: Matthias Sobczyk <matthias.sobczyk@googlemail.com>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=banshee-devel
_pkgname=banshee
pkgver=2.6.0
_develver=2.6
pkgrel=1
pkgdesc="Music management and playback for GNOME (development release)"
arch=('i686' 'x86_64')
url="http://banshee.fm/"
license=('MIT')
depends=('mono' 'sqlite3' 'gtk2' 'gstreamer0.10' 'glib' 'dbus-sharp' 'dbus-sharp-glib' 'mono-addins' 'taglib-sharp' 'libmtp' 'mono-zeroconf' 'boo' 'libwebkit' 'gdata-sharp' 'gio-sharp-git' 'gtk-sharp-beans-git' 'gudev-sharp' 'gkeyfile-sharp' 'libgpod' 'udev' 'media-player-info' 'brasero' 'avahi' 'gstreamer0.10-bad-plugins' 'gstreamer0.10-base-plugins' 'libsoup-gnome' 'gconf-sharp' 'libmtp' 'hicolor-icon-theme' 'desktop-file-utils' 'xdg-utils' 'gvfs')
makedepends=('intltool' 'gnome-doc-utils')
optdepends=('gstreamer0.10-good-plugins: Extra media codecs'
            'gstreamer0.10-ugly-plugins: Extra media codecs'
            'gstreamer0.10-ffmpeg: Extra media codecs')
provides=('banshee')
conflicts=('banshee' 'banshee-git')
options=('!libtool')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/banshee/2.6/banshee-2.6.0.tar.xz)

sha256sums=('a47cc741f8ef2f81726ec4872e8179b17efa271c0c991e912e384fabf777394a')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-docs \
              --disable-static \
              --disable-scrollkeeper \
              --disable-schemas-install \
              --with-vendor-build-id=ArchLinux

    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"

    make DESTDIR="$pkgdir" install

    install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
