# Maintainer: Chen Tong <blovemaple2010@gmail.com>

pkgname=mahjong-cli-git
pkgver=20121120
pkgrel=2
pkgdesc='A command-line Chinese Mahjong game.'
arch=('i686' 'x86_64')
url='https://github.com/blovemaple/mahjong'
license=('Custom')
makedepends=('git' 'java-environment>=7')
depends=('java-runtime-headless>=7' 'java-jline2')

_gitroot='git://github.com/blovemaple/mahjong.git'
_gitname='mahjong'

_command='mahjong-cli'
_jarpath="/usr/share/${_command}/${_command}.jar"

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg 'The local files are updated.'
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting build...'

  _bindir=bin

  cd "${srcdir}/${_gitname}"
  rm -rf ${_bindir}
  mkdir ${_bindir}
  javac -cp /usr/share/java/jline2.jar:/usr/share/java/mapdb.jar -sourcepath src -d ${_bindir} src/*/*/*/*
  cd ${_bindir}
  jar -cmf ../manifest.mf ../mahjong.jar *
  cd "${srcdir}/${_gitname}"
  echo "java -Xbootclasspath/a:/usr/share/java/jline2.jar:/usr/share/java/mapdb.jar -jar ${_jarpath}" > ${_command}

  rm -rf ${_bindir}
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D -m644 \
  	mahjong.jar $pkgdir${_jarpath}
  install -D -m755 \
  	${_command} $pkgdir/usr/bin/${_command}
}
