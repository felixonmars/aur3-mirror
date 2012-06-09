# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
pkgname=teamspeak3-theme-minecraft-forever
pkgver=1.0
pkgrel=1
pkgdesc='Minecraft theme for TeamSpeak 3'
arch=(any)
url='http://addons.teamspeak.com/directory/skins/stylesheets/Minecraft-Forever.html'
license=('unknown')
depends=('teamspeak3')
makedepends=('unrar')
changelog=ChangeLog
source=('Minecraft Forever.rar::http://addons.teamspeak.com/index.php?option=com_mtree&task=att_download&link_id=411&cf_id=24')
noextract=('Minecraft Forever.rar')
md5sums=('623912025ff7362bef7372b7266bd5ab')
sha1sums=('ca156ea5081df47ccee8583b16c4313e57e59280')

_rardir="$srcdir/Minecraft Forever"

build() {
  cd "$srcdir"
  unrar x 'Minecraft Forever.rar'
  cd "$_rardir"
  # Bring background images back.
  sed -i -e "s/\(url('\)Styles\//\1styles:/g" styles/MinecraftForever.qss
  # Fix for "Unknown property ����background-repeat" - FIXME: Doesn't work.
  sed -i -e 's/^.+background-repeat/\tbackground-repeat/g' styles/MinecraftForever.qss
}

package() {
  cd "$_rardir"
  install -d "$pkgdir/opt/teamspeak3"
  cp -Rf * "$pkgdir/opt/teamspeak3/"
}

# vim:set ts=2 sw=2 et:
