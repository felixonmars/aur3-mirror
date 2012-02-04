# Maintainer: Sebastian Köhler <sebkoehler@whoami.org.uk>
pkgname=craftbukkit-plugin-heroicdeath
pkgver=1.8.1
pkgrel=1
pkgdesc="Death message plugin for Bukkit"
arch=(any)
url="http://forums.bukkit.org/threads/info-heroicdeath-v1-8-1-customizable-server-broadcasts-on-player-death-211-740.3255/"
license=('GPL')
depends=('craftbukkit')
source=('http://dl.dropbox.com/u/1131502/HeroicDeath/HeroicDeath-1.8.1-bin.zip')
md5sums=('fd1d9747f24895cf00c09cd904638ee1')

package() {
  mkdir -p "$pkgdir/opt/craftbukkit/plugins/"
  install -m 644 "$srcdir/HeroicDeath.jar" "$pkgdir/opt/craftbukkit/plugins/"
}

# vim:set ts=2 sw=2 et:
