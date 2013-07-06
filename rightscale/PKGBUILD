# Maintainer: Brian Szmyd <brian.szmyd@rightscale.com>
# Contributor: Chris Fordham <chris.fordham@rightscale.com>

pkgname=rightscale
pkgver=5.8.13
pkgrel=6
pkgdesc='RightScale RightLink cloud instance agent.'
arch=('i686' 'x86_64' 'armv6h')
url=http://rightscale.com/
license=(RightScale)
depends=(bash dnsutils lsb-release sudo openssh curl shadow rightscale-rightlink rightscale-sandbox rightscale-cloud rightscale-motd rightscale-monit rightscale-systemd)
makedepends=(autoconf git)
conflicts=(rightscale-deb)
options=(emptydirs strip !docs !libtool !staticlibs)
install=rightscale.install

source=(
	${install}
	rightscale_functions
	LICENSE)

md5sums=('3e76a7b128645dee53db7006616383a9'
         '2fce7dd8caf57b76b3c92a4d18de02e1'
         '3f31b6f7aba7c235143e0594a7ef1230')		 # generate with 'makepkg -g'

package() {
  msg 'Add rightscale_functions to package.'
  install -D "$startdir/rightscale_functions" "$pkgdir/opt/rightscale/bin/rightscale_functions"

  msg 'Adding LICENSE to package...'
  install -D "$startdir/LICENSE" "$pkgdir/opt/rightscale/LICENSE"
}

# vim:syntax=sh