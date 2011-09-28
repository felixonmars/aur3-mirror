# Maintainer: fauno <fauno@kiwwwi.com.ar>
pkgname=vim-conque
_script=conque
pkgver=2.3
pkgrel=1
pkgdesc="Conque is a Vim plugin allowing users to execute and interact with programs, typically a shell such as bash, inside a buffer window."
arch=("any")
url="http://code.google.com/p/conque/"
license=('MIT')
depends=(gvim)
groups=('vim-plugins')
install=vimdoc.install
source=(http://${_script}.googlecode.com/files/${_script}_${pkgver}.tar.gz
        LICENSE)

build() {
    cd ${srcdir}/${_script}_${pkgver}

    install -d ${pkgdir}/usr/share/vim/vimfiles/
    install -d ${pkgdir}/usr/share/licenses/${pkgname}/

    cp -r * ${pkgdir}/usr/share/vim/vimfiles
    rm -f ${pkgdir}/usr/share/vim/vimfiles/doc/tags 

    install -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
md5sums=('937d9f77ffa1a8cf474f15238b315f46'
         'd43a8fb1bce572cbec82aa1fb3aa776b')
