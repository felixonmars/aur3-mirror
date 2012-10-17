# Maintainer: OS Hazard <oshazard+aur@gmail.com>
# Contributor: alextud <alextud@gmail.com>
# Contribuor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Andrew Simmons <andrew.simmons@gmail.com>

pkgname=thunar-smallicons
_pkgname=thunar
pkgver=1.5.0
pkgrel=1
_pkgver=1.5
pkgdesc="Thunar file manager for Gnome3 patched with small toolbar icons"
arch=('i686' 'x86_64')
url="http://thunar.xfce.org"
license=('GPL2' 'LGPL2.1')
provides=('thunar')
conflicts=('thunar')
depends=('desktop-file-utils' 'libexif' 'hicolor-icon-theme' 'libnotify' 'udev'
         'gtk2' 'exo>=0.9.0' 'libxfce4util' 'libxfce4ui' 'libpng')
makedepends=('intltool' 'gtk-doc')
optdepends=('gvfs: for trash support, mounting with udisk and remote filesystems'
            'polkit-gnome: for mounting internal partitions (needs root password)'
            'thunar-archive-plugin: create and deflate archives')
options=('!libtool')
install=$pkgname.install
source=(http://archive.xfce.org/src/xfce/${_pkgname}/${_pkgver}/Thunar-$pkgver.tar.bz2
	fix-toolbar-icon-size.patch)
md5sums=('b219735c643d9b16c7ed913c40d36785'
	 '03c2adcada78d45ee9ad84faa20bc931')

build() {
  cd "$srcdir/Thunar-$pkgver"
  # add fixes from git tree
  patch -Np1 -i ../fix-toolbar-icon-size.patch
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-dbus \
    --enable-startup-notification \
    --enable-gudev \
    --enable-notifications \
    --enable-exif \
    --enable-pcre \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "$srcdir/Thunar-$pkgver"

  make DESTDIR=${pkgdir} install
  sed -i 's:x-directory/gnome-default-handler;::' \
    "$pkgdir/usr/share/applications/Thunar-folder-handler.desktop"
}
