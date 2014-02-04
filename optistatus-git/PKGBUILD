# Maintainer:  fluffymadness
# fluffymadness(at)posteo.de

pkgname=optistatus-git
_gitname=optistatus
pkgver=0.0
pkgrel=2
pkgdesc="An Optimus Status Applet, that shows if the NVIDIA card is running (Temperature on Icon-Hover)"
arch=('i686' 'x86_64')
url="https://github.com/fluffymadness/optistatus"
license=('GPLv2')
depends=('python2' 'python2-pyqt4' 'bbswitch')
makedepends=('git')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# 'pacman41' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=('git://github.com/fluffymadness/optistatus.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}



package() {
  cd $_gitname
  install -Dm755 "optistatus.py" "$pkgdir/usr/bin/optistatus"
  install -Dm755 "icons/optistatus-active.png" "$pkgdir/usr/share/pixmaps/optistatus-active.png"
  install -Dm755 "icons/optistatus-inactive.png" "$pkgdir/usr/share/pixmaps/optistatus-inactive.png"
}
