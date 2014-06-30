# $Id: PKGBUILD 112279 2014-05-30 21:58:10Z faidoc $
# Maintainer: Alexandre Filgueira <alexfilgueira@cinnarch.com>
# Based on gnome-control-center:
# Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Jan de Groot <jgc@archlinux.org>
# Maintainer: Alad Wenter <the.changing.side@gmail.com>

pkgname=cinnamon-control-center-upower
_srcname=cinnamon-control-center
pkgver=2.2.10
pkgrel=1
pkgdesc="The Control Center for Cinnamon"
arch=('i686' 'x86_64')
depends=('cinnamon-settings-daemon' 'cinnamon-translations' 'cinnamon-menus'
         'libgnomekbd' 'network-manager-applet')
optdepends=('gnome-color-manager: for color management tasks')
makedepends=('intltool' 'gnome-common' 'docbook-xsl')
url="https://github.com/linuxmint/cinnamon-control-center"
install=cinnamon-control-center.install
license=('GPL')
options=('!emptydirs')
provides=('cinnamon-control-center')
conflicts=('cinnamon-control-center')
source=("$_srcname-$pkgver.tar.gz::https://github.com/linuxmint/cinnamon-control-center/archive/$pkgver.tar.gz"
		"upower_arch.patch")
sha256sums=('5bdd6570e5a2ac2bc4760f3cec5fe7240015f7de9e8756b949e301cf3a474cef'
            '12c7251855c5885cd9873718804cf2b415d173be63e667f31c864b9c4be1f123')

prepare() {
  cd $_srcname-$pkgver
  
  #https://bugs.archlinux.org/task/40193
  patch -p1 < $startdir/upower_arch.patch
}

build() {
  cd $_srcname-$pkgver

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --enable-systemd \
      --disable-update-mimedb

  #https://bugzilla.gnome.org/show_bug.cgi?id=656229
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  make
}

package() {
  cd $_srcname-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove unused stuff
  make -C panels/sound DESTDIR="$pkgdir" uninstall
  make -C panels/sound/data DESTDIR="$pkgdir" install
  make -C shell DESTDIR="$pkgdir" uninstall-binPROGRAMS uninstall-directoryDATA uninstall-uiDATA
  rm -R "$pkgdir/usr/share/applications"
  rm -R "$pkgdir/etc"

  # Fix a warning
  chown 102:0 "$pkgdir/usr/share/polkit-1/rules.d"
  chmod 700 "$pkgdir/usr/share/polkit-1/rules.d"
}
