# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=gnome-shell-extension-remove-recent-git
pkgver=20120328
pkgrel=1
pkgdesc="Remove a recent item with a simple click in overview"
arch=('any')
url="https://github.com/romeshell/remove-recent"
license=('unknown')
depends=('gnome-shell')
makedepends=('git')
groups=('gnome-shell-extensions')

_gitroot="git://github.com/romeshell/remove-recent.git"
_gitname="remove-recent"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
}

package()
{
    mkdir -p "${pkgdir}/usr/share/gnome-shell/extensions/"
    cp -r "${srcdir}/remove-recent/remove-recent@tglman.org" "${pkgdir}/usr/share/gnome-shell/extensions/"
}
