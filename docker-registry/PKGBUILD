# Maintainer: Philipp Schmitt <philipp@schmitt.co>
# GitHub: https://github.com/pschmitt/aur-docker-registry
pkgname=docker-registry
pkgver=0.7.1
pkgrel=3
pkgdesc='Registry server for Docker (hosting/delivering of repositories and images)'
arch=('any')
url='https://github.com/dotcloud/docker-registry'
license=('Apache 2.0')
depends=('python2' 'gunicorn-python2' 'libevent' 'lrzip' 'xz' 'redis'
         'python2-gevent' 'python2-flask' 'python2-grequests' 'python2-rsa'
         'python2-yaml' 'python2-redis' 'python2-blinker' 'python2-sqlalchemy'
         'python2-backports.lzma' 'python2-flask-cors')
options=(!emptydirs)
source=("https://github.com/dotcloud/$pkgname/archive/$pkgver.tar.gz"
        "https://raw.githubusercontent.com/pschmitt/aur-$pkgname/master/$pkgname.service")
md5sums=('ae9fb31c6c6977d5043946d9578dd071'
         'efb9861c7e3c08081893e7afd493041d')
install="$pkgname.install"

# Change this to wherever you want to put your config files
DOCKER_REGISTRY_CONFIG_DIR=/etc/$pkgname

package() {
  # Install docker-registry-core
  cd "$srcdir/$pkgname-$pkgver/depends/docker-registry-core"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  # Install docker-registry
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  # Move config to /etc/docker-registry
  # TODO Wouldn't symlinkg config.yml to /etc/docker-registry.yml be better?
  cd "$pkgdir/usr/lib/python2.7/site-packages/"
  mkdir -p $pkgdir/etc
  mv config "${pkgdir}${DOCKER_REGISTRY_CONFIG_DIR}"
  ln -s ${DOCKER_REGISTRY_CONFIG_DIR} config
  # Install systemd service file
  install -Dm644 "$srcdir/docker-registry.service" \
                 "$pkgdir/usr/lib/systemd/system/docker-registry.service"
}

# vim:set ts=2 sw=2 et cc=80 :
