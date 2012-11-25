# Mantainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Smartboyathome <smartboyathome@gmail.com>
# Contributor: Gianni Vialetto <g.vialetto@gmail.com> 

pkgname=easy-e17
pkgver=1.4.1
pkgrel=2
pkgdesc="A script to easily install and update E17 from SVN."
arch=(any)
url="http://omicron.homeip.net/projects/#easy_e17.sh"
license=('BSD')
depends=('subversion' 'xorg-server' 'libjpeg' 'freetype2' 'libpng' 'svn' 'libxml2' 'imlib2')
provides=('e')
conflicts=('e' 'e-svn')
install=easy_e17.install
source=("easy_e17.sh" "easy_e17.conf" "depend.patch")
md5sums=('d1a83fccac1ded91003874251e7a1242'
         '78d67066cc4d2a15b94dce25b20e2158'
         'e9674afce7f64249c1b7eb9cbbfe4bcd')

build() {
   cd $srcdir
   mkdir -p $pkgdir/usr/bin/ 
   mkdir -p $pkgdir/etc/
   install -D easy_e17.sh $pkgdir/usr/bin/
   install -D easy_e17.conf $pkgdir/etc/easy_e17.conf
}

