
# Contributor: mrbit
pkgname=gkrellshoot_
pkgver=0.4.4
pkgrel=1
pkgdesc="A plugin for GkrellM for screen lock and screen shoot"
arch=('i686' 'x86_64')
license=('GPL')
depends=('imagemagick' 'gkrellm' 'gtk2')
source=(https://answers.launchpad.net/ubuntu/hardy/+source/gkrellshoot/0.4.4-1/+files/$pkgname$pkgver.orig.tar.gz)
url="http://gkrellshoot.sourceforge.net/"
md5sums=('aa5d16c2a284e018dbab532bec44a0d6')

build() {
  cd $srcdir/gkrellShoot-$pkgver
   make || return 1
   install -d $srcdir/pkg/usr/lib/gkrellm2/plugins
   install -D -m755 gkrellshoot.so $pkgdir/usr/lib/gkrellm2/plugins/gkrellshoot.so
}
