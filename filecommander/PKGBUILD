# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=filecommander
pkgver=2.40
pkgrel=2
pkgdesc="A filemanager/shell in the style of Norton Commander"
arch=('i686' 'x86_64')
url="http://silk.apana.org.au/fc.html"
license=('shareware')

if [ "${CARCH}" = 'x86_64' ]; then
  source=(http://silk.apana.org.au/pub/fcl/${pkgname}_${pkgver}-release1_lenny_amd64.deb)
  md5sums=('7fb5db814aa434ec94e228792aef5848')
elif  [ "${CARCH}" = 'i686' ]; then
  source=(http://silk.apana.org.au/pub/fcl/${pkgname}_${pkgver}-release1_lenny_i386.deb)
  md5sums=('6ca53bdf5f3f4ee8216b577772164904')
fi

package() {

#  Extract Debian package
   bsdtar xf $pkgname*
   bsdtar xf data.tar.gz -C $pkgdir

   # License
   install -Dm644 $pkgdir/usr/share/doc/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/copyright.txt
}
