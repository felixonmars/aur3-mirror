# Contributor: Jakub Luzny <limoto94@gmail.com>

pkgname=fatrat-czshare
pkgver=1.1.2
pkgrel=1
pkgdesc='FatRat plugin for downloading and uploading on CZshare.com'
arch=(i686 x86_64)
url='http://fatrat.dolezel.info/'
license=('GPL')
makedepends=('cmake')
depends=('fatrat>=1.1')
provides=('fatrat-czshare')
conflicts=('fatrat-czshare-git')
groups=('fatrat-plugins-git')
replaces=('fatrat-czshare-svn')
source=(http://www.dolezel.info/download/data/fatrat-czshare/fatrat-czshare-$pkgver.tar.gz)
md5sums=('627a7b06229d9d61ccc93406eb24c367')

build() {
  cd $srcdir/fatrat-czshare-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DWITH-NLS=ON
  make || return 1
  make DESTDIR="$pkgdir" install
}

#category: network
# vim:set ts=2 sw=2 et:
