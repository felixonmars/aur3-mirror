# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <binet@lblbox>
pkgname=python-pyclang-hg
pkgver=16
pkgrel=2
pkgdesc="ctypes-based package wrapping the libclang C-library from LLVM/CLang"
url="http://bitbucket.org/binet/py-clang"
arch=('i686' 'x86_64')
license=('BSD')
depends=('python' 'clang')
makedepends=('mercurial')
provides=('python-pyclang')
conflicts=('python-pyclang')
install=

_hgroot="http://bitbucket.org/binet"
_hgrepo="py-clang"

build()
{
    msg "Connecting to $_hgroot"
    if [ -d $_hgrepo ]; then
        cd $_hgrepo
        hg pull -u || return 1
        msg2 "Finished updating the local repository!"
    else
        hg clone ${_hgroot}/${_hgrepo} "${srcdir}/${_hgrepo}" || return 1
        msg2 "Initial pull complete!"
    fi

    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${_hgrepo}"
    python setup.py install --prefix=/usr --root=$startdir/pkg || return 1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/pyclang-hg/LICENSE" || return 1
}
