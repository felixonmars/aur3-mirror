# Maintainer: scorici <scorici AT yahoo DOT com>
pkgname=hltagconverter
_pkgname=HlTagConverter
pkgver=0.14
pkgrel=3
pkgdesc="Half-Life / Counter-Strike Tag Converter"
arch=(any)
url="http://eydteam.free.fr/dl/$_pkgname"
license=('freeware')
depends=('wine')
makedepends=('sed')
source=("$url/$_pkgname.exe"
        'https://www.dropbox.com/s/knm3rtt7l6h1hc1/mfc42.dll'
        "$url"
        "$_pkgname.png")
md5sums=('9a3e251c255fd74aa507ea6e2008e562'
         'f5eb87f5223e30dcf89816ce655be74c'
         'f74db3891b1d041bd8b4ab32fd04cda1'
         '27e3324d0ac23f3b3c30becf47d73d7d')

package() {
mkdir -p $pkgdir/usr/bin $pkgdir/usr/share/applications $pkgdir/usr/share/$_pkgname
cp $srcdir/mfc42.dll $pkgdir/usr/share/$_pkgname
cp $_pkgname.exe $pkgdir/usr/share/$_pkgname
cp $_pkgname.png $pkgdir/usr/share/$_pkgname
sed 's/<[^>]*>//g' $_pkgname|tail -n +15 > $pkgdir/usr/share/$_pkgname/ReadMe.txt
echo "#!/bin/bash
cd /usr/share/$_pkgname
wine  $_pkgname.exe
exit" > $pkgdir/usr/bin/$_pkgname
echo "
[Desktop Entry]
Version=1.0
Type=Application
Name=$pkgdesc
Comment=Create spray/logo for Half-Life and/or Counter-Strike
Exec=$_pkgname
Icon=/usr/share/$_pkgname/$_pkgname.png
Terminal=false
StartupNotify=false
Categories=Graphics;
" > $pkgdir/usr/share/applications/$_pkgname.desktop
find "$pkgdir"/usr -type f -exec chmod 644 "{}" \;
find "$pkgdir"/usr -type d -exec chmod 755 "{}" \;
chmod +x $pkgdir/usr/bin/$_pkgname
}
