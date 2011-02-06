# Contributor: ragon <frederik.engels24@gmail.com>

pkgname="bukkit-permissions"
pkgver="2.0"
pkgrel=2
pkgdesc="Permissions API for bukkit"
arch=('any')
license=('NONE')
url="http://forums.bukkit.org/threads/mech-api-permissions-revolutionizing-the-group-system.1403"
depends=('bukkit')
source=('http://mirror.nexua.org/Permissions/JARS/2.0/Permissions.jar')
md5sums=('a6d1e303445a2e2fdf02af3e982794c1')
build()
{
        mkdir -p $pkgdir/etc/bukkit/plugins
        install -D -m755 Permissions.jar $pkgdir/etc/bukkit/plugins/Permissions.jar
}
