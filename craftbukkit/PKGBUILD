# Maintainer: Vincent Post <vincent.post@w1r3.net>

pkgname=craftbukkit
pkgver=1.7.9r0.2
_pkgver=02631_1.7.9-R0.2
pkgrel=1
pkgdesc="Minecraft server implementing the Bukkit API"
arch=(any)
url="http://bukkit.org"
license=("LGPL")
depends=('java-runtime-headless'
         'tmux'
         'sudo')
conflicts=('bukkit' 'craftbukkit-stable')
provides=('bukkit')
install=craftbukkit.install
source=("craftbukkit.jar::http://dl.bukkit.org/downloads/${pkgname}/get/${_pkgver}/${pkgname}-beta.jar"
        'craftbukkit.service'
        'craftbukkit.sh')
noextract=("craftbukkit.jar")
md5sums=("785456151f3b2ed2ecb1a8a21928692f"
         '0ba6b038ca1b04ef1e4f2746e3011a71'
         'b7905af90a28e46e14e2771a2b3a71ff')

package() {
  install -Dm644 "${srcdir}/craftbukkit.jar" "${pkgdir}/srv/craftbukkit/craftbukkit.jar"
  install -m755 "${srcdir}/craftbukkit.sh" "${pkgdir}/srv/craftbukkit/craftbukkit.sh"
  install -Dm644 "${srcdir}/craftbukkit.service" "${pkgdir}/usr/lib/systemd/system/craftbukkit.service"
}
