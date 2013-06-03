# Maintainer: <chris.fordham@rightscale.com>

pkgname=rightscale-cloud
pkgver=0.1.2
pkgrel=1
pkgdesc='RightScale RightLink cloud support.'
arch=(any)
url=http://rightscale.com/
license=(Apache 2)
depends=()
makedepends=()
conflicts=()
options=()
source=(
  cloud
)
md5sums=('d88319dfa5d204f019b4284149886c59')        # generate with 'makepkg -g'

package() {
	install -D "$startdir/cloud" "$pkgdir/etc/rightscale.d/cloud"
}

# vim:syntax=sh