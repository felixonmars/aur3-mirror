pkgname=python2-stringtemplate
pkgver=3.2b1
pkgrel=1
pkgdesc='Python2 bindings for StringTemplate, a template engine for generating source code, web pages, emails, or any other formatted text output.'
url="http://www.stringtemplate.org/"
license=('BSD')
depends=('python-antlr2' 'python2')
makedepends=()
arch=('i686' 'x86_64')
source=(http://www.stringtemplate.org/download/PyStringTemplate-${pkgver}.tar.gz)
md5sums=('be68025b8349445ed799b87b8e366d2a')

build()
{
   cd ${srcdir}/stringtemplate3-${pkgver}
   python2 setup.py install --root $startdir/pkg || return 1
}
