# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>
# Contributor: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='python2-numpy-oldnumeric-hack'
pkgver=1
pkgrel=1
pkgdesc="A workaround for FS#42054 - [wxpython] wx-3.0-gtk2/wx/lib/plot.py fails to import numpy.oldnumeric."
arch=('i686' 'x86_64')
license=('GPL')
provides=("$pkgname")
depends=('python2-numarray' 'wxpython')
url=('https://gitorious.org/czk/czk/source/dfaf2a76fd160830702d5da4472c97ad3483ef18:PKGBUILDs/python2-numpy-oldnumeric-hack')
source=('oldnumeric.py')
md5sums=('5ceec685e52ac0c33acb9be56db47eee')

package() {
  install -D -m644 "${srcdir}/oldnumeric.py" "${pkgdir}/usr/lib/`readlink \`which python2\``/site-packages/numpy/oldnumeric.py"
}

