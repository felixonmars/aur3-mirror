# Maintainer: David Roheim <david dot roheim at gmail dot com>
pkgname=php-mongodb-git
pkgver=20120417
pkgrel=1
pkgdesc="PHP driver for MongoDB"
arch=('i686' 'x86_64')
url="http://www.mongodb.org/"
license=('APACHE')
conflicts=('php-mongodb')
depends=('php')
optdepends=('mongodb: The MongoDB database')
makedepends=('git')

source=(
  'mongo.ini'
  'LICENSE'
)
sha256sums=(
  'b706dbe3ce81a0a1b66f16ee30cb6cb83c1520bc01785942364c182d6fb621f5'
  '5438d7dbf3eda57124e444c2f7446f0a3342c784d0e45f5c9e3561bb6d196aa8'
)
_gitroot=git://github.com/mongodb/mongo-php-driver.git

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$pkgname" ]]; then
    cd "$pkgname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$pkgname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$pkgname-build"
  git clone "$srcdir/$pkgname" "$srcdir/$pkgname-build"
  cd "$srcdir/$pkgname-build"
  
  phpize
  ./configure
  make
}

package() {
  install -D -m755 "${srcdir}/${pkgname}-build/modules/mongo.so" "${pkgdir}/usr/lib/php/modules/mongo.so"
  install -D -m644 mongo.ini "${pkgdir}/etc/php/conf.d/mongo.ini"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
