# Maintainer: bsdbeard <roma.kvl at gmail dot com>>
# Contributor: SaThaRiel <sathariel74[at]gmail[dot]com>
pkgname=unangband
pkgver=0.6.4b
pkgrel=1
pkgdesc="Don't let the name fool you: The Unnamed Angband has no shortage of distinct flavour that sets it apart from any other variant."
arch=('i686' 'x86_64')
url="http://unangband.blogspot.com/"
license=('GPL')
depends=('libx11')
source=(http://dl.dropboxusercontent.com/s/etg6dkgbcqpsid6/unangband-064b-src.zip)
md5sums=('ce4886b5a2398644951302ff6dc642f4')
 
build() {
  cd $srcdir/unangband-064-src/src
  cp Makefile.std Makefile
  mv config.h config.h.org
  sed -e 's/\#\ define\ DEFAULT_PATH\ \"\.\/lib\/\"/\#\ define\ DEFAULT_PATH\ \"\/usr\/lib\/unangband\/\"/' config.h.org > config.h
  find . -type f -exec touch {} \;
  make || return 1
}

package() {
  cd $srcdir/unangband-064-src/src
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
  echo "Add your user to the group games!"
}
