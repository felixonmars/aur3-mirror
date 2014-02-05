# Maintainer: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: brisbin33
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>
pkgname=cram
pkgver=0.6
pkgrel=1
pkgdesc="A simple testing framework for command line applications"
arch=('any')
url="http://bitheap.org/${pkgname}/"
license=('GPL')
depends=('python2')
changelog=ChangeLog
source=("http://pypi.python.org/packages/source/c/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5508187940cf6acafa9538446c007428e7ebd413c17b5320505f08fa0bf267ca')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root=$pkgdir --optimize=1

    local docs="${pkgdir}/usr/share/doc/${pkgname}"
    local vimfiles="${pkgdir}/usr/share/vim/vimfiles"

    # documentation
    install -m 755 -d "${docs}"
    install -m 644 TODO.txt README.txt "${docs}"

    # examples
    install -m 755 -d "${docs}/examples"
    install -m 644 examples/*  "${docs}/examples"

    # vim syntax
    install -m 755 -d "${vimfiles}/syntax"
    install -m 644 contrib/cram.vim "${vimfiles}/syntax/cram.vim"

    # vim filetype detection
    install -m 755 -d "${vimfiles}/ftdetect"
    echo 'au BufNewFile,BufRead *.t set filetype=cram' > "${vimfiles}/ftdetect/cram.vim"
}

