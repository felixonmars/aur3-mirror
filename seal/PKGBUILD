# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=seal
pkgver=1.07
pkgrel=3
pkgdesc="Synthetic Audio Library lets you write applications that are able to play digital audio waveforms and music modules on many platforms."
url="http://www.sonicspot.com/sealsdk/sealsdk.html"
license=('LGPL')
arch=('i686' 'x86_64')
source=(http://www.sonicspot.com/sealsdk/${pkgname}${pkgver%.*}${pkgver#*.}.zip \
  http://ftp.debian.org/debian/pool/main/s/${pkgname}/${pkgname}_${pkgver}-14.diff.gz)
md5sums=('ed237a6d8c8c21501374e5b4a1113e4a'
         '185e3523b004aa571abc112d130a63c2')
install=seal.install

build()
{
  cd ${startdir}/src

  # Create the patches from the debian package
  patch -p1 < seal_1.07-14.diff
  
  # Apply the patches
  cd ${pkgname}-${pkgver}
  for i in ${startdir}/src/debian/patches/*.diff; do
    patch -p1 < $i
  done

  # Move into the seal src directory and compile
  cd src
  make -f Linux/Makefile || return 1
  
  # Manually install the files
  cd ${startdir}/src/${pkgname}-${pkgver}
  install -Dm0755 src/mp ${startdir}/pkg/usr/bin/mp
  install -d ${startdir}/pkg/usr/lib/${pkgname}/
  install -m0755 lib/Linux/* ${startdir}/pkg/usr/lib/${pkgname}/
  install -Dm0644 include/audio.h ${startdir}/pkg/usr/include/seal.h

  # Include the license
  install -Dm644 LICENSE.TXT ${startdir}/pkg/usr/share/licenses/custom/${pkgname}/license.txt
}
