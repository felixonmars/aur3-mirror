# Maintainer: Maxim Kraev <maxim.kraev@gmail.com>

pkgname=chef-dk
pkgver=0.4.0
pkgrel=1
_ubuntuver=raring
_ubunturel=4
pkgdesc="The Chef Development Kit contains everything you need to start using Chef along with the tools essential to managing the code that runs your business."
arch=('x86_64')
url="http://www.getchef.com/downloads/chef-dk/linux/"
license=('Apache')
depends=()
conflicts=( chef chef-solo )
source=("http://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.4.0-1_amd64.deb")
sha512sums=('88ea6e270178317864cc6d6407f8c2323bcf676f90456880552aad3676a67bc4fdf01b59b15988c50554d95b2cc4f08a94f0faf993cad7416abb270d71130e7d')


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
}