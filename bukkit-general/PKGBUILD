# Contributor: ragon <frederik.engels24@gmail.com>

pkgname="bukkit-general"
pkgver="2.1"
pkgrel=2
pkgdesc="returns some of the functions from hMod (211+)"
arch=('any')
license=('NONE')
url="http://forums.bukkit.org/threads/general-a-plugin-for-general-commands.145/"
depends=('bukkit' 'bukkit-permissions')
source=(http://mirror.nexua.org/General/JARS/2.1_211/General.jar)
md5sums=(394d0b21646a33c1e03f48606104802b)
build()
{
        mkdir -p $pkgdir/etc/bukkit/plugins
        install -D -m755 General.jar $pkgdir/etc/bukkit/plugins
}
