#Maintainer: Alexandre Chataignon <alexandre@chataignon.net>
#Contributor: Sebastien Duquette <ekse.0x@gmail.com>
#Contributor: Marc Poiroud <marci1@archlinux.fr>
pkgname=verbiste-gnome
pkgver=0.1.33
pkgrel=1
pkgdesc="Generates conjugations of french verbs - with gnome-panel applet"
url="http://sarrazip.com/dev/verbiste.html"
license="GPL"
depends=('libxml2' 'gtk2' 'gnome-panel' 'libgnomeui' 'libpanelappletmm')
makedepends=('perlxml')
conflicts=('verbiste')
arch=('i686' 'x86_64')
source=("http://perso.b2b2c.ca/sarrazip/dev/verbiste-$pkgver.tar.gz")
md5sums=('9157b90da88350718ba07d5e57ff698d')

build() {
  cd $startdir/src/verbiste-$pkgver
  ./configure --prefix=/usr --with-gnome-app --with-gnome-applet
# ./configure --prefix=/usr # console support only
  make || return 1
  make DESTDIR=$startdir/pkg install
}
