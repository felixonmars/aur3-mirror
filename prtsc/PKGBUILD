# Maintainer: Andrew Meakovski <meako689@gmail.com>
# pkgbuild is mainly copy-pasted from insync pkgbuild

pkgname=prtsc
pkgver=0.9.26.10002
pkgrel=1
pkgdesc="Screenshot sharing and annotation tool using google drive as a storage. (deb package)"
arch=('i686' 'x86_64')
url="https://insync.io/prtsc"
license=('custom:insync')
options=(!strip)
depends=('xdg-utils' 'glibc' 'gobject-introspection')
 
case $CARCH in
'x86_64')
    _arch='amd64'
    md5sums=('66b32f13bdb11a59c1c1401cfd69b9cf')
;;
'i686')
    _arch='i386'
    md5sums=('0c841d27b93abcdad43ee5550fd940eb')
;;
esac
 
debfile="${pkgname}_${pkgver}_${_arch}.deb"
source=("${debfile}::http://s.prtsc.io/builds/${debfile}")
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
