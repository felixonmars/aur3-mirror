# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=nautilus-elementary-bzr
_pkgname=nautilus
pkgver=171
pkgrel=4
pkgdesc="Nautilus patched for simplicity"
arch=('i686' 'x86_64')
url="https://launchpad.net/nautilus-elementary"
license=('GPL')
depends=('desktop-file-utils' 'exempi' 'gconf' 'gnome-desktop2' \
         'gvfs' 'hicolor-icon-theme' 'libsm' 'libunique' 'vte')
makedepends=('bzr' 'gnome-common' 'gobject-introspection' 'gtk-doc' 'intltool')
optdepends=('gloobus-preview-bzr: preview support'
            'ne-terminal-config: embedded terminal')
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-elementary)
options=('!emptydirs' '!libtool')
install=$pkgname.install

_bzrtrunk="https://code.launchpad.net/~am-monkeyd/$_pkgname-elementary/2.31+"
_bzrmod="$_pkgname-elementary"

build() {
  cd "$srcdir"

  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  # autorestart fix
  sed -i '/^X-GNOME-AutoRestart=/s:=.*$:=false:' data/nautilus.desktop.in.in

  # DSO fix
  export LDFLAGS="$LDFLAGS -lgmodule-2.0"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
              --libexecdir=/usr/lib/nautilus \
              --disable-update-mimedb \
              --disable-packagekit \
              --disable-appindicator \
              --disable-clutter-view
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir/" install

  install -d -m 755 "$pkgdir"/usr/share/gconf/schemas
  gconf-merge-schema "$pkgdir"/usr/share/gconf/schemas/"$_pkgname".schemas \
    --domain "$_pkgname" "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -f "$pkgdir"/etc/gconf/schemas/*.schemas
}

# vim:set ts=2 sw=2 et:
