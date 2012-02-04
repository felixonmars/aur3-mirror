# Contributor: Stephen Weinberg <[firstname]@q5comm.com>

pkgname=python-templatemaker
pkgver=0.1.1
pkgrel=1
pkgdesc="Given a list of text files in a similar format, templatemaker creates a template that can extract data from files in that same format."
arch=(any)
url="http://code.google.com/p/templatemaker/"
license=('BSD')
depends=('python')
makedepends=('gcc')
options=(!emptydirs)
source=('http://templatemaker.googlecode.com/files/templatemaker-0.1.1.tar.gz')
md5sums=('593de8b66a93df3b17f36ccfd49cc95c')

build() {
    cd $srcdir/templatemaker
    python setup.py install --root=$pkgdir/ --optimize=1 || return 1

    # Install useless files
    install -d $pkgdir/usr/share/doc/$pkgname
	install -m644 -t $pkgdir/usr/share/doc/$pkgname README.TXT TODO.TXT
}

