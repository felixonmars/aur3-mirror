# Maintainer: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=narcissu-bin
pkgver=1
pkgrel=4
pkgdesc="A Japanese visual novel game telling the story of a terminally ill young man and woman"
url="http://narcissu.insani.org/"
license="GPL"
arch=('i686' 'x86_64')
source=(http://narcissu.gwathyr.net/NarcissuSetup[insani+Haeleth].tar.bz2 narcissu.desktop \
narcissu.sh narcissu.xpm)
md5sums=('725a6168aed4a6a575f014c6e5110fa5' '25ea4f69b087a0850cdccbf4879347a2'\
         '5b8814cc3a2eae628233129a8d3f10ee' '7582c1e98624d8c76b23c535d34b1705')
install=narcissu.install

build() {
  cd $srcdir

  # Rename directory, copy content, and change directory permissions
  # so that users in the games group can write save data
  mv narcissu_web_edition narcissu
  install -d $pkgdir/opt/narcissu
  cp -r narcissu $pkgdir/opt
  chown root:games $pkgdir/opt/narcissu
  chmod 2775 $pkgdir/opt/narcissu

  # Install desktop entry files and bash script
  install -D -m644 narcissu.desktop $pkgdir/usr/share/applications/narcissu.desktop
  install -D -m644 narcissu.xpm $pkgdir/usr/share/pixmaps/narcissu.xpm
  install -D -m755 narcissu.sh $pkgdir/usr/bin/narcissu
}
# vim:set ts=2 sw=2 et

