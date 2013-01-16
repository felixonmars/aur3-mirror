# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Michael S. Walker <barrucadu@azathoth>
pkgname=rmahjong  
pkgver=0.4
pkgrel=2
pkgdesc="Riichi Mahjong is the Japanese variant to the Chinese game for four players. RMahjong is the computer implementation of this game. RMahjong allows to play the game over a network, missing players can be replaced by computer players."
url="http://rmahjong.kreatrix.org/index.php"
arch=('x86_64')
license=('GPL')
depends=('python2' 'python2-pygame' 'python2-opengl')
source=(http://rmahjong.kreatrix.org/${pkgname}-${pkgver}.tar.bz2
        tfa.diff
        log.diff)
sha1sums=('191e6a88ec122f28a37c630aa0c7727c77f16ff5'
          'b5e92ef6ef27c3d1be1a1b7f77661c43bb87c5a2'
          '5118664210e4018be7c736d9d5b6530e97fae8d1')

build() {
  cd $srcdir/$pkgname-$pkgver

  # Fix reference to GL_TEXTURE_MAX_ANISOTROPY_EXT
  patch -p1 -i $srcdir/tfa.diff

  # Fix attempt to log in install directory
  patch -p1 -i $srcdir/log.diff

  ./build.sh

  # Fix directory references and python binary
  sed -i 's:`dirname client/$0`:/usr/lib/rmahjong/client:' start.sh
  sed -i 's:exec python:exec python2:' start.sh

  sed -i 's:`dirname $0`:/usr/lib/rmahjong/server:' server/run_server.sh
  sed -i 's:exec python:exec python2:' server/run_server.sh
}

package() {
  cd $srcdir/$pkgname-$pkgver

  install -dm755 $pkgdir/usr/lib/rmahjong
  install -dm755 $pkgdir/usr/bin

  cp -a * $pkgdir/usr/lib/rmahjong

  # Rename the client/server start scripts to something descriptive
  install -m755 start.sh $pkgdir/usr/bin/rmahjong
  install -m755 server/run_server.sh $pkgdir/usr/bin/rmahjong-server
}
