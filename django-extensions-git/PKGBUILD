# Maintainer: Alper Kanat <alperkanat@raptiye.org>
# Contributor: Schnouki <thomas.jost@gmail.com>
# Maintainer: Apkawa <apkawa@gmail.com>

pkgname=django-extensions-git
pkgver=20130316
pkgrel=1
pkgdesc="Django Custom Management Command Extensions"
arch=('any')
url="http://github.com/django-extensions/django-extensions"
license=('BSD')
depends=('python2-django')
makedepends=('setuptools' 'git')
optdepends=('graphviz: to graph Django models'
            'python-werkzeug: to use the Werbzeug debugger in the embedded web server')
provides=('django-extensions')
conflicts=('django-extensions')
replaces=('django-extensions')

source=()
md5sums=()

_gitroot='https://github.com/django-extensions/django-extensions.git'
_gitname="${pkgname}"


build() {
    cd "$srcdir"
      msg "Connecting to GIT server...."

      if [ -d $_gitname ] ; then
        cd $_gitname && git pull origin
        msg "The local files are updated."
      else
        git clone $_gitroot $_gitname
      fi

      msg "GIT checkout done or server timeout"
      msg "Starting make..."


    cd $srcdir/$pkgname

    python2 ./setup.py install --root=$pkgdir --prefix=/usr || return 1
}

