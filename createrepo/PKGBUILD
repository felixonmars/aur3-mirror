# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Chris Tusa <linisys@gmail.com>
# Contributor: Michael Eckert <michael.eckert@linuxmail.org>

pkgname=createrepo
pkgver=0.10.4
pkgrel=1
pkgdesc='This utility will generate a common metadata repository from a directory of rpm packages'
arch=('i686' 'x86_64')
license=('GPL')
url='http://createrepo.baseurl.org'
depends=('python-lxml' 'rpm-org' 'yum' 'deltarpm')
source=("${url}/download/createrepo-${pkgver}.tar.gz"
        "python2.patch")
md5sums=('1f499e055d64f03127aea3ae84c9ef1a'
         'd4e34cf86fd8bbfe97e858fe3ee37492')

build() {
  cd createrepo-${pkgver}
  patch -p0 < ${srcdir}/python2.patch
  make
}

package() {
  cd createrepo-${pkgver}
  make DESTDIR=${pkgdir} PYTHON="python2" sysconfdir="/etc" install
}
