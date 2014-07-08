# Maintainer: Maxim Kraev <maxim.kraev@gmail.com>

pkgname=chef-dk
pkgver=0.1.0
pkgrel=1
_ubuntuver=raring
_ubunturel=4
pkgdesc="The Chef Development Kit contains everything you need to start using Chef along with the tools essential to managing the code that runs your business."
arch=('x86_64')
url="http://www.getchef.com/downloads/chef-dk/linux/"
license=('unknown')
depends=()
conflicts=()
source=("https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/13.10/x86_64/chefdk_0.1.0-1_amd64.deb")
sha512sums=('31b4567ca02c5c171cdc039f76a223e4c487c42f6a686b6cde65fbc13c231f64e4f904b35f8ed0026ed156a411eefa97dcdba6102d9df2d2444b2cd7437dde1a')


package() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz -C "$pkgdir"

}