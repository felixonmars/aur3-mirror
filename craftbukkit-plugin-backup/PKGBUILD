pkgname=craftbukkit-plugin-backup
pkgver="2.6"
pkgrel=1
pkgdesc="Backup plugin for Bukkit"
makedepends=('git' 'maven')
arch=(any)
url="http://bukkitbackup.com/"
license=('GPLv3')
depends=('craftbukkit>=1.6.2r0.1')
source=('git+https://github.com/dpraul/Backup.git')
md5sums=('SKIP')

_gitversion=9baee0a6a20ced5402c80c7b2eba7667b0d0f2d8
_gitname=Backup

build() {
  cd "$_gitname"
  git reset --hard $_gitversion
  msg "Starting build..."
  mvn clean package
}

package() {
  install -Dm 644 "$srcdir/$_gitname/target/Backup.jar" "$pkgdir/srv/craftbukkit/plugins/Backup.jar"
}

