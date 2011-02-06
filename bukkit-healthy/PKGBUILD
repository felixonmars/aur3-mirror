# Contributor: ragon <frederik.engels24@gmail.com>

pkgname="bukkit-healthy"
pkgver='1.0'
pkgrel=2
pkgdesc="Hacks a healthbar into chatmessages"
arch=('any')
license=('NONE')
url="http://forums.bukkit.org/threads/healthy-a-hyperchat-healthbar.162/"
depends=('bukkit')
makedepends=('wget')
source=(http://dl.dropbox.com/u/13861914/Bukkit/Healthy/Healthy.jar)
md5sums=(70c912b25b8118c55d961dd795052154)
build()
{
        mkdir $pkgdir/etc
        mkdir $pkgdir/etc/bukkit
        mkdir $pkgdir/etc/bukkit/plugins

        install -D -m755 Healthy.jar $pkgdir/etc/bukkit/plugins/Healthy.jar
}
