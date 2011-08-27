# Maintainer: fastfret79 <fastfret79@archlinux.org.uk>
pkgname=pollocks-hosts
pkgver=20110616
pkgrel=2
pkgdesc='Updates /etc/hosts with Pollocks hosts file blocking adware, spyware etc'
arch=('any')
license=('GPL')
install=('pollocks-hosts.install')
source=('http://someonewhocares.org/hosts/zero/hosts')
url=('http://someonewhocares.org/hosts/zero/')
md5sums=('c767d23ca03c8f76b83b7a6516966710')

package() {

	install -m644 -D ${startdir}/src/hosts ${startdir}/pkg/etc/hosts.blocklist

}
