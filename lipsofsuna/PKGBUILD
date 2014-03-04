# Maintainer: galactic_cowboy
     
pkgname=lipsofsuna
pkgver=0.8.0
pkgrel=1
pkgdesc="A tongue-in-cheek dungeon crawl game that takes place in the chaotic dungeons of Suna."
arch=(i686 x86_64)
url="http://lipsofsuna.org/"
license=('LGPLv3' 'CC BY-SA 3.0')
depends=('bullet>=2.77' 'enet>=1.2.2' 'lua>=5.1' 'sqlite3>=3.6' 'glew>=1.5.5' 'openal' 'libvorbis' 'flac>=1.2.0' 'curl>=7.19' 'ogre>=1.7')
makedepends=('python')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('92bc72aab1236714e31545e930ae16bf')
     
build() {
  cd $srcdir/$pkgname-$pkgver

  ./waf configure \
    --prefix=/usr \
    --relpath=false \
    --optimize=true
  ./waf build
}

package() {
  cd $srcdir/$pkgname-$pkgver

  ./waf install \
    --destdir=$pkgdir
}
