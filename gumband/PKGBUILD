# Contributor: SaThaRiel <sathariel74[at]gmail[dot]com>
pkgname=gumband
pkgver=2.3.2
pkgrel=2
pkgdesc="Gumband's primary feature is that it is set in the Multiverse of Michael Moorcocks Eternal Champion sword and sorcery tales, the best known of which is the saga of Elric."
arch=('i686' 'x86_64')
url="http://angband.oook.cz/variants.php?variant=gumband"
license=('custom')
depends=('ncurses' 'libx11')
source=(http://angband.oook.cz/gumband/gumband-232-src.zip)
md5sums=('8b75261b7b13a52fd0632c51bda84c0b')
 
build() {
  cd $srcdir/gumband-232-src/src
  sed -e 's/LIBS\ =\ -L\/usr\/X11R6\/lib\ -lX11\ -lcurses\ -ltermcap/LIBS\ =\ -L\/usr\/lib\ -lX11\ -lcurses/g' makefile.std > Makefile
  mv config.h config.h.org
  sed -e 's/\#\ define\ DEFAULT_PATH\ \"\.\/lib\/\"/\#\ define\ DEFAULT_PATH\ \"\/usr\/lib\/gumband\/\"/' config.h.org > config.h
  make || return 1
  install -d "$pkgdir/usr/bin/" || return 1
  install -d "$pkgdir/usr/lib/$pkgname" || return 1
  cp -p ../$pkgname "$pkgdir/usr/bin/" || return 1
  cp -rp ../lib/* "$pkgdir/usr/lib/$pkgname/" || return 1
  chown -R root:games "$pkgdir/usr/lib/$pkgname/"
  chmod 775 "$pkgdir/usr/lib/$pkgname/apex"
  chmod 775 "$pkgdir/usr/lib/$pkgname/save"
  chmod 775 "$pkgdir/usr/lib/$pkgname/data"
  find $pkgdir/usr/lib/$pkgname/ -name delete.me -exec rm {} \;
  find $pkgdir/usr/lib/$pkgname/ -name 'Makefile*' -exec rm {} \;
}
