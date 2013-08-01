# Maintainer: Danilo Luvizotto <danilo.luvizotto@gmail.com>
pkgname=cloudprint-daemon-git
pkgver=0.10
pkgrel=3
pkgdesc="A lightweight daemon to share your CUPS printers with google's cloud print."
arch=('any')
url="https://github.com/armooo/cloudprint"
license=('GPL3')
depends=('pycups')
makedepends=('git')
options=('emptydirs')
install=cloudprint-daemon.install
source=($pkgname.service)

_gitname="cloudprint"

build() {
  cd "$srcdir"
  msg2 "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin
    msg2 "The local files are updated."
  else
    git clone https://github.com/armooo/cloudprint.git
  fi
  cd "$srcdir/$_gitname"
  PYTHONPATH=$pkgdir/usr/lib/python2.7/site-packages python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  install -d -m755 $pkgdir/usr/lib/python2.7/site-packages
  install -d -m755 $pkgdir/usr/lib/systemd/system
  install -d -m755 $pkgdir/usr/bin
  install -m644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/cloudprint-daemon.service
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('b17405ab20b6497dc05ccd0b1cc378ec')
