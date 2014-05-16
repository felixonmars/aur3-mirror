# Maintainer:  fluffymadness
# fluffymadness(at)posteo.de

pkgname=tinypower-git
_gitname=tinypower
pkgver=2c55cf6
pkgrel=1
pkgdesc="A tidybattery fork with acpi handling(custom commands) + dpms control + notifications for lightweight wm's like openbox and others(InstallationDocumentation on Git). "
arch=('i686' 'x86_64')
url="https://github.com/fluffymadness/tinypower"
license=('GPLv2')
depends=('python2' 'python2-pyqt4' 'acpi' 'acpid')
makedepends=('git')
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# 'pacman41' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=('git://github.com/fluffymadness/tinypower.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
}



package() {
  cd $_gitname
  install -Dm755 "tinypower.py" "$pkgdir/usr/bin/tinypower"
  install -Dm755 "settings.py" "$pkgdir/usr/bin/settings.py"
  install -Dm755 "icons/battery-000.png" "$pkgdir/usr/share/pixmaps/tinypower/battery-000.png"
  install -Dm755 "icons/battery_caution.png" "$pkgdir/usr/share/pixmaps/tinypower/battery_caution.png"
  install -Dm755 "icons/battery_charged.png" "$pkgdir/usr/share/pixmaps/tinypower/battery_charged.png"
  install -Dm755 "icons/battery_empty.png" "$pkgdir/usr/share/pixmaps/tinypower/battery_empty.png"
  install -Dm755 "icons/battery_full.png" "$pkgdir/usr/share/pixmaps/tinypower/battery_full.png"
  install -Dm755 "icons/battery_low.png" "$pkgdir/usr/share/pixmaps/tinypower/battery_low.png"
  install -Dm755 "icons/battery_plugged.png" "$pkgdir/usr/share/pixmaps/tinypower/battery_plugged.png"
  install -Dm755 "icons/battery_third_fouth.png" "$pkgdir/usr/share/pixmaps/tinypower/battery_third_fouth.png"
  install -Dm755 "icons/battery_two_thirds.png" "$pkgdir/usr/share/pixmaps/tinypower/battery_two_thirds.png"

}
