# Contributor: Alessio 'mOLOk' Bolognino <themolok@gmail.com>
pkgname=musicextras
pkgver=0.6.8
pkgrel=1
pkgdesc="a program for automatically retrieving extra information for songs"
arch=('i686')
license="GPL"
url="http://musicextras.divineinvasion.net/"
license=""
depends=('ruby' 'ruby-mp3info' 'ruby-gnome2' 'ruby-libglade' 'ruby-atk' 'ruby-gdkpixbuf2')
source=(http://musicextras.divineinvasion.net/$pkgname-$pkgver.tar.gz)
md5sums=('3ea5d78442d08169583d9794a5be1b02')
build() {
  cd $startdir/src/$pkgname-$pkgver
  ruby setup.rb config
  ruby setup.rb setup
  ruby setup.rb install --prefix=$startdir/pkg

}
