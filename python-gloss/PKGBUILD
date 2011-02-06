# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=python-gloss
pkgver=0.9
pkgrel=1
pkgdesc="easy-to-use graphics wrapper around Pygame that lets you take advantage of OpenGL"
arch=('i686' 'x86_64')
url="http://www.tuxradar.com/gloss"
license=('GPL')
depends=('python-pygame' 'python-opengl')
options=('!libtool')
source=(http://www.tuxradar.com/files/gloss/gloss${pkgver}.tar.gz)
md5sums=('e3722b167db5457e25c7de4018956907')
build() {
  cd ${srcdir}/gloss
  install -Dm644 gloss.py ${pkgdir}/usr/lib/python2.6/site-packages/gloss.py
  install -dm755 ${pkgdir}/usr/share/gloss/
  cp -r COPYING README documentation.html examples skeleton_game.py tutorial.html ${pkgdir}/usr/share/gloss/
  find ${pkgdir} -type d | xargs chmod -R 755
  find ${pkgdir} -type f | xargs chmod -R 644
}
