# Contributor: Vadim Abramchuk <abram@uainet.net>
pkgname=mtp-lastfm
pkgver=20091225
pkgrel=1
pkgdesc="PyGTK project to scrobble tracks from mtp devices to last.fm."
arch=(any)
url="http://github.com/woodenbrick/mtp-lastfm"
license=('GPL')
groups=()
depends=('pygtk' 'libglade' 'libmtp' 'sqlite3' 'python-distutils-extra')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
#source=($pkgname-$pkgver.tar.gz)
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/woodenbrick/mtp-lastfm.git"
_gitname="mtp-lastfm"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"

  cd $srcdir/$_gitname

  python setup.py install --root=$pkgdir/ --optimize=1 || return 1
} 
