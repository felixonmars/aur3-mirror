# Maintainer: Greg Fitzgerald <greg@gregf.org>

pkgname=ifthenelse-git
_pkgname=ifthenelse
pkgver=20120703
pkgrel=2
pkgdesc="Program used to glue small tools together automate some tedious tasks"
arch=('i686' 'x86_64')
depends=(glib2)
provides=('ifthenelse')
conflicts=('ifthenelse')
makedepends=('git' 'vala')
license=('GPL2')
url=("https://github.com/DaveDavenport/IfThenElse")

_gitroot="https://github.com/DaveDavenport/IfThenElse.git"
_gitname="IfThenElse"

build()
{
    cd ${srcdir}

    msg "Connecting to the Git server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin master
  	msg "Updating existing repo..."
    else
        git clone ${_gitroot}
    fi

    msg "Git checkout done."
    cd ${srcdir}/${_gitname}

    make || return 1
    install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname} || return 1
}
