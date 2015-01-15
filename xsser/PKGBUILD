# Maintainer: Kyo Mikami <lateau@google.com>

pkgname=xsser
pkgver=1.6_1
pkgrel=1
pkgdesc='Cross Site "Scripter" (aka XSSer) is an automatic -framework- to detect, exploit and report XSS vulnerabilities in web-based applications.'
arch=('i686' 'x86_64')
url='http://xsser.sourceforge.net/'
license=('GPL3')
groups=('network')
depends=(
  'python2-setuptools'
  'python2-pycurl'
  'python2-beautifulsoup3'
  'python2-lxml'
  'python2-geoip'
)
makedepends=('python2')
source=('http://downloads.sourceforge.net/xsser/xsser_1.6-1.tar.gz')
md5sums=('f61d42a8b986c66963244bf7c02119f2')
#http://aarnet.dl.sourceforge.net/project/xsser/xsser_1.6-1.tar.gz
build() {
  cd "${srcdir}/xsser-public"
  msg2 '====================================================='
  msg2 '               *** Build Info ***'
  msg2 ' The following package file will be generated:'
  msg2 "  * ${pkgname}-${pkgver}-${pkgrel}-${CARCH}${PKGEXT}"
  msg2 '====================================================='
  python2 setup.py build || return 1
}

package() {
  cd "${srcdir}/xsser-public"
  python2 setup.py install --prefix=/usr --exec-prefix=/usr --root="$pkgdir" || return 1
}
