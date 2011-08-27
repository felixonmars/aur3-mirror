# Maintainer: Harsh J <harsh AT cloudera DOT com>

# Contributor: Your Name <youremail@domain.com>

pkgname=crepo-git
pkgver=20110321
pkgrel=2
pkgdesc="Cloudera repository management tools"
arch=(any)
url="https://github.com/cloudera/crepo"
license=('APACHE')
depends=('python2' 'python2-distribute' 'git')

_gitroot="https://github.com/cloudera/crepo.git"
_gitname="crepo"

build() {
  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  cd $srcdir/$_gitname
  python2 setup.py install --root=$pkgdir/ --optimize=1
}
