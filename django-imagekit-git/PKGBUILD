# Contributor: morakh
pkgname=django-imagekit-git
pkgver=20111020
pkgrel=1
pkgdesc="Automated image processing for Django models"
arch=('any')
url="https://github.com/jdriscoll/django-imagekit"
license=('BSD')
depends=('python' 'django' 'python-imaging')
makedepends=('git')
provides=('django-imagekit')
source=()
md5sums=()

_gitname="django-imagekit"
_gitroot="git://github.com/jdriscoll/django-imagekit.git"
build() {
  cd $startdir/src
  
  msg "Connecting to GIT server..."
  
  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi
  msg "GIT checkout done or server timeout"

  python setup.py install --root=$pkgdir/
}
