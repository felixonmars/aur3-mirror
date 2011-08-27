# Contributor: Jesus Lazaro Plaza <jesuslazaro84@gmail.com>
pkgname=rt73-doc-cvs
pkgver=20070724
pkgrel=1
_kernver=$(uname -r)
pkgdesc="The RT73 (RT2571W) driver documentation."
arch=('i686' 'x86_64')
url="http://rt2x00.serialmonkey.com/"
license=('GPL')
depends=('rt73-cvs')
makedepends=('cvs')

source=()
md5sums=()
options=(docs)

_cvsmod="source/rt73/Module"
_cvsroot=":pserver:anonymous:@rt2400.cvs.sourceforge.net:/cvsroot/rt2400"

build() {
  cd ${startdir}/src
  msg "Connecting to rt2400.sourceforge.net CVS server..."
  cvs -z3 -d ${_cvsroot} co -D ${pkgver} -f ${_cvsmod}
  cd ${_cvsmod}
  
  install -D -m644 iwpriv_usage.txt ${startdir}/pkg/usr/share/doc/rt73/iwpriv_usage.txt || return 1
}
