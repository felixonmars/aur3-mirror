# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
# Contributor: Flamelab <panosfilip@gmail.com>
# Contributor: rectec <rectec[at]mail[dot]com>
# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=gnome-shell
pkgname=$_pkgname-git
pkgver=3.17.2
pkgrel=1
pkgdesc="The next generation GNOME Shell"
arch=(i686 x86_64)
url="http://live.gnome.org/GnomeShell"
license=(GPL2)
depends=("mutter>=3.17.2" accountsservice caribou "evolution-data-server>=3.13.90" gcr "gjs>=1.39.2" gnome-bluetooth
         gnome-session gnome-settings-daemon gnome-themes-standard gsettings-desktop-schemas
         libcanberra-pulse libcroco libgdm libsecret network-manager-applet
         telepathy-logger telepathy-mission-control unzip systemd libgsystem "gtk3>=3.15.0" python "clutter>=1.21.5")
makedepends=(git intltool gtk-doc gnome-control-center)
optdepends=('network-manager-applet: shell integration for networkmanager')
options=('!libtool' '!emptydirs')
install=gnome-shell.install
groups=(gnome)
conflicts=('gnome-shell')
replaces=('gnome-shell')
provides=("gnome-shell=3.17.2")
source=('git://git.gnome.org/gnome-shell'
        'nm-libexecdir.patch'
        '0001-theme-Use-the-Alef-font.patch')
sha256sums=('SKIP'
            'e5bb10ad2e5c3e0fde3d05babd1bfdda701e553e02d493f7e54cb7832ce7e607'
            'd08d562b8ae7780c516082968f9b84c9737eae0603afa8dfd74590bbd6bbdc7b')

prepare() {
  cd "$srcdir/$_pkgname"

  # FS#30747 FS#32730 Problems due to libexecdir different from NM
  patch -Np1 -i "$srcdir/nm-libexecdir.patch"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/gnome-shell \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile  --enable-systemd \
      --disable-gtk-doc

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make CFLAGS="-w"

  # Use the Alef font
  patch -Np1 -i "$srcdir/0001-theme-Use-the-Alef-font.patch"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
