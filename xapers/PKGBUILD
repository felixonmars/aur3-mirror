# Maintainer: Kazuo Teramoto <kaz.rag@gmail.com>
pkgname=xapers
pkgver=0.5.3
pkgrel=1
pkgdesc="Document indexing system, geared towards academic journal articles."
arch=(any)
url="http://finestructure.net/xapers/"
license=('GPL3')
depends=('python2' 'python2-xapian' 'poppler' 'python2-pycurl'
         'python2-pybtex')
makedepends=(git)
optdepends=('python2-urwid: for curses UI'
            'xdg-utils: for curses UI'
            'xclip: for curses UI')
source=(git://finestructure.net/xapers#tag=${pkgver})
md5sums=(SKIP)

build() {
        cd "$srcdir/xapers"
        python2 setup.py build
}

check() {
        # broken, its using python not python2
        cd "$srcdir/xapers"
        make test
}

package() {
        cd "$srcdir/xapers"
        python2 setup.py install --prefix="${pkgdir}/usr"
        install -Dm 644 man/man1/xapers-adder.1 \
            "${pkgdir}/usr/man/man1/xapers-adder.1"
        install -Dm 644 man/man1/xapers.1 "${pkgdir}/usr/man/man1/xapers.1"
}
