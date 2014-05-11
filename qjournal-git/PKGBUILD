# Maintainer: Lucas Hermann Negri <lucashnegri@gmail.com>

_pkg=qjournal
pkgname=$_pkg-git
pkgver=20140510
pkgrel=1
pkgdesc="Journal and note taking application."
arch=('i686' 'x86_64')
url="http://oproj.tuxfamily.org" 
depends=('qt4')
license=('GPL3')
provides=("$_pkg")
conflicts=("$_pkg")

_gitroot=https://lucashnegri@bitbucket.org/lucashnegri/qjournal.git
_gitname=$_pkg

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

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cmake -DCMAKE_INSTALL_PREFIX=$pkgdir/usr -DCMAKE_BUILD_TYPE=Release -DUSE_QT5=False
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install
}
