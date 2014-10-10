# Maintainer: Maxim Kraev <maxim.kraev@gmail.com>

pkgname=chef-dk
pkgver=0.3.0
pkgrel=1
_ubuntuver=raring
_ubunturel=4
pkgdesc="The Chef Development Kit contains everything you need to start using Chef along with the tools essential to managing the code that runs your business."
arch=('x86_64')
url="http://www.getchef.com/downloads/chef-dk/linux/"
license=('unknown')
depends=()
conflicts=( chef chef-solo )
source=("http://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.3.0-1_amd64.deb")
sha512sums=('3e7e4c39d13e48724d96610999139e7207ea8cc907ab37cd4508a47c246a6793b6c843fd3ba9823076bf3973939f943a0796258f70640cfb1c0308ef179436b1')


package() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # cleanup .git folders, any idea why they are in the package?
  find $pkgdir -name ".git" | xargs  rm -rf

  # link executables
  binaries="chef chef-solo chef-apply chef-shell knife shef ohai berks chef-zero fauxhai foodcritic kitchen rubocop strain strainer chef-client"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -sf /opt/chefdk/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
}