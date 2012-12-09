# Contributor: henning mueller <henning@orgizm.net>
# Contributor: Mathias Buren <mathias.buren@gmail.com>

pkgname=system-config-lvm-testing
pkgsrcname=system-config-lvm
pkgver=1.1.18
pkgrel=2
pkgdesc="A utility for graphical configuration of Logical Volumes, Fedora testing version"
arch=(i686 x86_64)
url="http://fedoraproject.org/wiki/SystemConfig/lvm"
license=(GPL)
depends=(gtk2 gnome-python pygtk lvm2 gksu)
makedepends=(rpmextract automake gettext intltool)
conflicts=(system-config-lvm)
source=(http://mirror.karneval.cz/pub/linux/fedora/linux/development/rawhide/source/SRPMS/s/$pkgsrcname-$pkgver-1.fc19.src.rpm
	desktop-file.patch
)

build() {
	cd $srcdir
	rpmextract.sh $pkgsrcname*.src.rpm
	tar xzf $pkgsrcname*.tar.gz
	rm *.tar.gz *.spec
	cd $pkgsrcname*
	patch -p0 < ../desktop-file.patch || return 1
	./configure --prefix=/usr --sysconfdir=/etc || return 1
	make || return 1
	make DESTDIR="$pkgdir" install
}


md5sums=('d8147d26474f795f70f7f31de2b52742'
         '7a70b7f24f6ae99981dcb0461f584705')
