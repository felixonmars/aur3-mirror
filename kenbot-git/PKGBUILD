# Contributor: Kenneth Endfinger <kaendfinger@gmail.com>
pkgname=kenbot-git
pkgver=20130322
pkgrel=1
pkgdesc="KenBot - A modular IRC Bot written in Java."
arch=('i686' 'x86_64')
url="https://bitbucket.org/KenBot/"
license=('GPL')
depends=('jre7-openjdk')
makedepends=('git' 'apache-ant' 'jdk7-openjdk')
_gitroot="https://bitbucket.org/KenBot/kenbot.git"
_gitname="kenbot"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}"
  fi

  msg "GIT checkout done or server timeout"

  cd "${srcdir}/${_gitname}"
  msg "Starting Ant jar/doc...."
  ant jar doc
}

package() {
  cd "${pkgdir}/"
  [ ! -d "./usr/" ] && mkdir -p usr/share/KenBot/ usr/bin/
  cp "${srcdir}/$_gitname/packaging/launcher.sh" ./usr/bin/kenbot
  cp -R ${srcdir}/$_gitname/dist/{KenBot.jar,KenBot-javadocs.zip} ./usr/share/KenBot/
}
