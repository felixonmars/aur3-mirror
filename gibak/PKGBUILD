# Contributor: DonVla <donvla@users.sourceforge.net>
# Contributor: Dave Pretty <david d o t pretty a t gmail d o t com>

pkgname=gibak
pkgver=0.3.0
pkgrel=3
pkgdesc="A better backup system based on Git"
arch=(i686 x86_64)
url="http://eigenclass.org/hiki/gibak-backup-system-introduction"
license=('GPL')
depends=('git' 'rsync')
makedepends=('omake')
#install=$pkgname.install
source=(http://eigenclass.org/static/gibak/$pkgname-$pkgver.tar.gz OMakefile.patch git-1.6_undashed_commands.patch gist.patch)
md5sums=('e3c14b5c1fe92cdcb3effd58c68e0793' 'e1f62e2b857741398150ff63bedd214e' '80277d1aa3f4d00d013a7204c780d8d2' '8ade9127b7b24efd96adb398ef5dc19a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np0 < ../OMakefile.patch
  patch -Np1 < ../git-1.6_undashed_commands.patch
  patch -Np1 < ../gist.patch
  omake || return 1
  install -D -m 0755 find-git-files $pkgdir/usr/bin/find-git-files
  install -m 0755 find-git-repos $pkgdir/usr/bin/find-git-repos
  install -m 0755 gibak  $pkgdir/usr/bin/gibak
  install -m 0755 ometastore  $pkgdir/usr/bin/ometastore
  install -D -m 0644 README.txt $pkgdir/usr/share/gibak/README
}
# vim:set ts=2 sw=2 et:
