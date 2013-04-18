# Maintainer: Isaac C. Aronson <isaac at pingas dot org>

pkgname=minecraft-canary
pkgver=1.5.1.b11.2
pkgrel=2
pkgdesc="CanaryMod Minecraft server systemd service"
arch=(any)
url="http://www.canarymod.net/"
license=('custom')
makedepends=('unzip')
depends=('java-runtime' 'systemd' 'screen' 'expect')
conflicts=('minecraft-server' 'minecraft-server-systemd')
options=(emptydirs)
install=minecraft-canary.install
backup=('srv/minecraft/config/bans.txt'
        'srv/minecraft/config/endermanblocks.txt'
        'srv/minecraft/config/groups.txt'
        'srv/minecraft/config/items.txt'
        'srv/minecraft/config/kits.txt'
        'srv/minecraft/config/motd.txt'
        'srv/minecraft/config/muted-players.txt'
        'srv/minecraft/config/users.txt'
        'srv/minecraft/config/whitelist.txt')
source=(canary.zip::http://dl.canarymod.net/crow/get.php?v=5.7.11
        https://s3.amazonaws.com/MinecraftDownload/launcher/minecraft_server.jar
        minecraftd
        minecraftd.service
        minecraftctl
        conf.minecraft)
noextract=('canary.zip')
md5sums=('6023e46f5e4fee5944c2655da6c167ca'
         '9d31b969c3f197a1d40381d5620717ea'
         'a556dbffd433d6d2dcaeba33b78511c5'
         '10ceca4067bd87d81d8c93c7472d7f8c'
         '85e98163b09a2f8ca3125b3feed3bef1'
         '403523d10119e18cb531b7312064b185')

package() {
  install -Dm744 "$srcdir/minecraftd" "$pkgdir/usr/sbin/minecraftd"
  install -Dm644 "$srcdir/minecraftd.service" "$pkgdir/usr/lib/systemd/system/minecraftd.service"
  install -Dm644 "$srcdir/minecraft_server.jar" "$pkgdir/srv/minecraft/minecraft_server.jar"
  install -Dm644 "$srcdir/conf.minecraft" "$pkgdir/etc/conf.d/minecraft"

  install -d "$pkgdir/srv/minecraft"
  # Temp fix for poorly packaged zip
  unzip -qn canary.zip -d $pkgdir/srv/minecraft || return 0
  # Remove shipped config to avoid trashing on upgrades
  rm -rf "$pkgdir"/srv/minecraft/*.txt "$pkgdir"/srv/minecraft/server.properties
}
