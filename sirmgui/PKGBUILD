# Contributor: Psykopear <psykopear@gmail.com>
pkgname=sirmgui
pkgver=0.2
pkgrel=3
pkgdesc="The gui edition of sirm2, a script manager"
arch=('i686' 'x86_64')
url="http://psykopear.altervista.org"
license=('GPL2')
depends=('gksu' 'bash' 'zenity' 'gtkdialog')
source=(http://psykopear.altervista.org/download/sirmgui/$pkgname-$pkgver.tar.gz)
md5sums=('8126977e1d7681e42c7d0df815069671')


build () {
cd "$startdir/src"
mkdir $startdir/pkg/usr/
mkdir $startdir/pkg/usr/share/
mkdir $startdir/pkg/usr/share/sirmgui/
mkdir $startdir/pkg/usr/share/sirmgui/config/
mkdir $startdir/pkg/usr/share/sirmgui/action/
install -D -m755 sirmgui $startdir/pkg/usr/bin/sirmgui
install -D -m755 ./action/install $startdir/pkg/usr/share/sirmgui/action/
install -D -m755 ./action/remove $startdir/pkg/usr/share/sirmgui/action/
install -D -m755 ./action/backup $startdir/pkg/usr/share/sirmgui/action/
install -D -m755 ./action/restore $startdir/pkg/usr/share/sirmgui/action/
install -D -m755 ./action/edit $startdir/pkg/usr/share/sirmgui/action/
install -D -m755 ./action/aspetto $startdir/pkg/usr/share/sirmgui/action/
install -D -m755 ./action/configura $startdir/pkg/usr/share/sirmgui/action/
install -D -m755 menu $startdir/pkg/usr/share/sirmgui/
}
