# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=openrc-systemdcompat
pkgver=0.8
pkgrel=1
pkgdesc="some systemd compatibility components for openrc"
arch=('i686' 'x86_64')
license=('GPL')
groups=('openrc')
url="https://bitbucket.org/aadityabagga/openrc-systemdcompat"
depends=('openrc-core')
optdepends=('modules-load-openrc: compatibility loading of modules')
#conflicts=('systemd')

source=("https://sourceforge.net/projects/mefiles/files/Manjaro/openrc-systemdcompat/$(uname -m)/systemd-tmpfiles"
	"https://sourceforge.net/projects/mefiles/files/Manjaro/openrc-systemdcompat/$(uname -m)/systemd-sysusers")
sha1sums=('578b23342550bb49dd599f2f5e88e717a4a1949b'
	  '79c150a4e28e29391c9abff87e0517271f518c02')

if [ "$CARCH" == "i686" ]; then 
	sha1sums=('702b56ae467ab2c7321a63847beff29d53d60224'
		  '00d81d67bf159c29c23eba87fed335dadeea7318')
fi

package() {
  install -Dm 755 systemd-tmpfiles $pkgdir/usr/bin/systemd-tmpfiles
  install -Dm 755 systemd-sysusers $pkgdir/usr/bin/systemd-sysusers
}
