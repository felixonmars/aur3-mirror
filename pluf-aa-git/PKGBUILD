# Contributor: Jakub Vitak <mainiak@gmail.com>
pkgname=pluf-aa-git
pkgver=20091101
pkgrel=1
pkgdesc="AutoAdmin pluf app"
arch=('i686' 'x86_64')
url="http://code.pluf.org/p/admin/"
license=('LGPL')
groups=()
depends=()
makedepends=('git')
provides=('pluf-aa')
conflicts=()
replaces=()
backup=()
options=(!purge)
install=
_aur_url="http://aur.archlinux.org/packages/$pkgname/$pkgname"
source=("${_aur_url}/backup+history.patch" "${_aur_url}/backup.patch")
noextract=()
md5sums=('353310434b4aa5bc1a477a8dd131d824'
         '731543c32e7ad6d3faec166ea08be0bd')

_gitroot="git://pluf.indefero.net/pluf/admin.git"
_gitname="pluf-aa"

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
  msg "Starting make..."

  _dest="$pkgdir/srv/http"

  rm -rf $pkgdir
  mkdir -p $_dest
  cp -r $srcdir/$_gitname $_dest
  rm -rf $_dest/$_gitname/.git
  
  cd $_dest/$_gitname
  patch -p1 -i $srcdir/backup+history.patch
  patch -p1 -i $srcdir/backup.patch
} 
