# Maintainer: Marek Otahal <markotahal gm_ail>
pkgname=festival-czech
pkgver=0.3
pkgrel=1
pkgdesc="Czech support for Festival."
url="http://www.freebsoft.org/festival-czech"
license="GPL2"
arch=(i686 x86_64)
depends=('festival')
#install=voice-czech-ph.install
source=(http://www.freebsoft.org/pub/projects/festival-czech/$pkgname-$pkgver.tar.gz)
md5sums=('83c3dacfe60b3606de8c424e2bc4075f')

build() {
  cd $srcdir/$pkgname-$pkgver
# make||return 1
  install -d 755 $pkgdir/usr/share/festival
  install -m 644 *.scm *.out $pkgdir/usr/share/festival/
# make install festival_path=$startdir/pkg/usr/share/festival
}
