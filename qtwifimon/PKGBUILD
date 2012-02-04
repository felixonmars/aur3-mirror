# Contributor: Your Name <youremail@domain.com>

pkgname=qtwifimon
pkgver=0.5
pkgrel=1
pkgdesc="Qt monitor for your wireless net"
arch=(any)
url="http://github.com/bielern/qtwifimon"
license=('GPL')
depends=('python' 'pyqt' 'wireless_tools')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=

_gitroot="git://github.com/bielern/qtwifimon.git"
_gitname="qtwifimon"

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

package() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1

  # Remember to install licenses if the license is not a common license!
  # install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
