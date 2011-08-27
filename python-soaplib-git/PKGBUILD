# $ Id: $
# Maintainer: Jacco Koning <archlinux@jaccokoning.nl>

pkgname=python-soaplib-git
pkgver=20100615
pkgrel=1
pkgdesc="Soaplib is an easy to use python library for writing and calling soap web services"
license=('LGPL')
arch=('i686' 'x86_64')
url="http://trac.optio.webfactional.com/"
depends=('python')
makedepends=('setuptools' 'git')
source=()
md5sums=()

_gittrunk="git://github.com/jkp/soaplib.git"
_gitmod="soaplib"

build() {
        msg "Connecting to $_gittrunk GIT server...."
        if [ -d $_gitmod/.svn ]; then
                (cd $_gitmod && svn up)
        else
                git clone $_gittrunk $_gitmod
        fi

        msg "GIT clone done or server timeout"
        msg "Starting make..."

        cd ${srcdir}/$_gitmod
        python setup.py install --root=${pkgdir}

        # License
        install -Dm644 ${srcdir}/$_gitmod/LICENSE \
        ${pkgdir}/usr/share/licenses/python-soaplib/license
}
