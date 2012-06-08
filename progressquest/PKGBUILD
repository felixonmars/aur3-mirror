# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com> 
pkgname=progressquest
pkgver=6.2
pkgrel=6
pkgdesc="A zero-player RPG focused on progress and features pretty progress bars as well as online stats and guilds features"
url="http://www.progressquest.com/"
arch=('i686' 'x86_64')
depends=('wine')
makedepends=('unzip')
source=(progressquest
        http://www.grumdrig.com/dl/pq6-2.zip
        progressquest.desktop
        progressquest.png)
license=('custom')
install=progressquest.install
noextract=()
md5sums=('b43f74d42303e34f9b9705a411a1c577'
         '107b72309b2408fb0081fef8bb077e5e'
         '6cb1a1e8529c9bb6af7cf61abcfd8025'
         'ed4c04be75fdf7ccecb01b07f0aa3c2c')

build() {
	# Install custom license and help
	mkdir -p ${pkgdir}/usr/share/licenses/progressquest
	mkdir -p ${pkgdir}/usr/share/doc/progressquest
	mv ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/progressquest
	mv ${srcdir}/pq.html ${pkgdir}/usr/share/doc/progressquest
	
	# Install binaries
	install -d -m755 $pkgdir/usr/share/progressquest
	mv ${srcdir}/pq.exe ${pkgdir}/usr/share/progressquest
	
	# Windows app, so lets manually set permissions
	find ${pkgdir}/usr/share/progressquest -type d -exec chmod 755 "{}" \;
	find ${pkgdir}/usr/share/progressquest -type f -exec chmod 644 "{}" \;
	
	# Install scripts for the user to run
	install -d -m755 ${pkgdir}/usr/bin
	install -m755 progressquest ${pkgdir}/usr/bin

	# Install icon
	install -Dm644 ${srcdir}/progressquest.desktop ${pkgdir}/usr/share/applications/progressquest.desktop
	install -Dm644 ${srcdir}/progressquest.png ${pkgdir}/usr/share/pixmaps/progressquest.png
}
