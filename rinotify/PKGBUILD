pkgname="rinotify"
pkgver=0.9
pkgrel=1
pkgdesc="A Ruby extension for the Linux inotify kernel subsystem. Provides everything you need to monitor files and directories for changes."
arch=('i686' 'x86_64')
url="http://rubyforge.org/projects/rinotify/"
license="GPL"
depends=(ruby)
makedepends=()
source=("http://rubyforge.org/frs/download.php/19777/rinotify.tar.gz")
md5sums=('2e0148194ac7d482e0dbf70bd1617b47')

build() {
  cd "$startdir/src/rinotify"
  ruby extconf.rb || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
