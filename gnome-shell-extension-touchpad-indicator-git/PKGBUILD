# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=gnome-shell-extension-touchpad-indicator-git
pkgver=20120829
pkgrel=1
pkgdesc="Enable/disable Touchpad automatically or manually"
arch=('any')
url="https://extensions.gnome.org/extension/131/touchpad-indicator/"
license=('GPL2')
depends=('gnome-shell')
install=gschemas.install

_gitroot="git://github.com/orangeshirt/gnome-shell-extension-touchpad-indicator"
_gitname="gnome-shell-extension-touchpad-indicator"

build() {

  cd "$srcdir/"

  msg "Connecting to GIT server..."
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"

}

package() {
  cd      "$srcdir/$_gitname"
  ext_dir="touchpad-indicator@orangeshirt"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/"$ext_dir""
  cp -r * "$pkgdir/usr/share/gnome-shell/extensions/"$ext_dir""
  # Give regular user permissions to parent directory and files as settings get 
  # stored here https://github.com/orangeshirt/gnome-shell-extension-touchpad-indicator/issues/15
  chmod -R 0666 "$pkgdir/usr/share/gnome-shell/extensions/"$ext_dir""
  chmod    0777 "$pkgdir/usr/share/gnome-shell/extensions/"$ext_dir""
}

# vim:set ts=2 sw=2 et:
