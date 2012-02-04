# Contributor: merlok <merlok@backtrack.it>

pkgname=hybris-git
pkgver=9999
pkgrel=2
pkgdesc="Hybris Programming Language"
license=('GPLv3')
url="http://www.hybris-lang.org/"
arch=('i686' 'x86_64')
makedepends=('git' 'gcc' 'rake' 'sed' 'flex' 'bison')
depends=('pcre' 'libffi' 'libxml2' 'curl' 'readline')
provides=('hibrys')
replace=('hibrys')
install=hybris.install

_gitrepo="git://github.com/evilsocket/hybris.git"
_gitmod="hybris"

build ()
{
    cd "${srcdir}"

    msg "Connecting to github.com GIT server..."

    if [[ -d $_gitmod ]]; then
        cd "${_gitmod}"
        git pull origin || return 1
    else
        rm -Rf $_gitmod &> /dev/null
        git clone "${_gitrepo}" "${_gitmod}" || return 1
    fi

    msg "GIT checkout done."
	
    cd hybris
    msg $pkgdir 
    cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
