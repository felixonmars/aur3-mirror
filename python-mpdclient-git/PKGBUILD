# Contributor: yack <brayan@yack.com.br>

pkgname=python-mpdclient-git
pkgver=20100725
pkgrel=1
pkgdesc="Python module for interfacing MPD"
arch=('i686' 'x86_64')
url="http://jatreuman.indefero.net/p/python-mpd/"
license=('LGPL')
depends=('python' 'mpd')
_gitroot="git://jatreuman.indefero.net/jatreuman/python-mpd.git"
_gitname="python-mpd"

build() {
  msg "Connecting to GIT server...."
  git clone $_gitroot
  cd "$srcdir/$_gitname"
  msg "Starting make..."
  python setup.py install --root=${pkgdir} || return 1
}
