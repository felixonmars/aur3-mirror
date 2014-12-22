# Maintainer: Kovivchak Evgen <oneonfire@gmail.com>

pkgname=gziplite
pkgver=3.0
pkgrel=1
pkgdesc="Minimalist rework of gzip/gunzip with minimal memory requirement"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gziplite/"
license=('GPL3')
depends=('glibc')
source=(http://downloads.sourceforge.net/project/${pkgname}/V3_0/${pkgname}-v3_0.src.tgz)
md5sums=('28b28a69dfcb65cedcee83d42ce06514')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
  install -Dm755 gziplite ${pkgdir}/usr/bin/gziplite
  install -Dm755 gunziplite ${pkgdir}/usr/bin/gunziplite
}
