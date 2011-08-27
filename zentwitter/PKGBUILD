# Contributor: Isengrin L. Feuille <Autumnspeech@gmail.com>
pkgname=zentwitter
pkgdesc="A small bash script to update your Twitter status"
pkgver=1
pkgrel=2
arch=('i686' 'x86_64')
url="http://www.chimeric.de/projects/zentwitter"
license=('GPL')
depends=('zenity' 'curl' 'sed')
source=('zentwitter')
md5sums=('f3f1007daab581c164d31debce0a979b')

build() {
  cd "$startdir/"
  mkdir -p $startdir/pkg/usr/bin/
  cp zentwitter $startdir/pkg/usr/bin/zentwitter
  chmod +x $startdir/pkg/usr/bin/zentwitter
}
