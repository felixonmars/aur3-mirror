# Contributor: shura <shura1991@gmail.com>

pkgname=brainfuck-git
pkgver=9999
pkgrel=1
pkgdesc="A simple brainfuck interpreter"
license=('GPLv3')
url="http://github.com/shurizzle/brainfuck"
arch=('i686' 'x86_64')
makedepends=('git' 'gcc' 'make')
depends=()
provides=()
replace=()

_gitrepo="git://github.com/shurizzle/brainfuck.git"
_gitmod="brainfuck"

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

    cd "${srcdir}"
    if [[ -e "${_gitmod}-build" ]]; then
        rm -Rf "${_gitmod}-build" || return 1
    fi
    cp -R "${_gitmod}" "${_gitmod}-build" || return 1
    cd "${_gitmod}-build"

    msg "Compiling hybris..."
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
    cd "${startdir}"
    msg "Cleaning..."
    rm -Rf "${srcdir}/${_gitmod}-build"
}
