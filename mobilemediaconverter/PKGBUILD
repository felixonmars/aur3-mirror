#Contributors:
#Murtuza Akhtari <inxsible at gmail dot com>
#Franco Pierre <nob dot dir dot info at gmail dot com>

pkgname=mobilemediaconverter
pkgver=1.8.5
pkgver_short=185
pkgrel=1
pkgdesc="Converts mp3, wma, ogg, wav audio files to AMR files and vice-versa. Converts wmv, mpeg, wmv, avi, flv video files to 3GP and vice-versa."
arch=('i686' 'x86_64')
url="http://www.miksoft.net/mobileMediaConverter.htm"
license=('GPL')
source=(http://www.miksoft.net/products/mmc-older/mmc-lin-185.zip
  $pkgname.desktop
  $pkgname.png
  $pkgname.sh)

md5sums=('f4bd236283806f3b2cbe9286a2002713'
         'abf43403d28747cc90ba8e7b28eac6c1'
         '9d4309f98f3689dfc21e641e5773cfd7'
         '43a031a6070f42f357a47c48123ebaac')

if [ "${CARCH}" == 'x86_64' ]; then
    ARCH='amd64'
    depends=('lib32-zlib' 'lib32-gtk2' 'lib32-glib2')
else
    ARCH='i386'
    depends=('zlib' 'gtk2' 'glib2')
fi

package() {
  mkdir -p "$pkgdir/usr/lib/$pkgname/"
  mkdir -p "$pkgdir/usr/share/$pkgname/"
  mkdir -p "$pkgdir/usr/share/$pkgname/icons/"
  mkdir -p "$pkgdir/usr/share/$pkgname/profiles/"

  cp -r "$srcdir/lib/icons/" "$pkgdir/usr/share/$pkgname/icons"
  cp -r "$srcdir/lib/profiles/" "$pkgdir/usr/share/$pkgname/profiles"

  cp -r "$srcdir/lib/mmc Libs/" "$pkgdir/usr/lib/$pkgname"

  install -Dm755 "$srcdir/lib/mmc" "$pkgdir/usr/lib/$pkgname/mmc"
  install -Dm755 "$srcdir/lib/youtube-dl" "$pkgdir/usr/lib/$pkgname/youtube-dl"
  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
