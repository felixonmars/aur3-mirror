# Contributor: Rob McCathie <archaur at rmcc dot com dot au>

pkgname=qdrive-git
pkgver=20130706
pkgrel=1
pkgdesc="Class for manipulation with filesystems (Qt)"
arch=('i686' 'x86_64')
url="http://gitorious.org/qdrive/"
license='Custom'
conflicts='qdrive'
#provides='qdrive'
depends=('qt5-base')
makedepends=('git')

_gitroot=git://gitorious.org/qdrive/qdrive.git
_gitname=qdrive

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
  
  echo "MODULE_VERSION = 5.0" >> .qmake.conf
  qmake -r
  make
}

package() {
  cd "$srcdir"/"$_gitname"
  make INSTALL_ROOT="${pkgdir}" install
}
