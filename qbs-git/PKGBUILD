# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Anatoliy Anischovich <lin.aaa.lin at gmail.com>
# Contributor: zerbp

_pkg=qbs
pkgname=$_pkg-git
pkgver=20131114
pkgrel=1
pkgdesc="The Qt Build Suite"
arch=('i686' 'x86_64')
url="http://qt-project.org/wiki/qbs"
license=('LGPL')
provides=("$_pkg")
conflicts=("$_pkg")
depends=('qt5-script')
makedepends=('git')

_gitroot=git://gitorious.org/qt-labs/qbs.git
_gitname=qbs
_qt_dir="$(qmake -query QT_INSTALL_PREFIX)"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi
  
  qmake -r
  make
}

package() {
  cd "$srcdir"/"$_gitname"
  make INSTALL_ROOT="${pkgdir}/${_qt_dir}" install
}
