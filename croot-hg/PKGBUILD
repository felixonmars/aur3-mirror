# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <sebastien.binet@cern.ch>

pkgname=croot-hg
pkgver=5
pkgrel=1
pkgdesc="a simple work-in-progress C-API binding to the C++ ROOT framework."
url="http://bitbucket.org/binet/croot"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('root')
makedepend=('mercurial')

_hgroot="http://bitbucket.org/binet"
_hgrepo="croot"

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

    ./waf configure --prefix=/usr || return 1
    ./waf build || return 1
}

package() {
    cd "${srcdir}/${_hgrepo}"
    DESTDIR="$pkgdir" ./waf install || return 1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/croot/LICENSE" || return 1
}

# End of file
