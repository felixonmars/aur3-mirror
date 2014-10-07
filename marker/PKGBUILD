# Maintainer: Andrew Meakovski <meako689@gmail.com>
# pkgbuild is mainly copy-pasted from insync pkgbuild

pkgname=marker
pkgver=0.9.30.10055
pkgrel=1
pkgdesc="Screenshot sharing and annotation tool using google drive as a storage. (deb package)"
arch=('i686' 'x86_64')
url="https://insync.io/marker"
license=('custom:insync')
options=(!strip)
depends=('xdg-utils' 'glibc' 'gobject-introspection')
 
case $CARCH in
'x86_64')
    _arch='amd64'
    md5sums=('1dd2ab0e52551a1ee115112b46004bd9')
;;
'i686')
    _arch='i386'
    md5sums=('3b45bde5babf0f7051c3a327a19f8c38')
;;
esac
 
debfile="${pkgname}_${pkgver}-trusty_${_arch}.deb"
source=("${debfile}::http://d2lraxvhxlk5ex.cloudfront.net/builds/${debfile}")
noextract=($debfile)

#source=("${debfile}")

package() {
   cd $srcdir
   ar x $debfile
   tar xvf data.tar.gz
   cp -rp usr $pkgdir

   cd $pkgdir
   for file in $(grep -R "/usr/bin/python" . | cut -f1 -d :)
   do
      sed -i "s|usr/bin/python$|usr/bin/python2|g" $file
   done
}
