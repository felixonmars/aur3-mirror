# Maintainer: kontakt.zuf#gmail.com

pkgname=rtiacquire-git
pkgver=20140204
pkgrel=1
pkgdesc="Remote control of any DSLR camera"
arch=('i686' 'x86_64')
url="https://github.com/jcupitt/rtiacquire"
license=('GPL')
groups=()
depends=('python2-pyserial' 'libgphoto2' 'libjpeg' 'pygtk')
makedepends=()
provides=('rtiacquire')
conflicts=('rtiacquire')
replaces=('rtiacquire')
backup=()
options=(!emptydirs)
install=
source=()
md5sums=()

_gitroot=https://github.com/jcupitt/rtiacquire.git
_gitname=rtiacquire

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"


}

package() {
  cd "$srcdir/$_gitname-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et: