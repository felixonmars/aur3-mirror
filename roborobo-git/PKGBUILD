# Contributor: jurkan <Jurkan@gmx.de>
pkgname=roborobo-git
pkgver=20100411
pkgrel=1
pkgdesc="A little backuprobot. After pointing him to a file he will take care of it all the time. (latest from the git master branch)"
arch=('any')
url="http://github.com/noqqe/roborobo/"
license=('GPL3')
depends=()
optdepends=()
makedepends=('git')
provides=('roborobo')
conflicts=()
source=()
md5sums=()
backup=('etc/roborobo/roborobo.conf'
	'etc/roborobo/roborobo.path')
install=('roborobo.install')

_gitroot='git://github.com/noqqe/roborobo.git'

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"
}

package() {
  cd $srcdir/$pkgname-$pkgver

  mkdir $pkgdir/etc
  cp -R etc/roborobo/ $pkgdir/etc/
  cp -R usr/ $pkgdir/
}
