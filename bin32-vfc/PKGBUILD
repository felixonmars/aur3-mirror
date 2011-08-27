# Contributor: 
pkgname=bin32-vfc
pkgver=6.0
pkgrel=2
pkgdesc="The Forbidden City: Beyond Space and Time"
arch=("x86_64")
license=('custom')
url="http://www.virtualforbiddencity.org"
depends=('glibc>=2.3.5' 'lib32-libx11' 'lib32-libogg>=1.1.3' 'lib32-libvorbis>=1.2.0' 'lib32-libtheora>=1.0beta1')
makedepends=('rpmextract')
# provides=()
# conflicts=()
_pkg_file='VirtualForbiddenCity.rpm'
source=(http://www.virtualforbiddencity.org/${_pkg_file})
md5sums=(80891fd4678faae3ecb2257d94121168)

build() {
  msg "Starting install"

  cd ${startdir}/src/
  msg "Extracting source"
  rpmextract.sh ${_pkg_file}

  msg "Copying source"
  cp -r usr/ ${startdir}/pkg/
  cp -r opt/ ${startdir}/pkg/

  cd ${startdir}/pkg/
  chmod a+x usr/bin/vfc
  sed -i 's/vfc-run/vfc-run.sh/g' usr/bin/vfc
  chmod a+x opt/VirtualForbiddenCity/vfc-run.sh
  chown .games -R opt/VirtualForbiddenCity/
  chmod g+w -R opt/VirtualForbiddenCity/

}
