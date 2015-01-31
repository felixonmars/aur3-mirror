# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Contributor: Max Bruckner <max@maxbruckner.de>
pkgname='ostree-git'
pkgver=2015.1.r29.g28e5e6f
pkgrel=1
url="http://git.gnome.org/browse/ostree/tree/README.md"
pkgdesc='OSTree is a tool for managing bootable, versioned filesystem trees.'
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
provides=('ostree')
conflicts=("ostree")
makedepends=('pkg-config' 'gtk-doc' 'git')
depends=('libarchive'
         'linux-user-chroot'
         'libsoup'
         'gpgme'
         'systemd'
         'libgsystem'
         'gobject-introspection')

source=("${pkgname}::git+git://git.gnome.org/ostree")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
	./autogen.sh \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/ \
		--sysconfdir=/etc \
		--with-soup \
		--with-gpgme \
		--with-systemd \
		--with-libarchive \
		--with-mkinitcpio \
		--without-dracut \
		--without-selinux \
		--with-systemdsystemunitdir=/usr/lib/systemd/system \
		--enable-gtk-doc
	make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install DESTDIR="$pkgdir"
}

