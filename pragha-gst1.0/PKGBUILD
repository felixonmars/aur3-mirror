# Maintainer: J0k3r <moebius282 e4a t gmail D0_T com>
# Thorsten Töpper <atsutane-tu@freethoughts.de>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# Contributor: JerichoKru   <jerichokru(AT)htomail.com>

_pkgname=pragha
pkgname=$_pkgname-gst1.0
pkgver=1.1.2
pkgrel=1
pkgdesc="A lightweight GTK+ music manager - fork of Consonance Music Manager. -- using gstreamer 1.0"
arch=('i686' 'x86_64')
url="http://pragha.wikispaces.com/"
license=('GPL3')
depends=('libnotify' 'libcdio-paranoia' 'gst-plugins-base'
         'taglib' 'hicolor-icon-theme'  'gtk2'
         'dbus-glib' 'sqlite' 'desktop-file-utils'
         'libclastfm' 'totem-plparser' 'libxfce4ui')
optdepends=('notification-daemon: OSD notification')
makedepends=('intltool')
replaces=('dissonance')
conflicts=('pragha')
install=pragha.install
source=("http://dissonance.googlecode.com/files/pragha-$pkgver.tar.bz2"
        cdio-includes.patch)
sha1sums=('3e6456275a216110bd6942b2dc19b1120f4d14e5'
          '83b366be516b4c09dbccbb25b473f2de545bdbe8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  patch -Np1 -i "$srcdir/cdio-includes.patch"

  LIBS+="-ldbus-glib-1"  ./configure --prefix=/usr --with-gstreamer=1.0
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -m 644 "data/$_pkgname.desktop" "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/pixmaps"
  install -m 644 "data/$_pkgname.png" "$pkgdir/usr/share/pixmaps/"
  install -m 644 "data/$_pkgname.1" "$pkgdir/usr/share/man/man1/"

}

# vim:ts=2:sw=2:expandtab

