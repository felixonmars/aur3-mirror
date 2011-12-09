# Maintainer: Javier Aravena Claramunt <javier@aravenas.com>
pkgname=gnome-shell-window-buttons-extension-git
pkgver=20111209
pkgrel=1
pkgdesc="extension for Gnome 3 which puts minimize, maximize and close buttons in the top panel."
arch=('any')
url="https://github.com/biox/Gnome-Shell-Window-Buttons-Extension"
license=('GPL')
groups=()
depends=('gnome-shell>=3.2')
conflicts=('gnome-shell>=3.3')
makedepends=('git')
install='gnome-shell-windows-button-extension-git.install'
md5sums=()
optdepends=('maximus: hide border of maximized windows')

_gitroot=https://github.com/biox/Gnome-Shell-Window-Buttons-Extension.git
_gitname=gnome-shell-window-buttons-extension

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
}

package() {
  cd "$srcdir/$_gitname-build"
  install -m644 -D org.gnome.shell.extensions.window-buttons.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/org.gnome.shell.extensions.window-buttons.gschema.xml"
  install -d ${pkgdir}/usr/share/gnome-shell/extensions
  cp -rp window_buttons@biox.github.com ${pkgdir}/usr/share/gnome-shell/extensions
}

# vim:set ts=2 sw=2 et:
