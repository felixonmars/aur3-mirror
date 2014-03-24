# Contributor: Nick McLarnan <nickm@cs.earlham.edu>

pkgname=pd-cyclone
pkgver=0.1_alpha55
pkgrel=1
pkgdesc="Library of PureData classes, bringing some level of compatibility between Max/MSP and Pd environments."
arch=('i686' 'x86_64')
url="http://suita.chopin.edu.pl/~czaja/miXed/externs/cyclone.html"
depends=('pd')
license=('GPL2')
groups=('pd-externals')
source=(http://sourceforge.net/projects/pure-data/files/libraries/cyclone/cyclone-0.1-alpha55.tar.gz)
md5sums=('06838a494ffdb9af860331a192afbf9d')

build() {
  cd ${srcdir}/cyclone-0.1-alpha55
  for file in `grep -r -l g_canvas.h`
  do
    sed -i 's|#include "g_canvas.h"|#include <pd/g_canvas.h>|g' $file
  done
  for file in `grep -r -l m_imp.h`
  do
    sed -i 's|#include "m_imp.h"|#include <pd/m_imp.h>|g' $file
  done
  make
}
package(){
  mkdir -p $pkgdir/usr/lib/pd/extra/cyclone
  cp -r ${srcdir}/cyclone-0.1-alpha55/bin/* $pkgdir/usr/lib/pd/extra/cyclone
}

