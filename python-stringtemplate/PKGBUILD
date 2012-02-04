# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# $Id$

pkgname=python-stringtemplate
pkgver=3.2b1
pkgrel=2
pkgdesc="A template engine for generating source code, web pages, emails, or any other formatted text output. StringTemplate is particularly good at multi-targeted code generators, multiple site skins, and internationalization/localization"
url="http://www.stringtemplate.org/"
license=('BSD')
depends=('python>=2.5' 'antlr>=2.7<3'  )
makedepends=()
arch=('i686' 'x86_64')
source=(http://www.stringtemplate.org/download/PyStringTemplate-${pkgver}.tar.gz)
md5sums=('be68025b8349445ed799b87b8e366d2a')


build() {

   cd ${srcdir}/stringtemplate3-${pkgver}

   python setup.py install --root $startdir/pkg || return 1
}
