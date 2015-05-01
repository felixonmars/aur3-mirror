# Maintainer: Elie Bouttier <elie+aur@bouttier.eu.org>
pkgname=7robot-eurobot-git
pkgver=1.0
pkgrel=7
pkgdesc="7Robot Eurobot - ATP related source"
arch=(i686 x86_64 armv7h)
url="http://7robot.fr"
license=('GPL')
depends=('python')
optdepends=('python-pyqt4')
makedepends=('cmake' 'git')
backup=('etc/usbdaemon.conf',
        'etc/atp.conf')
source=('usbdaemon.service'
        'usbdaemon@.service'
        'tcphub@.service'
        'hubmanager.service'
        'jsbot.service')
md5sums=('7bf79f75b98da92d3923ade4a4ab896c'
         'b194aa1c5d54493c518091c49fc3e858'
         'cdddd7c0b8b7daddc03e3d7936a74f5b'
         '1b6313f76451c8190dad5c7ef636f00c'
         '38be735b00dfbd51ccbbea938f74b2c2')

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

  cd "$srcdir/$_gitname/js"
  python setup.py build
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install

  cd "$srcdir/$_gitname/atp"
  python setup.py install --root="$pkgdir"

  cd "$srcdir/$_gitname/js"
  python setup.py install --root="$pkgdir"

  cd "$srcdir"
  install -Dm644 usbdaemon.service "$pkgdir"/usr/lib/systemd/system/usbdaemon.service
  install -Dm644 usbdaemon@.service "$pkgdir"/usr/lib/systemd/system/usbdaemon@.service
  install -Dm644 tcphub@.service "$pkgdir"/usr/lib/systemd/system/tcphub@.service
  install -Dm644 hubmanager.service "$pkgdir"/usr/lib/systemd/system/hubmanager.service
  install -Dm644 jsbot.service "$pkgdir"/usr/lib/systemd/system/jsbot.service
}
