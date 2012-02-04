# Maintainer: Gianfranco 'Gianfrix' Micoli <gianfrix.mg@gmail.com>

# Modify this line to choose your language
_lang=it
pkgname=indicator-language-pack
pkgver=10.10+20100930
pkgrel=1
pkgdesc="Language pack for Indicator Applets. Edit the PKGBUILD before compiling to choose your own language."
arch=(i686)
url="http://www.ubuntu.com"
license=('GPL')
depends=('indicator-applet')
source=(http://archive.ubuntu.com/ubuntu/pool/main/l/language-pack-$_lang-base/language-pack-$_lang-base_$pkgver.tar.gz
http://archive.ubuntu.com/ubuntu/pool/main/l/language-pack-gnome-$_lang-base/language-pack-gnome-$_lang-base_$pkgver.tar.gz
po-list-base
po-list-gnome-base)

build() {
  msg "Creating language pack for language $_lang"
  cd "$srcdir/language-pack-$_lang-base/data/$_lang/LC_MESSAGES"
  cat $srcdir/po-list-base | xargs -iXXX msgfmt -o $srcdir/XXX.mo XXX.po
  cd "$srcdir/language-pack-gnome-$_lang-base/data/$_lang/LC_MESSAGES"
  cat $srcdir/po-list-gnome-base | xargs -iXXX msgfmt -o $srcdir/XXX.mo XXX.po
  msg "Done!"
}

package() {
  install -d $pkgdir/usr/share/locale/$_lang/LC_MESSAGES
  cp -vr $srcdir/*.mo $pkgdir/usr/share/locale/$_lang/LC_MESSAGES
}

# You have to generate your own MD5s! This one is for italian language. DON'T change po-list* files!
md5sums=('f4b1a67a39c778d5e79abd41f5d0beb6'
         'e4aa203649ccb13c428639513ab99b0f'
         '49a6d8de80afd6596f126c3300608243'
         'adddf627253f4d811f4a1ca2f25a6da2')
