# Maintainer: archtux <antonio dot arias99999 at gmail.com>

# Contributor : TuxSpirit <tuxspiritATarchlinuxDOTfr>
# Contributor : Benjamin Stier <bs@kniegeil.de>
# Contributor : Christoph Siegenthaler <csi@gmx.ch>
# Contributor : bugix
# Contributor : Roberto Barreda 
# Contributor : Jens Maucher <defcon@archlinux.us>

pkgname=bin32-zattoo
_real_name=zattoo
pkgver=4.0.5
pkgrel=4
pkgdesc="Watch television over your broadband Internet connection. (Account required, registration on http://zattoo.com)"
arch=('x86_64')
url="http://zattoo.com/"
license=('custom')
depends=('lib32-qtwebkit')
provides=('zattoo')
conflicts=('zattoo')
install=zattoo.install
source=(http://download.zattoo.com/$_real_name-$pkgver-i386.deb
        LICENSE
        zattoo.install)
md5sums=('5fc6e9bebebf7b990ce0b37ea73fca60'
         'bfd7fe899abba912128021bb42803e20'
         'b8555b6e533bcc7711a0728d37201ada')

build() {

   cd $srcdir

   # Extract DEB package
   bsdtar xf $_real_name-$pkgver-i386.deb
   bsdtar xf data.tar.gz -C $pkgdir

   # Symlink to executable
   cd $pkgdir/usr/bin
   ln -s Zattoo zattoo

   # Remove Zattoo's own libQt
   rm $pkgdir/usr/lib/zattoo/libQt*  

   # License
   install -Dm644 $startdir/LICENSE $pkgdir/usr/share/licenses/$_real_name/LICENSE       
}