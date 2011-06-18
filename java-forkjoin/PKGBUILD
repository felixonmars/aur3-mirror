# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Sam May <sam.m4y@gmail.com>

pkgname=java-forkjoin
pkgver=0.4.40
pkgrel=4
pkgdesc='The JSR-166 Fork-Join Java concurrency library.'
url='http://gee.cs.oswego.edu/dl/concurrency-interest/index.html'
arch=('any')
license=('public domain')
depends=('java-environment')
source=('http://gee.cs.oswego.edu/dl/jsr166/dist/jsr166.jar')
noextract=('jsr166.jar')
md5sums=('22e57fad5aed839574629969bb62e036')

package() {
  install -D -m644 ${srcdir}/jsr166.jar \
    ${pkgdir}/$J2REDIR/lib/ext/jsr166.jar
}
