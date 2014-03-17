# Maintainer: Joshua Hertlein <jmhertlein at gmail dot com>
pkgname=adminbuddy-mc
pkgver=1.0
pkgrel=1
pkgdesc="Desktop client for the Bukkit plugin AdminBuddy"
arch=(any)
url="https://github.com/jmhertlein/AdminBuddy"
license=(GPL3)
depends=('jdk7-openjdk' 'maven' 'git')
optdepends=(
  'libnotify: for notify-send support'
)
install=$pkgname.install

package() {
  local _instdir="$pkgdir"/opt/adminbuddy
  local _mvntemps=/tmp/temp_mvn_home_adminbuddy
  git clone https://github.com/jmhertlein/AdminBuddy.git
  cd AdminBuddy
  mkdir -p /tmp/temp_mvn_home_adminbuddy
  M2_HOME="/opt/maven" mvn package -Dmaven.repo.local="$_mvntemps"

  mkdir -p "$_instdir" "$pkgdir"/usr/{bin,share/applications}

  # copy the stuff
  cp target/AdminBuddy*$pkgver*.jar "$_instdir"/AdminBuddy.jar
  echo "#/bin/bash
java -jar /opt/adminbuddy/AdminBuddy.jar" > "$pkgdir"/usr/bin/adminbuddy
  chmod +x "$pkgdir"/usr/bin/adminbuddy
  cp ./packaging/arch/adminbuddy.desktop "$pkgdir"/usr/share/applications
  cp ./src/main/resources/gfx/icon.png "$_instdir"/icon.png
}
