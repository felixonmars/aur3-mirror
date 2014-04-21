# Maintainer: Elie Bouttier <elie+aur@bouttier.eu.org>
pkgname=7robot-eurobot-git
pkgver=1.0
pkgrel=3
pkgdesc="7Robot Eurobot - ATP related source"
arch=(i686 x86_64)
url="http://7robot.fr"
license=('GPL')
makedepends=('cmake' 'git')
backup=('etc/usbdaemon.conf',
        'etc/atp.conf')
source=('usbdaemon.service'
        'usbdaemon@.service'
        'hubmanager.service')
md5sums=('8e2fa5c16c72c4dddf073252292930f0'
         '16893586552dbdb1ef005aacbd2d3d2a'
         '1b6313f76451c8190dad5c7ef636f00c')

_gitteam="7Robot"
_gitname="ATP"
_gitroot="https://github.com/$_gitteam/$_gitname"

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

  rm -rf "$srcdir/build"
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake -D CMAKE_INSTALL_PREFIX=/usr "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/$_gitname/atp"
  python setup.py install --root="$pkgdir"

  cd "$srcdir"
  install -Dm644 usbdaemon.service "$pkgdir"/usr/lib/systemd/system/usbdaemon.service
  install -Dm644 hubmanager.service "$pkgdir"/usr/lib/systemd/system/hubmanager.service
}
