# Maintainer: Steve Engledow <steve at offend dot me dot uk>
pkgname='miniserv-git'
pkgver=0.3
pkgrel=3
pkgdesc="A simple web server for serving files from a chosen directory over HTTP"
arch=('i686' 'x86_64')
url="https://github.com/stilvoid/miniserv"
license=('MIT')
depends=('nodejs')
makedepends=('git')
noextract=()
md5sums=() #generate with 'makepkg -g'

build() {
  cd "$srcdir"

  if [ -d miniserv ]; then
    cd miniserv
    git checkout master
    git pull
  else
    git clone git://github.com/stilvoid/miniserv.git miniserv
  fi

  cd "$srcdir/miniserv"

  npm install nosef

  echo -e "#!/bin/sh\nnode /usr/lib/${pkgname}/miniserv.js \$*" > "${srcdir}/miniserv/miniserv"
}

package() {
  cd "$srcdir/miniserv"
  install -Dm644 ${srcdir}/miniserv/miniserv.js "${pkgdir}/usr/lib/$pkgname/miniserv.js"
  cp -a ${srcdir}/miniserv/node_modules "${pkgdir}/usr/lib/$pkgname/"
  install -Dm755 ${srcdir}/miniserv/miniserv "${pkgdir}/usr/bin/miniserv"
}
