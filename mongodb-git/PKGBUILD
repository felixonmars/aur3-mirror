# Contributor: Latchezar Tzvetkoff <root@pfoo.org>

pkgname=mongodb-git
pkgver=20100802
pkgrel=1
pkgdesc='MongoDB is a high-performance, open source, schema-free document-oriented database.'
arch=('i686' 'x86_64')
url='http://www.mongodb.org/'
license=('AGPL')
depends=('boost' 'spidermonkey' 'pcre' 'xulrunner')
makedepends=('git' 'scons')
conflicts=('mongodb')
install='mongodb.install'
source=('mongodb.rc'
        'mongodb.rc.conf')
md5sums=('4bebe428216b1c4792fd1b7941102b7b'
         '13d59a1cb6fa9e54814d6d98781341dc')

_gitroot='http://github.com/mongodb/mongo.git'
_gitname='mongo'

build() {
  #
  # SOURCE CHECKOUT
  #
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"


  #
  # BUILD
  #

  # fix multilib
  sed -i 's|lib64|lib|g' SConstruct

  # install and build
  scons install --prefix="$startdir/pkg/usr/"
  install -Dm 755 "$startdir/mongodb.rc" "$startdir/pkg/etc/rc.d/mongodb"
  install -Dm 755 "$startdir/mongodb.rc.conf" "$startdir/pkg/etc/conf.d/mongodb"
  install -dm 700 "$startdir/pkg/var/state/mongodb"
}
