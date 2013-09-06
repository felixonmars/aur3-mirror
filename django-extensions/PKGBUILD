# Maintainer: Alper Kanat <alperkanat@raptiye.org>
# Contributor: Schnouki <thomas.jost@gmail.com>
# Maintainer: Apkawa <apkawa@gmail.com>
# Maintainer: Dominik Kozaczko <dominik@kozaczko.info>

pkgname=django-extensions
pkgver=1.2.0
pkgrel=2
pkgdesc="Django Custom Management Command Extensions"
arch=('any')
url="http://github.com/django-extensions/django-extensions"
license=('BSD')
depends=('python2-django')
makedepends=('setuptools' 'git')
optdepends=('graphviz: to graph Django models'
            'python-werkzeug: to use the Werbzeug debugger in the embedded web server')
provides=('django-extensions')
conflicts=('django-extensions-git')
replaces=('django-extensions-git')

source=('git+https://github.com/django-extensions/django-extensions.git#tag=1.2.0')
md5sums=('SKIP')

#_gitroot='https://github.com/django-extensions/django-extensions.git'
_gitname="${pkgname}"


build() {
    cd $_gitname
    python2 ./setup.py build
}


package() {
    cd $_gitname
    python2 ./setup.py install --root=$pkgdir --prefix=/usr || return 1
}

