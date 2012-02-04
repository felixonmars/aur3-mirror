# Maintainer: Milos Pejovic <pejovic@gmail.com>

pkgname=ttf-resavska-bg
pkgver=1.0
pkgrel=1
pkgdesc="Serif and Sans Serif OpenType Unicode fonts with Serbian style cyrillic cursive letters"
arch=('any')
license=('custom')
url="http://www.tipometar.org/aktuelno/akcija!/ResavskaBG/Index.html"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=resavska.install
source=(http://www.tipometar.org/aktuelno/akcija!/ResavskaBG/img/Resavska%20BG%20OTF.zip
http://www.tipometar.org/aktuelno/akcija!/ResavskaBG/img/Resavska%20BG%20TTF.zip
http://www.tipometar.org/aktuelno/akcija!/ResavskaBGSans/img/Resavska%20BG%20Sans%20OTF.zip
http://www.tipometar.org/aktuelno/akcija!/ResavskaBGSans/img/Resavska%20BG%20Sans%20TTF.zip)
md5sums=('9413ae453914753895f3081b997a8a10'
         '7463e5f4601bcd778a47c3033e02db31'
         '2df01898f81fecd207e3d21d13a89eab'
         'c42bafcd6bf10a2c7e9efc6bce69a418')

build () {
  cd ${srcdir}
  ls -1 *.ttf *.otf | while read _f1; do
    _f2=`echo -n "$_f1" | sed -e 's/ /_/g'`
    
    if [ "$_f1" != "$_f2" ]; then
      mv "$_f1" "$_f2"
    fi
  done
}

package() {  
  cd ${srcdir}
  install -d -m 755 $pkgdir/usr/share/fonts/{OTF,TTF} || return 1  
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF || return 1
  install -m644 *.otf $pkgdir/usr/share/fonts/OTF || return 1
}
