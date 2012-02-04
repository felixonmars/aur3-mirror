# Maintainer: Thomas S Hatch <thatch45 (at) Gmail.com>

pkgname=facter-ruby1.9
pkgver=1.5.8
pkgrel=1
pkgdesc="A library for collecting facts about your system."
arch=("any")
url="http://puppetlabs.com/projects/facter/"
license=("GPL")
depends=("ruby")
conflicts=("facter")
options=(!emptydirs)
source=(http://puppetlabs.com/downloads/facter/facter-${pkgver}.tar.gz)
md5sums=('4dd4daebc59fa985b8aa7eb247ac4030')

package() {
  cd $srcdir/facter-$pkgver

  ruby ./install.rb \
      --destdir=$pkgdir \
      --bindir=/usr/bin \
      --sbindir=/usr/sbin
  
}
