# Contributor:  apkawa <apkawa@gmail.com>
pkgname=python-clevercss-git
pkgver=20120227
pkgrel=1
pkgdesc="An updated version Armin Ronacher's CleverCSS 0.1 that includes several bug fixes."
arch=('i686' 'x86_64')
url="http://sandbox.pocoo.org/clevercss/"
license=('GPL')
depends=('python2')
makedepends=('git')
source=( )
md5sums=( )
_gitname="clevercss"
_gitroot="git://github.com/clevercss/clevercss.git"

build() {
      cd ${srcdir}
      msg "Connecting to $_gitroot GIT server...."

      if [ -d ${srcdir}/$_gitname ] ; then
      cd $_gitname && git pull origin
      msg "The local files are updated."
      else
      git clone $_gitroot
      fi

      msg "GIT checkout done or server timeout"

    cd ${_gitname}
    python2 setup.py install --root=$startdir/pkg
}

