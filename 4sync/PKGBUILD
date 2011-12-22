# Maintainer: wandrian <wandrian@tuxfamily.org>
# Contributor: wandrian <wandrian@tuxfamily.org>
# You could find binary package for i686 on the "remmirath" repository
# Add this lines to your /etc/pacman.conf
# [remmirath]
# http://download.tuxfamily.org/remmirath/"

pkgname=4sync
pkgver=1.3
pkgrel=1
pkgdesc="4Sync (desktop4shared) is an amazing free application by 4shared.com that links all of your computers together"
arch=(i686)
url="http://www.4sync.com"
license=('Freeware')
depends=('java-runtime' 'java-environment' 'groovy')
#conflicts=()
source=('http://dc399.4shared.com/download/x3JqSRo1/desktop4shared-13_1-all.deb')
md5sums=('fb2bef8791d4eb9a2fe8494448ea6e73')

build() {
  cd $srcdir

  ar -vx desktop4shared-13_1-all.deb

  cd $pkgdir
  
  tar -xzvf $srcdir/data.tar.gz

}
