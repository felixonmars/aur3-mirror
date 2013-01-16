# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Sebastien Binet <sebastien.binet@cern.ch>

pkgname=croot-git
pkgver=20130111
pkgrel=1
pkgdesc="a simple work-in-progress C-API binding to the C++ ROOT framework."
url="http://bitbucket.org/binet/croot"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('root')
makedepend=('git')
conflicts=('croot-hg')
provides=('croot')

_gitroot="git://github.com/sbinet"
_gitname="croot"

build()
{
    msg "Connecting to GIT server..."
    if [ -d $_gitname ]; then
      cd $_gitname && git pull origin
      msg2 "Finished updating the local repository!"
    else
      git clone ${_gitroot}/${_gitname}.git "${srcdir}/${_gitname}" || return 1
      msg2 "Initial pull complete!"
    fi

    cd "${srcdir}/${_gitname}"
    ./waf configure --prefix=/usr || return 1
    ./waf build || return 1
}

package() {
    cd "${srcdir}/${_gitname}"
    DESTDIR="$pkgdir" ./waf install || return 1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/croot/LICENSE" || return 1
}

# End of file
