# Maintainer: <chris.fordham@rightscale.com>

pkgname=rightscale-motd
pkgver=0.1.1
pkgrel=1
pkgdesc='RightScale RightLink MOTD support package.'
arch=(any)
url=http://rightscale.com/
license=(Apache 2)
depends=()
makedepends=()
conflicts=(rightscale-deb)
options=()

source=(
	motd
	motd-complete
	motd-failed
)
md5sums=('f6fb1b6dc9242d5683ee4a28e73c9136'
         '012e1bd444287aa732dca6886b0daa8a'
         '2d2db6e267df9ad5e5edc575dba7c75b')        # generate with 'makepkg -g'

package() {
	install -D "$startdir/motd" "$pkgdir/opt/rightscale/etc/motd"
	install -D "$startdir/motd-complete" "$pkgdir/opt/rightscale/etc/motd-complete"
	install -D "$startdir/motd-failed" "$pkgdir/opt/rightscale/etc/motd-failed"
}

# vim:syntax=sh