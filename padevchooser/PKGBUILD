# Maintainer: Evan Penner <evaninrussia@gmail.com>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=padevchooser
pkgver=0.9.3
pkgrel=7
pkgdesc="Change an X11 session's PulseAudio server"
arch=('i686' 'x86_64')
url="http://0pointer.de/lennart/projects/padevchooser"
license=('GPL')
depends=('libglade' 'pulseaudio' 'libnotify' 'gconf' 'libxtst' 'avahi')
source=(http://0pointer.de/lennart/projects/padevchooser/${pkgname}-${pkgver}.tar.gz http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-sound/padevchooser/files/padevchooser-0.9.3-libnotify-0.7.patch?revision=1.1)
md5sums=('6a9b52ad349f3fb3d5a3ccdf85958710' '3e95a69f7d47f09a90cc69c0383d4eed')
sha1sums=('5a611c0e8a1f139c56ca696b8fd8dd7a65b77ba7' 'fdc34f54499d1fca8bb3cd8c88d4ff53db48c0ce')

build() {
	cd ${srcdir}/${pkgname}-${pkgver} 
	patch -Np0 -i ../padevchooser-0.9.3-libnotify-0.7.patch?revision=1.1 || return 1
	./configure --prefix=/usr --disable-lynx || return 1
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver} || return 1
	make DESTDIR=${pkgdir} install || return 1
}
