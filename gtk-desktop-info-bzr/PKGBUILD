# Contributor: kaivalagi <m_buck@hotmail.com>

pkgname=gtk-desktop-info-bzr
pkgver=32
pkgrel=1
pkgdesc="Provides webkit based transparent gtk windows on the desktop to display various information through plugins"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~m-buck/+junk/gtk-desktop-info"
license=('GPL3')
depends=('python2-gconf' 'python-gdata' 'pywebkitgtk' 'python-xlib' 'python-imaging' 'python-feedparser' 'python-twitter-svn' 'pystatgrab' 'python-keyring' 'zsi')
makedepends=('bzr')
install=$pkgname.install
source=()
md5sums=()
_bzrbranch=lp:~m-buck/+junk
_bzrmod=gtk-desktop-info

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
}

package() {
  return 0
}

