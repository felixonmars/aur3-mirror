# Author: Fzerorubigd <fzerorubigd {AT} Gmail>

_npmname=log.io
pkgname=nodejs-log.io-git
pkgver=20120505
pkgrel=1
pkgdesc="Real-time log monitoring in your browser"
arch=(any)
url="http://logio.org"
license=('unknown')
depends=(nodejs)
source=()
#noextract=($_npmname-$pkgver.tgz)
sha1sums=()
install=$pkgname.install
conflict=('nodejs-log.io')

_gitroot=https://github.com/NarrativeScience/Log.io.git
_gitname=Log.io

build() {
  cd $srcdir
  
  msg "Connecting to githup.com GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin && cd ..
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi
  cd $_gitname/  


  #Its time to disable install.sh on build machine, it must run on the target machine of this package
  mv bin/install.sh bin/install-target.sh 
  echo -e "#!/bin/bash\necho 'Post install'" > bin/install.sh
  chmod a+x bin/install.sh
  
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr/local" "$srcdir/$_gitname"
  mv $pkgdir/usr/local/lib/node_modules/log.io/bin/log.io $pkgdir/usr/local/lib/node_modules/log.io/bin/log.io.old
  sed "s/forever/\/usr\/local\/bin\/forever-logio/g" $pkgdir/usr/local/lib/node_modules/log.io/bin/log.io.old > $pkgdir/usr/local/lib/node_modules/log.io/bin/log.io
  chmod a+x $pkgdir/usr/local/lib/node_modules/log.io/bin/log.io
}
# vim:set ts=2 sw=2 et:
