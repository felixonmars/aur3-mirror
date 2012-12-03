# Maintainer: Ragnis Armus <ragnis.armus@gmail.com>

pkgname=libaxr-git
pkgver=20121203
pkgrel=1
pkgdesc="AXR stands for Arbitrary XML Rendering. It's aim is to provide a better alternative to HTML+CSS"
arch=('i686' 'x86_64')
url="http://axr.vg"
license=('GPL')
depends=('git' 'qt' 'cmake')
provides=('axr')
_gitroot='git://github.com/axr/core.git'
_gitname='core'

build ()
{
        if [[ -d "${srcdir}/${_gitname}" ]]; then
                rm -rf "${srcdir}/${_gitname}"
        fi

        git clone "${_gitroot}"

        cd "${srcdir}/${_gitname}"
        git submodule update --init --recursive

        msg "Starting make for ${pkgname}"

        if [[ -d "${srcdir}/build/" ]]; then
                rm -rf "${srcdir}/build/"
        fi

        install -d "${srcdir}/build/"

        cd "${srcdir}/build/"
        cmake "${srcdir}/${_gitname}" || return 1
        make || return 1
}

package ()
{
        install -d "${pkgdir}/usr/lib"
        install "${srcdir}/build/lib/libaxrcore.so" "${pkgdir}/usr/lib/libaxrcore.so"
}
