# Maintainer: Michal Gawronski <dinth1906@gmail.com>

pkgname=parcellite-ubuntu-mono-icon
pkgver=1.0
pkgrel=1
pkgdesc="Dropbox 0.8x icons for ubuntu-mono icon theme - light & dark version."
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/Dropbox+Ubuntu+Mono?content=124435"
license=('CC-BY-30')
depends=('ubuntu-mono' 'parcellite' 'humanity-icon-theme' 'humanity-dark-icons')
makedepends=('p7zip')
provides=()
conflicts=('parcellite-ubuntu-mono-light')
source=('http://fc06.deviantart.net/fs71/f/2010/107/f/c/Ubuntu_Mono_Parcellite_Icon_by_Ramzea.7z')
md5sums=('6d871f17a404f022f9a3b03c80e9e17d')

build() {
  cd $srcdir
  7z e -y ./Ubuntu_Mono_Parcellite_Icon_by_Ramzea.7z
  mkdir -p $pkgdir/usr/share/icons/Humanity-Dark/actions/24/
  mkdir -p $pkgdir/usr/share/icons/Humanity/actions/24/
  cp ./gtk-paste.svg $pkgdir/usr/share/icons/Humanity-Dark/actions/24/gtk-paste.svg
  cp ./gtk-paste2.svg $pkgdir/usr/share/icons/Humanity/actions/24/gtk-paste.svg
}
