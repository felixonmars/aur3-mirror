# Maintainer: Gen2ly <toddrpartridge@gmail.com>

pkgname=gnome-shell-extension-radeon-ppm
pkgver=20120627
pkgrel=1
pkgdesc="Change the power profile of the radeon cards with open source drivers"
arch=('any')
url="https://extensions.gnome.org/extension/356/radeon-power-profile-manager/"
license=('GPL2')
depends=('gnome-shell' 'gtk3')
makedepends=('git' 'gnome-common' 'intltool')
install="$pkgname.install"
source=()
md5sums=('')

_gitroot="git://github.com/StuntsPT/shell-extension-radeon-power-profile-manager"
_gitname="shell-extension-radeon-power-profile-manager"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot --depth=1
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
}

package() {
  cd      "$srcdir/$_gitname"
  ext_dir="RadeonPowerProfileManager@StuntsPT.github.com"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/$ext_dir"
  cp -a * "$pkgdir/usr/share/gnome-shell/extensions/$ext_dir"
}

# vim:set ts=2 sw=2 et: