# Maintainer: Dominik Kozaczko <aur@kozaczko.info>
# Contributor: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Alper Kanat <alperkanat@raptiye.org>
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Apkawa <apkawa@gmail.com>

pkgname=python2-django-extensions-git
_gitname="django-extensions"
pkgver=1.3.10.11.ga4f7927
pkgrel=1
pkgdesc="Django Custom Management Command Extensions"
arch=('any')
url="http://github.com/django-extensions/django-extensions"
license=('MIT')
depends=('python2-django' 'python2-six')
makedepends=('python2-setuptools' 'git')
optdepends=('graphviz: to graph Django models'
            'python2-werkzeug: to use the Werbzeug debugger in the embedded web server')
provides=('python2-django-extensions')
conflicts=('python2-django-extensions')
replaces=('django-extensions-git')

source=('git://github.com/django-extensions/django-extensions.git')
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    git describe --tags | sed 's/-/./g'
}

build() {
    cd $srcdir/$_gitname
    python2 ./setup.py build
}

package() {
    cd $srcdir/$_gitname
    python2 ./setup.py install --root=$pkgdir --prefix=/usr || return 1

}
