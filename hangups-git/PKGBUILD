# Maintainer: Stunts <f.pinamartins@gmail.com>
_pkgname=hangups
pkgname=${_pkgname}-git
pkgver=20140917
pkgrel=1

pkgdesc="The first third-party instant messaging client for Google Hangouts"
arch=(any)
url="http://github.com/tdryer/hangups"
license=('MIT')
depends=('python' 'python-purplex' 'python-tornado' 'python-requests' 'python-urwid' 'python-appdirs')
source=('git+https://github.com/tdryer/hangups.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git log -1 --format='%cd' --date=short | tr -d --'-'
}

package() {
  cd ${srcdir}/${_pkgname}
  sed -i 's/^.*enum34.*$//' setup.py
  sed -i 's/^.*purplex==.*$//' setup.py
  sed -i 's/==/>=/' setup.py
  
  python setup.py install --prefix=/usr --root="${pkgdir}"
  find "${pkgdir}/" -name '*.pyc' -delete
  find "${pkgdir}/" -type d -empty -delete
}

