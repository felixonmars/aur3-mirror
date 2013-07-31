pkgname=rhythmbox-plugin-radio-browser
pkgver=3.0
pkgrel=1
pkgdesc="Rhythmbox plugin that shows the radio station lists of icecast and shoutcast directly in rhythmbox"
arch=(any)
url="http://www.radio-browser.info"
license=('GPL3')
depends=('rhythmbox' 'streamripper')
source=(https://dl.dropboxusercontent.com/u/8209982/ArchLinux/rhythmbox-plugin-radio-browser-git.tar.gz)
md5sums=('243d17c8d113fb6feda81d9239d1c78f')

package() {
  cd $srcdir/$pkgname
  make DESTDIR="$pkgdir" install
}
