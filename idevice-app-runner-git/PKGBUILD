# Maintainer: <predrg@gmail.com>

pkgname=idevice-app-runner-git
pkgver=20120130
pkgrel=1
pkgdesc="Run applications on an iPhone or iPod Touch (with console output)."
arch=('i686' 'x86_64')
url="https://github.com/crackleware/idevice-app-runner"
license=('GPL')
groups=('system')
depends=('libimobiledevice' 'usbmuxd') 
makedepends=('git')
provides=(idevice-app-runner)
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
source=()
md5sums=()

_gitroot="https://github.com/crackleware/idevice-app-runner.git"
#_gitroot="$(cd ..; pwd)/idevice-app-runner"
_gitname="idevice-app-runner"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."
  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."
  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"

  cd "$srcdir/$_gitname-build"
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
} 
