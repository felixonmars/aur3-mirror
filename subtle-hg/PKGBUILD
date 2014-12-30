# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: unexist <unexist@subforge.org>
# Contributor: manveru <m.fellinger@gmail.com>
# Contributor: Xilon <xilonmu@gmail.com>
# Contributor: belak <kelwert@mtu.edu>

pkgname=subtle-hg
pkgver=0.11.r3243
pkgrel=1
pkgdesc='A grid-based manual tiling window manager with a strong focus on easy but customizable look and feel'
arch=(i686 x86_64)
url='http://subtle.subforge.org'
license=(GPL)
depends=(ruby libxrandr libxft libxpm libxinerama libxtst)
makedepends=(mercurial pkg-config)
provides=("subtle")
conflicts=("subtle")
backup=(etc/xdg/subtle/subtle.rb)
source=(hg+http://hg.subforge.org/subtle)
md5sums=('SKIP')

pkgver() {
  cd subtle
  echo 0.11.r$(hg identify -n)
}

prepare() {
  cd subtle
  # Use vendor_ruby instead of site_ruby
  sed -e \
    's/RbConfig::CONFIG\["sitelibdir"\]/RbConfig::CONFIG\["vendorlibdir"\]/' \
    -i Rakefile
}

package() {
  cd subtle
  rake destdir="$pkgdir" install
  install -D -m644 data/subtle.desktop "$pkgdir"/usr/share/xsessions/subtle.desktop
}
