# Maintainer: Oramah Maalhur <oramahmaalhur@gmail.com>
pkgname=python2-pyes-git
pkgver=20130128
pkgrel=1
pkgdesc="Python connector for ElasticSearch"
arch=(any)
url="https://github.com/aparo/pyes"
license="New BSD License"
depends=('python2' 'thrift' 'python2-distribute' 'python2-urllib3')
provides=('pycassa')

_gitroot="git://github.com/aparo/pyes.git"
_gitname="pyes"

build() {
    cd "$srcdir"
    msg "Cloning from git...."
  
    if [ -d $_gitname ]; then
        cd $_gitname && git pull origin
        msg "Pulled latest revision from git"
    else
        git clone $_gitroot $_gitname
    fi
  
    msg "Building...."
    cd "$srcdir/$_gitname"
    
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
