# Maintainer: Maxim Kraev <maxim.kraev@gmail.com>

pkgname=chef-dk
pkgver=0.5.1
pkgrel=2
_ubuntuver=raring
_ubunturel=4
pkgdesc="The Chef Development Kit contains everything you need to start using Chef along with the tools essential to managing the code that runs your business."
arch=('x86_64')
url="https://downloads.chef.io/chef-dk/"
license=('Apache')
depends=()
conflicts=( chef chef-solo )
source=("https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.5.1-1_amd64.deb")
sha512sums=('8601154b5eea7d744b2d825641d9d87e1bd3d3844614ece3551081257661a9e4215e4f57413bde03b440c6e4fcb2f84d5c9252dac7675072b452ff4df9bbe669')


package() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # cleanup .git folders, any idea why they are in the package?
  find $pkgdir -type d -name ".git" | xargs  rm -rf

  # link executables
  binaries="chef chef-solo chef-apply chef-shell knife shef ohai berks chef-zero fauxhai foodcritic kitchen rubocop strain strainer chef-client"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -sf /opt/chefdk/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -R 0:0 $pkgdir
}