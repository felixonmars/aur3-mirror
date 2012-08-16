# Maintainer: Tom Kuther <gimpel@sonnenkinder.org>

pkgname=plasma-widget-menubar-appmenu-bzr
pkgver=103
pkgrel=1
pkgdesc="A Plasma widget to display menubar of application windows - appmenu-kde branch"
arch=('i686' 'x86_64')
url="https://launchpad.net/plasma-widget-menubar"
license=('GPL')
depends=('kde-workspace-appmenu' 'qjson' 'libdbusmenu-qt' 'appmenu-qt')
makedepends=('automoc4' 'cmake' 'perl' 'bzr')
optdepends=('appmenu-gtk2: support for GTK+ 2 apps'
            'appmenu-gtk3: support for GTK+ 3 apps'
            'libreoffice-extension-menubar: support for LibreOffice')
provides=('plasma-widget-menubar=0.1.16')
conflicts=('plasma-widget-menubar')
replaces=('plasma-widget-menubar')

_bzrtrunk=http://bazaar.launchpad.net/~megabigbug/plasma-widget-menubar/appmenu-kde
_bzrmod=plasma-widget-menubar

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

  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod-build/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
