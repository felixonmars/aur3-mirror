# Maintainer: Asma <drake_nt@yahoo.it>
pkgname=gwaei3
pkgver=3.6.1
pkgrel=1
url="http://gwaei.sourceforge.net"
pkgdesc="An English - Japanese dictionary."
arch=('i686' 'x86_64')
license=('GPL')
groups=('extra')
depends=('curl' 'gtk3' 'glib2' 'gnome-doc-utils' 'libunique3' 'ncurses' 'hunspell' 'imagemagick' 'intltool' 'rarian' 'mecab' 'gsettings-desktop-schemas')
optdepends=('ttf-kanjistrokeorders: for kanji stroke order view' 'ttf-arphic-ukai: Kaiti (brush stroke) unicode TTFonts')
conflicts=('gwaei' 'gwaei-git')
install='gwaei3.install'
source=('gwaei-3.6.1.tar.xz::http://downloads.sourceforge.net/project/gwaei/gwaei/3.6.x/gwaei-3.6.1.tar.xz')
md5sums=('c4ee3b3cdce544e5cdd6b85224dc0346')


build() {
 if [ -a $srcdir/gwaei-$pkgver ]
   then
    rm -r $srcdir/gwaei-$pkgver
 fi
 tar xvJf $srcdir/gwaei-$pkgver.tar.xz
 cd $srcdir/gwaei-$pkgver
 ./configure --prefix=/usr --disable-schemas-compile
 make
}

package() {

 cd $srcdir/gwaei-$pkgver
 
 make DESTDIR="$pkgdir" install

}
