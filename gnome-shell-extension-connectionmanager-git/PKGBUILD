# Contributor: Gergely Daróczi <daroczig@rapporter.net>

pkgname=gnome-shell-extension-connectionmanager-git
pkgver=20130625
pkgrel=1
pkgdesc="Connection Manager (CM) is a GNOME Shell extension that add an icon to top bar panel. It provides a menu for initiating SSH/Telnet connections and for launch any system and custom application (rdesktop, top, etc.)"
arch=('i686' 'x86_64')
url="https://github.com/sciancio/connectionmanager"
groups=('gnome-shell-extensions')
license=('GPL')
depends=('gnome-shell' 'python2-gconf')
md5sums=('2531bae90fa633a00a215e7af35f8533')

_gitroot="https://github.com/sciancio/connectionmanager.git"
_gitname="connectionmanager"

build() {
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

}

package() {
    mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/connectionmanager@ciancio.net/"
    cp $srcdir/$_gitname/* "$pkgdir/usr/share/gnome-shell/extensions/connectionmanager@ciancio.net/"
}
