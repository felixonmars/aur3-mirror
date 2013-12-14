# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: wesbrown18@gmail.com

pkgname=ruby-redis
pkgver=3.0.6
pkgrel=1
pkgdesc="Ruby client library for Redis, the key value storage server"
arch=(any)
url=https://github.com/redis/redis-rb
license=(GPL)
depends=(redis ruby)
source=(http://rubygems.org/downloads/${pkgname#*-}-$pkgver.gem)
noextract=($pkgname-$pkgver.gem)
sha256sums=('e3c8203afbfb9e0cfe915a0610f6795e02ba2298e72e9326076eed2c048142c1')
sha512sums=('cc6af3e985d285763d832764231a7d6a0cf8afc43f1c7fda49fceeb7af26035b3a744014c460faa44e968c53d1c0fd1cf8c0d3f1a8d09dbbc14c34bf3963732a')

package() {
    gem install \
        --ignore-dependencies \
        --no-user-install \
        -i "$pkgdir"/$(ruby -rubygems -e'puts Gem.default_dir') \
        ${pkgname#*-}-$pkgver.gem
}
