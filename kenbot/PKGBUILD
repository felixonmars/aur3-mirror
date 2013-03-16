# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
pkgname=kenbot
pkgver=1.3
pkgrel=1
pkgdesc="KenBot - A modular IRC Bot written in Java."
arch=('i686' 'x86_64')
url="https://bitbucket.org/KenBot/"
license=('GPL')
depends=('jre7-openjdk')
makedepends=('apache-ant' 'jdk7-openjdk')

build() {
  cd "${srcdir}"
  msg "Downloading latest copy of KenBot...."
  [ ! -d "./shared/" ] && mkdir ./shared/
  wget http://ci.tegko.com:8080/job/KenBot-Stable/lastSuccessfulBuild/artifact/dist/KenBot.jar -Oshared/KenBot.jar --quiet
  msg "Downloading latest launcher script...."
  wget http://ci.tegko.com:8080/job/KenBot-Stable/lastSuccessfulBuild/artifact/packaging/launcher.sh --quiet
}

package() {
  cd "${pkgdir}/"
  [ ! -d "./usr/" ] && mkdir -p usr/share/KenBot/ usr/bin/
  cp "${srcdir}/launcher.sh" ./usr/bin/kenbot
  cp -R ${srcdir}/shared/* ./usr/share/KenBot/
}
