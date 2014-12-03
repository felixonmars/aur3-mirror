# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=libbassmix
pkgver=2.4.7.2
pkgrel=2
pkgdesc="An extension providing the ability to mix together multiple BASS channels."
arch=('i686' 'x86_64')
url="http://www.un4seen.com/bass.html#addons"
license=('custom:bassmix')
source=(http://us.un4seen.com/files/bassmix24-linux.zip)
md5sums=('8076bf04b485d0dcf88706fccc5a42b0')

package() {
   cd $srcdir
   # License & docs
   install -Dm644 bassmix.txt $pkgdir/usr/share/licenses/$pkgname/bassmix.txt
   install -Dm644 bassmix.chm $pkgdir/usr/share/doc/$pkgname/bassmix.chm

   # Library
   if [ "${CARCH}" = 'x86_64' ]; then
   install -Dm755 x64/libbassmix.so $pkgdir/usr/lib/libbassmix.so
   elif  [ "${CARCH}" = 'i686' ]; then
   install -Dm755 libbassmix.so $pkgdir/usr/lib/libbassmix.so
   fi

   # Header file
   install -Dm644 bassmix.h $pkgdir/usr/include/bassmix.h
}

