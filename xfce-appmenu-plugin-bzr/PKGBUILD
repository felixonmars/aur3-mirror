# Maintainer: Mihai Coman <mihai@m1x.ro>

pkgname=xfce-appmenu-plugin-bzr
pkgver=3
pkgrel=1
pkgdesc="Global menu plugin for Xfce, based on Ubuntu's Indicator framework"
arch=('i686' 'x86_64')
url="https://launchpad.net/xfce-appmenu-plugin"
license=('GPL')
depends=('xfce4-panel>=4.3.99.2' 'libindicator>=0.5.0' 'libindicator3>=0.5.0' 'indicator-appmenu' 'xdg-utils')
makedepends=('intltool' 'bzr')
provides=()
conflicts=('xfce4-appmenu-plugin')
optdepends=('appmenu-gtk2: support for GTK2 applications'
'gtk2-ubuntu: support for GTK2 applications'
'appmenu-gtk3: support for GTK3 applications'
'gtk3-ubuntu: support for GTK3 applications'
'libreoffice-extension-menubar: support for LibreOffice')
install=$pkgname.install

_bzrtrunk=lp:~the-warl0ck-1989/xfce-appmenu-plugin/xfce-appmenu-stable-2
_bzrmod=xfce-appmenu-stable-2

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr  branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

./configure --libexecdir=/usr/lib/xfce4-indicator-plugin/ --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
