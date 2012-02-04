# Maintainer: Hilton Medeiros <medeiros.hilton at gmail dot com>
# Contributor: David Trail <napalm10 at gmail>
# Contributor: Jan-Erik Rediger <badboy at archlinux dot us>

pkgname=redis-git
pkgver=20111002
pkgrel=1
pkgdesc="An open source, advanced key-value keystore"
arch=('i686' 'x86_64')
url="http://redis.io/"
license=('BSD')
depends=('bash')
makedepends=('git')
conflicts=('redis')
provides=('redis')
backup=('etc/redis.conf' 'etc/logrotate.d/redis')
source=("redis.d"
        "redis.logrotate")
md5sums=('65a2c0a78168fbdb439ecc1911ab1c29'
         '9e2d75b7a9dc421122d673fe520ef17f')

_gitroot="git://github.com/antirez/redis.git"
_gitname="redis"

build() {
  cd "$srcdir"
  msg "Connecting to Git server...."

  if [ -d $_gitname ]; then
    pushd $_gitname && git pull origin && popd
    msg "The local files are updated"
  else
    git clone $_gitroot
  fi

  msg "Git checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  make -j1

  # Needs `tcl` from [extra]
  #make test
}

package() {
  cd "$srcdir/$_gitname-build"

  make PREFIX="$pkgdir/usr" install

  sed -i -e 's|daemonize no|daemonize yes|' \
         -e "s|dir \./|dir /var/lib/$_gitname|" \
         -e "s|logfile stdout|logfile /var/log/$_gitname.log|" \
         "$_gitname.conf"
  install -Dm644 $_gitname.conf "$pkgdir/etc/$_gitname.conf"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$_gitname/COPYING"

  install -Dm755 "$srcdir/$_gitname.d" "$pkgdir/etc/rc.d/$_gitname"
  install -Dm644 "$srcdir/$_gitname.logrotate" "$pkgdir/etc/logrotate.d/$_gitname"
}
