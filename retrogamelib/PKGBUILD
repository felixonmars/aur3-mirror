# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=retrogamelib
pkgver=0.2
pkgrel=1
pkgdesc="A library for creating retro NES/GameBoy style games"
arch=('i686' 'x86_64')
url="http://$pkgname.googlecode.com/"
license=('LGPL')
depends=('python-pygame')
install=$pkgname.install
source=($url/files/$pkgname-$pkgver.zip)
md5sums=('dd7adb0c33e066aca4d4e1583dadbecc')

build() {
  cd $pkgname

  mkdir -p "$pkgdir"/usr/{lib/python2.6,share/$pkgname}
  cp -rf $pkgname/ "$pkgdir"/usr/lib/python2.6/

  cp -rf example.py data/ BubbMan/ Kontra/ "$pkgdir"/usr/share/$pkgname/
  mkdir -p "$pkgdir"/usr/share/doc
  cp -rf docs/ "$pkgdir"/usr/share/doc/$pkgname/

  find "$pkgdir" -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
