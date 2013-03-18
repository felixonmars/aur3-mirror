# Maintainer: Spencer Judd <spencercjudd@gmail.com>

pkgname=xkcd-password-generator-git
pkgver=20130317
pkgrel=1
pkgdesc="A simple command line script that generates XKCD-style multiword passwords."
arch=('any')
url="https://github.com/redacted/XKCD-password-generator"
license=('BSD')
depends=('python2' 'words')
makedepends=('git')
provides=('xkcd-password-generator')

_gitroot="git://github.com/redacted/XKCD-password-generator.git"
_gitname="xkcd-password-generator"

build() {
    cd ${srcdir}
    msg "Connecting to GIT server...."

    if [ -d ${_gitname} ]; then
        cd ${_gitname} && git pull origin
        msg "The local files are updated."
    else
        git clone ${_gitroot} ${_gitname}
    fi

    msg "GIT checkout done or server timeout."

    sed -i "s/^#\!\/usr\/bin\/env python$/#\!\/usr\/bin\/env python2/g" "${srcdir}/${_gitname}/xkcd_password.py"
}

package() {
    install -D -m755 ${srcdir}/${_gitname}/xkcd_password.py ${pkgdir}/usr/bin/xkcd_password
    install -D -m644 ${srcdir}/${_gitname}/2of12.txt ${pkgdir}/usr/share/dict/2of12
    install -D -m644 ${srcdir}/${_gitname}/3esl.txt ${pkgdir}/usr/share/dict/3esl
}

