# Maintainer: Profpatsch <mail[at]profpatsch[dot]de>
pkgname=simple-plotting
pkgver=0.1.0
pkgrel=1
pkgdesc="A pair of scripts for making simple plots from the command line."
url="https://github.com/drdrang/simple-plotting"
arch=('any')
license=('unknown')
depends=('python' 'python-matplotlib' 'python-numpy')
source=("git+https://github.com/drdrang/simple-plotting.git")
install="simple-plotting.install"
md5sums=('SKIP')

package() {
  cd ${pkgname}
  target="$pkgdir/usr/bin"
  mkdir -p "$target"

  install plot "$target"
  install pplot "$target"
}
