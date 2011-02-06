pkgname=emesene-smilies
pkgver=1.0.0
pkgrel=1
pkgdesc="Emesene Smiley Themes" 
arch=('i686' 'x86_64')
license=("unknown")
url="http://emesene.org/trac/wiki/Themes"
depends=(emesene)
source=('http://www.emesene.org/trac/raw-attachment/wiki/Themes/Gajim-big.tar.gz'
		'http://www.emesene.org/trac/raw-attachment/wiki/Themes/Gajim-small.tar.gz'
		'http://www.emesene.org/trac/raw-attachment/wiki/Themes/MSN.tar.gz')
md5sums=('78c46d05ad7847c1b9b5977ceb0dce10'
         '3fdcf7aa85ecffb8f1c8a60cfe178dfd'
         'a3e69f346dd4d573b222d8d352a99434')

build() {
  cd $startdir/src/
  rm *.tar.gz
  mkdir -p $startdir/pkg/usr/share/emesene/smilies
  cp -r $startdir/src/* $startdir/pkg/usr/share/emesene/smilies/
  find $startdir/pkg -type d -exec chmod 755 {} \;
  find $startdir/pkg -type f -exec chmod 644 {} \;
}
