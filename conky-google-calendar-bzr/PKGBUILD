# Contributor: twa022 <twa022@gmail.com>

pkgname=conky-google-calendar-bzr
pkgver=28
pkgrel=1
pkgdesc="Provides calendar information to be dislayed in conky."
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~m-buck/+junk/conkygooglecalendar"
license=('GPL3')
depends=('conky' 'python-gdata')
makedepends=('bzr')
install=$pkgname.install
source=()
md5sums=()
_bzrbranch=lp:~m-buck/+junk
_bzrmod=conkygooglecalendar

build() {
  cd $srcdir
  msg "Connecting to the server...."
    
  bzr branch $_bzrbranch/$_bzrmod -q -r $pkgver

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build

  python setup.py build || return 1
  python setup.py install --root=$pkgdir || return 1
  install -D -m644 README $pkgdir/usr/share/conkygooglecalendar/README || return 1
}
