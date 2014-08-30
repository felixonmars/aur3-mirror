# Maintainer: M0Rf30
# Contributor: Leo von Klenze <leo@devel.von-klenze.de>
pkgname=cloud9-git
pkgver=9384.5b62a7c
pkgrel=1
pkgdesc="Cloud9 IDE - Your code anywhere, anytime. Open Source Javascript Cloud9 IDE"
arch=('i686' 'x86_64')
url="https://github.com/ajaxorg/cloud9"
license=('GPLv3')
depends=(nodejs chromium)
makedepends=('git')
options=(!strip)
provides=(cloud9)
conflicts=(cloud9)
source=(cloud9::git+https://github.com/ajaxorg/cloud9.git
	cloud9.sh
	cloud9.desktop
	cloud9.png
	cloud9.service)
install=cloud9.install

build(){
  cd cloud9
  
  npm install
#  cd node_modules/ace; make clean build; cd ../..
#  cd node_modules/packager && rm -rf node_modules && sm install && cd ../..
#  make
}

package(){
  cd cloud9
  
  #Create folder for user cloud9
  install -dm755 $pkgdir/var/lib/cloud9
  cp -r * $pkgdir/var/lib/cloud9/
  mkdir $pkgdir/var/lib/cloud9/.sessions
  chown 419:419 -R $pkgdir/var/lib/cloud9
  
  install -vDm755  $srcdir/cloud9.sh $pkgdir/usr/bin/cloud9
  install -vDm644 $srcdir/cloud9.desktop $pkgdir/usr/share/applications/cloud9.desktop
  install -vDm644 $srcdir/cloud9.png $pkgdir/usr/share/pixmaps/cloud9.png
#Install systemd service
#install -Dm644 $srcdir/cloud9.service $pkgdir/usr/lib/systemd/system/cloud9.service
}

pkgver() {
  cd cloud9
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         '73e05881f9506a9c483b714854e81110'
         '5982f046d81679c9a248a52fd87ab93f'
         'd936da7ccd2bc783afa8d196cc674b86'
         '6af143f3f7019d966d2e2325dc06cbb1')
