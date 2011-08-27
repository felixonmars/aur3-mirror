# Maintainer: jerryluc havar . novik ta liamg.com>

pkgname=django-mailer-git
pkgver=20110312
pkgrel=1
pkgdesc="mail queuing and management for the Django web framework"
arch=(any)
url="http://github.com/jtauber/django-mailer/"
license=('custom')
depends=('python' 'django')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/jtauber/django-mailer.git"
_gitname="django-mailer"

build() {
    msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
    	cd ${_gitname}
    	git pull origin
    	msg "The local files are updated..."
    else
    	git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."
	
	cd ${_gitname}
  
	python2 setup.py build || return 1
	python2 setup.py install --root=$pkgdir --optimize=1 || return 1
}
