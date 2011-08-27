# Contributor: Matthew Sharpe <matt.sharpe@gmail.com>
pkgname=ljklient
pkgver=0.1.172
pkgrel=1
pkgdesc="A KDE LiveJournal client."
arch=('i686' 'x86_64')
url="http://ljklient.sourceforge.net"
license=('GPL')
depends=('kdelibs>=3.5.4' 'python>=2.4' 'pykde')
source=("http://dl.sourceforge.net/sourceforge/ljklient/$pkgname-$pkgver.tar.bz2")
md5sums=('75fd8bbdd27ca95eed3d6e03e4dd9f2a')

build() {
  cd $startdir/src/$pkgname

# Copy pre-arranged file structure
  cp -R usr/ $startdir/pkg/

# Edit the desktop file to go in the corrent place for KDE
  sed -ie "s/=N/=Internet;N/" $startdir/pkg/usr/share/applications/ljKlient.desktop

# Remove backup file
  rm $startdir/pkg/usr/share/applications/ljKlient.desktope

}
