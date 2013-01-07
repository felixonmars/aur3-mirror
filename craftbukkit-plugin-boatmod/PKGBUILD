pkgname=craftbukkit-plugin-boatmod
pkgver=12
pkgrel=3
pkgdesc="Add large moving objects"
arch=(any)
url="http://forums.bukkit.org/threads/fun-boatmod-v12-make-large-groups-of-blocks-move-1-4-5-r0-2.19067"
license=("unknown")
depends=("craftbukkit>=1.2.5r1.0")
backup=("srv/craftbukkit/plugins/BoatMod/default.cfg")
source=("http://garbage-collection.googlecode.com/files/BoatModv$pkgver.zip")
md5sums=('6d247d5b98e99ddf96d28a8ea4224f51')

package() {
  install -Dm644 "$srcdir/BoatMod/autoship.js" "$pkgdir/srv/craftbukkit/plugins/BoatMod/autoship.js"
  install -m644 "$srcdir/BoatMod/default.cfg" "$pkgdir/srv/craftbukkit/plugins/BoatMod/"
  install -m644 "$srcdir/BoatMod.jar" "$pkgdir/srv/craftbukkit/plugins/"
}

# vim:set ts=2 sw=2 et:
