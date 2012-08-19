# Contributor: Alessio Biancalana <dottorblaster@gmail.com>
# Contributor: Eros Conforti <odites@gmail.com>

pkgname=papyon-git
pkgver=20120819
pkgrel=1
pkgdesc="papyon is the library behind the msn connection manager: telepathy-butterfly. - GIT version"
url="http://cgit.freedesktop.org/papyon/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('pycrypto' 'python2-gobject2' 'python2-pyopenssl')
makedepends=('git')
provides=('pymsn' 'papyon')
conflicts=('pymsn' 'papyon')
source=()
md5sums=()

_gitroot="git://anongit.freedesktop.org/papyon"
_gitname="papyon"

build() {

  cd $srcdir
  msg "Connecting to the GIT server...."
  
  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done"
  msg "Starting make..."

  cd $srcdir/$_gitname
  python2 setup.py install --root=$pkgdir || return 1
}
