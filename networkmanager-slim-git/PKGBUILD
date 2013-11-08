# Maintainer: Evan Pitstick <nerdx00 AT gmail @ com>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Joe Carta <cartakid at gmail dot com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinxu.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>
# Contributor: Valentine Sinitsyn <e_val@inbox.ru>

_gitname=NetworkManager
pkgname=networkmanager-slim-git
pkgver=0.9.8.beta1.1362.g0c3a2b1
pkgrel=1
pkgdesc="Network Management daemon without modemmanager, ppp and dhclient support"
arch=(i686 x86_64)
url=http://www.gnome.org/projects/$_gitname
license=(GPL3)
depends=(dbus-glib libsoup polkit wpa_supplicant)
makedepends=(git gobject-introspection gtk-doc intltool libndp-git)
optdepends=(
	'dnsmasq: Connection sharing'
	'bluez: Bluetooth support'
	'openresolv: resolvconf support'
)
provides=(
	${pkgname%-*}=$pkgver
	networkmanager-git
)
conflicts=(
	${pkgname%-*}
	networkmanager-git
)
backup=(etc/NetworkManager/NetworkManager.conf)
options=(!emptydirs !libtool)
install=$pkgname.install
source=(
	$pkgname::git://anongit.freedesktop.org/$_gitname/$_gitname.git
	git://git.gnome.org/libgsystem
	NetworkManager.conf
	disable_set_hostname.patch
	dnsmasq-path.patch
	nm-polkit-permissive.patch
)
sha256sums=(
	'SKIP'
	'SKIP'
	'44b048804c7c0b8b3b0c29b8632b6ad613c397d0a1635ec918e10c0fbcdadf21'
	'46f3d7cc5fdc449e613b1e6a651879f87f0a9fa65818e7e0ebae20b11d2eef39'
	'e7753d8ae42395289c0294f039a658628086383a56ea03cafe38a4579012879f'
	'91881a6ba962800895901fcc6929955b9d49095b6ed97fd913c99c77ddd630db'
)

pkgver() {
	cd $pkgname/
	git describe --tags | sed 's/-/./g'
}

prepare() {
	cd $pkgname/
	find ../ -name '*.patch' -exec patch -Np1 -i '{}' \;
	rm -rf libgsystem/
	ln -sf ../libgsystem
}

build() {
	cd $pkgname/
	gtkdocize
	autopoint --force
	AUTOPOINT="intltoolize -f -c --automake" autoreconf -fi
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--libexecdir=/usr/lib/networkmanager \
    	--sbindir=/usr/bin \
		--with-crypto=nss \
		--with-distro=arch \
		--with-dhcpcd=/usr/bin/dhcpcd \
		--with-iptables=/usr/bin/iptables \
		--with-systemdsystemunitdir=/usr/lib/systemd/system \
		--with-udev-dir=/usr/lib/udev \
		--with-resolvconf=/usr/bin/resolvconf \
		--with-session-tracking=systemd \
		--disable-static \
		--enable-more-warnings=no \
		--disable-wimax \
		--enable-modify-system \
		--disable-ppp

	make
}

package() {
	make -C $pkgname DESTDIR="$pkgdir" install
	install -m644 $_gitname.conf "$pkgdir"/etc/$_gitname/
	rm -r "$pkgdir"/var/run
	# Provide native service for arch-daemons generator
	ln -s $_gitname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}