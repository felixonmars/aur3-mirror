# Mantedor: Phillipe Smith - phillipe@archlinux.com.br
pkgname=michaelvis
pkgver=1.3
pkgrel=1
pkgdesc="Dictionary of meanings for linux."
arch=('i686' 'x86_64')
url=("http://ateliedematematica.blogspot.com/")
depends=('zenity' 'sed' 'lynx')
license=('GPL')
source=("http://dellalibera.sourceforge.net/michaelvis/1.3/michaelvis_1.3_all.deb")
md5sums=('d70a69dc895c56075bbe8d873c4d8532')

build()
{
	mkdir -p $pkgdir/var/cache/michaelvis
	DIR=$pkgdir/var/cache/michaelvis
	for i in  a b c d e f g h i j k l m n o p q r s t u v w x y z
		do
		mkdir -p $DIR/ingles/ingles/$i $DIR/ingles/portugues/$i
		mkdir -p $DIR/espanhol/espanhol/$i $DIR/espanhol/portugues/$i
		mkdir -p $DIR/alemao/alemao/$i $DIR/alemao/portugues/$i
		mkdir -p $DIR/frances/frances/$i $DIR/frances/portugues/$i
		mkdir -p $DIR/italiano/italiano/$i $DIR/italiano/portugues/$i
		mkdir -p $DIR/significados/$i
		mkdir -p $DIR/nomesproprios/$i
		done
	chmod -R 777 $pkgdir/var/cache/michaelvis
	chmod g+s $pkgdir/var/cache/michaelvis

	cd $srcdir

	ar -x michaelvis_1.3_all.deb

	rm -rf control.tar.gz debian-binary

	tar -zxvf data.tar.gz

	cp -rf usr etc $pkgdir

}
