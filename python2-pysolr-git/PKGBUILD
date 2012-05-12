# Maintainer: Lubosz Sarnecki <lubosz at gmail com>

pkgname=python2-pysolr-git
pkgver=20120511
pkgrel=1
pkgdesc="a light solr wrapper for python"
arch=(any)
url="http://github.com/toastdriven/pysolr"
license=('MIT')
depends=('python2' 'python2-lxml')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/toastdriven/pysolr.git"
_gitname="pysolr"

build() {
    msg "Connecting to the GNOME GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
    	cd ${_gitname}
    	git pull origin
    	msg "The local files are updated..."
    else
    	git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."
	
	cd ${_gitname}
  
	python2 setup.py install --root=$pkgdir --optimize=1
}
