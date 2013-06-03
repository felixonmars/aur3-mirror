pkgname=tekkit-server-classic
pkgver=3.1.2
pkgrel=2
pkgdesc="Tekkit classic server unit files, script, and jar"
arch=(any)
url="http://technicpack.net/tekkit-classic"
license=('custom')
depends=('java-runtime-headless' 'systemd' 'screen' 'expect')
conflicts=('minecraft-server-systemd' 'minecraft-canary' 'tekkit-server')
options=(emptydirs)
install=minecraft-server.install
backup=('etc/conf.d/minecraft'
        'srv/minecraft/server.properties')
source=(http://mirror.technicpack.net/Technic/servers/tekkit/Tekkit_Server_$pkgver.zip
        minecraftd
        minecraftd-diag
        minecraftd.service
	    minecraftctl
	    conf.minecraft)
md5sums=('1585944bc11e8f7334eeaff037322e93'
         'a556dbffd433d6d2dcaeba33b78511c5'
         '64e793deed5856a970e92d0942168cfd'
         '98df0cca61c6833ad032559f07b4acb1'
         'bb19d2136e0908dd7f9bc87b7dc8d31c'
         'd404341aa9fe3dd787dec80d14af85f2')

package() {
  install -Dm744 "$srcdir/minecraftd"             "$pkgdir/usr/bin/minecraftd"
  install -Dm744 "$srcdir/minecraftd-diag"        "$pkgdir/usr/bin/minecraftd-diag"
  install -Dm744 "$srcdir/minecraftctl"           "$pkgdir/usr/bin/minecraftctl"

  install -Dm644 "$srcdir/minecraftd.service"     "$pkgdir/usr/lib/systemd/system/minecraftd.service"
  install -Dm644 "$srcdir/conf.minecraft"         "$pkgdir/etc/conf.d/minecraft"

  install -d     "$pkgdir/srv/minecraft/backup"
  cp      -r     "$srcdir/"{Tekkit.jar,config,buildcraft,mods,redpower,mod_EE.props} "$pkgdir/srv/minecraft/"
  chmod   755    "$pkgdir/srv/minecraft/"{config,buildcraft,mods,redpower}
}
