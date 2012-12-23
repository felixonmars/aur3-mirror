pkgname=boto-glacier-git
pkgver=20121223
pkgrel=1
pkgdesc="A Python package that provides interfaces to Amazon Web Services, including Amazon Glacier support" 
arch=('i686' 'x86_64')
url="https://github.com/boto/boto/tree/glacier"
#License not specified in project repository
license=('')
depends=('python2')
makedepends=('git' 'python2-pip')
source=()
md5sums=()

_gitroot="git://github.com/boto/boto.git"
_gitname="boto"

build() {
  cd "$srcdir"

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    msg "Cloning git repository"
    git clone -b glacier $_gitroot
  fi

  cd "$srcdir/boto"
  git checkout glacier
  msg "GIT checkout done or server timeout"

  python2 setup.py install --root="${pkgdir}" --optimize=1
} 
