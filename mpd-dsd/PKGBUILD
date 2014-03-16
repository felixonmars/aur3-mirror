# Maintainer:  Frank Phillips <frankalso@gmail.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: Ben <ben@benmazer.net>

pkgname=mpd-dsd
pkgver=0.18.9
pkgrel=1
pkgdesc='Flexible, powerful, server-side application for playing music, with DSD seek support'
url='https://github.com/lintweaker/mpd-dsd-018'
license=('GPL')
arch=('i686' 'x86_64' 'armv6h')
depends=('libao' 'ffmpeg' 'libmodplug' 'audiofile' 'libshout' 'libmad' 'curl' 'faad2'
         'sqlite' 'jack' 'libmms' 'wavpack' 'avahi' 'libid3tag' 'yajl' 'libmpdclient')
makedepends=('doxygen')
provides=('mpd')
conflicts=('mpd')
source=('git+https://github.com/lintweaker/mpd-dsd-018.git'
        'tmpfiles.d'
        'conf')
sha1sums=('SKIP'
          'f4d5922abb69abb739542d8e93f4dfd748acdad7'
          '67c145c046cddd885630d72ce8ebe71f8321ff3b')

backup=('etc/mpd.conf')
install=install

build() {
	cd "${srcdir}/${pkgname}-018"
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--enable-libmpdclient \
		--enable-jack \
		--enable-soundcloud \
		--enable-pipe-output \
		--enable-pulse \
		--disable-sidplay \
		--with-systemdsystemunitdir=/usr/lib/systemd/system
	make
}

package() {
	cd "${srcdir}/${pkgname}-018"
	make DESTDIR="${pkgdir}" install
	install -Dm644 ../conf "${pkgdir}"/etc/mpd.conf
	install -Dm644 ../tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/mpd.conf
	install -d -g 45 -o 45 "${pkgdir}"/var/lib/mpd/playlists

	install -Dm644 "${pkgdir}"/usr/lib/systemd/{system,user}/mpd.service
	sed '/WantedBy=/c WantedBy=default.target' -i "${pkgdir}"/usr/lib/systemd/user/mpd.service
}
