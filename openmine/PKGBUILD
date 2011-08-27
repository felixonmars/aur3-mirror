# Maintainer: Bartlomiej Palmowski (Rotwang), maks1k at wp dot pl
pkgname=openmine
pkgver=0.2.0b
pkgrel=2
pkgdesc="3D Minesweeper"
arch=('i686')
license=('GPL')
url=("http://openmine.sourceforge.net/")
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
openmine.png
openmine.desktop)
depends=('sdl')
md5sums=('d581c7a83b7ab11bf36a0afe56985233'
         'ad5c39576d20c0c6fd26cf7108acd57c'
         'e93a0b832699680efe51f696d2cb4b00')

build() {
cd $pkgname-$pkgver
# patch the source, so openmine executable can "see" it's files (kudos to brebs)
sed -i -e '/#define RC_FILE/s/mines.conf/\/usr\/share\/openmine\/mines.conf/' main.c
sed -i -e '/#define THEME_IMAGE/s/.\/images/\/usr\/share\/openmine\/images/' main.c
chmod 0755 images
./configure
make
mkdir -p $startdir/pkg/usr/share/$pkgname/images/{caco,classic}
install -D -m 0755 $pkgname $startdir/pkg/usr/bin/$pkgname
install -m 0644 mines.conf $startdir/pkg/usr/share/$pkgname/mines.conf
install -D -m 0644 ../$pkgname.desktop $startdir/pkg/usr/share/applications/$pkgname.desktop
install -D -m 0444 ../$pkgname.png $startdir/pkg/usr/share/pixmaps/$pkgname.png
cd images/caco
for i in *.bmp
do
install -m 0444 "$i" $startdir/pkg/usr/share/$pkgname/images/caco/"$i"
done
install theme.conf $startdir/pkg/usr/share/$pkgname/images/caco/theme.conf
cd ../classic
for i in *.bmp
do
install -m 0444 "$i" $startdir/pkg/usr/share/$pkgname/images/classic/"$i"
done
install theme.conf $startdir/pkg/usr/share/$pkgname/images/classic/theme.conf
}
