# Maintainer: Viech <viech unvanquished net>

pkgname="netradiant-unvanquished"
pkgver=20131128
pkgrel=1
pkgdesc="Adds support for the game Unvanquished to the level editor Netradiant and vice versa."
arch=("any")
url="http://unvanquished.net"
license=("unknown")
depends=("netradiant" "unvanquished")

source=("http://ingar.satgnu.net/gtkradiant/files/netradiant-support-tremulous.zip"
        "default_build_menu.xml"
        "default_shaderlist.txt"
        "entities.def"
        "game.xlink"
        "unvanquished.game")

package() {
	mkdir -p ${pkgdir}/var/lib/unvanquished/main/scripts     \
                 ${pkgdir}/opt/netradiant/games                  \
                 ${pkgdir}/opt/netradiant/unvanquished.game/main \
	
	# gamepack for netradiant
	install -m 644 ${srcdir}/default_build_menu.xml ${pkgdir}/opt/netradiant/unvanquished.game/
	install -m 644 ${srcdir}/default_shaderlist.txt ${pkgdir}/opt/netradiant/unvanquished.game/main/
	install -m 644 ${srcdir}/entities.def ${pkgdir}/opt/netradiant/unvanquished.game/main/
	install -m 644 ${srcdir}/game.xlink ${pkgdir}/opt/netradiant/unvanquished.game/
	install -m 644 ${srcdir}/unvanquished.game ${pkgdir}/opt/netradiant/games/
	
	# supportfiles for unvanquished
	install -m 644 ${srcdir}/data-radiant-1.1.0.pk3 ${pkgdir}/var/lib/unvanquished/main/radiant.pk3
	install -m 644 ${srcdir}/default_shaderlist.txt ${pkgdir}/var/lib/unvanquished/main/scripts/shaderlist.txt
}

md5sums=('75603f9e752aefabb866d592433b42b8'
         '90df72cab29970dfd32590e3cee0147a'
         'e9b736ea18415be15a22e623bce06874'
         'b41feba410ef85337830f4bafcb09290'
         'bacd624200b2e7e8062f29c93e9c3fed'
         'd3c1c88d844319e352cde4d1e9441916')
