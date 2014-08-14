# Maintainer: Dominik Kozaczko <aur@kozaczko.info>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Alper Kanat <alperkanat@raptiye.org>
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Apkawa <apkawa@gmail.com>

pkgname=python-django-extensions-git
_gitname="django-extensions"
pkgver=1.3.10.11.ga4f7927
pkgrel=1
pkgdesc="Django Custom Management Command Extensions"
arch=('any')
url="http://github.com/django-extensions/django-extensions"
license=('MIT')
depends=('python-django' 'python-six')
makedepends=('python-setuptools' 'git')
optdepends=('graphviz: to graph Django models'
            'python-werkzeug: to use the Werbzeug debugger in the embedded web server')
provides=('python-django-extensions')
conflicts=('python-django-extensions')

source=('git://github.com/django-extensions/django-extensions.git')
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git describe --tags | sed 's/-/./g'
}

build() {
    cd $srcdir/$_gitname
    python3 ./setup.py build
}

package() {
    cd $srcdir/$_gitname
    python3 ./setup.py install --root=$pkgdir --prefix=/usr || return 1

}
