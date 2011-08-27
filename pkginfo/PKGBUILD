# Contributor: Markku <rasat@user-contributions.org>

pkgname=pkginfo
pkgver=0.6
pkgrel=1
pkgdesc="Arch Linux Package Information."

url="http://user-contributions.org/projects/pkginfo"
depends=('pkgdata' 'bash' 'cvsup' 'ruby' 'ruby-libglade' 'ruby-gtk2' 'xterm' 'sudo' 'gksu')

source=(http://user-contributions.org/projects/pkginfo/src/$pkgname-$pkgver.tar.gz)
md5sums=('97762eee55a1428df87458c42a098e31')

build() {
  cd $startdir/src/$pkgname-$pkgver
  cp -R $startdir/src/$pkgname-$pkgver/usr $startdir/pkg/ || return 1
}
