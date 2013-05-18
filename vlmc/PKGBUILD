# Maintainer: speps <speps at aur dot archlinux dot org>

_comm=38c77f5
pkgname=vlmc
pkgver=0.2.0_git_$_comm
pkgrel=1
pkgdesc="A Video Editor based on VLC"
arch=(i686 x86_64)
url="http://www.videolan.org/vlmc/"
license=('GPL')
depends=('vlc' 'frei0r-plugins')
makedepends=('cmake')
install="$pkgname.install"
source=("http://repo.or.cz/w/vlmc.git/snapshot/38c77f5f1496ea9ade43b082168ff13b07ad42c6.tar.gz")
#source=("http://git.videolan.org/?p=vlmc.git;h=a8fb2e9;a=snapshot;sf=tgz")
md5sums=('33025a020775c48cb351cb4c5a2843c3')

build() {
  cd "$srcdir/$pkgname"
  [ -d bld ] || mkdir bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Relesase
  make
}

package() {
  cd "$srcdir/$pkgname/bld"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
