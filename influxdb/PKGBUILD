# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname=influxdb
pkgver=0.7.3
pkgrel=1
epoch=
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('i686' 'x86_64')
url='http://influxdb.org/'
license=('MIT')
groups=()
depends=('leveldb')
makedepends=('protobuf' 'bison' 'flex' 'go')
checkdepends=()
optdepends=()
provides=('influxdb')
conflicts=()
replaces=()
backup=('etc/influxdb.conf')
options=()
install='influxdb.install'
changelog=
source=("http://s3.amazonaws.com/influxdb/$pkgname-$pkgver.src.tar.gz"
        'influxdb.service'
        'influxdb.install'
        '.AURINFO')
noextract=()
md5sums=('2f3efe289c43db5595b6b95f6b1d944b'
         'c59b9926d74776d5990889bd48f98543'
         'b4203001919b80999f18ebfa564ae6e3'
         'SKIP')

build() {
  cd "$srcdir/$pkgname"
  export GOPATH="$srcdir/$pkgname"
  ./configure --prefix=/usr
  make protobuf parser
  go build daemon
}

check() {
  cd "$srcdir/$pkgname"
  ./daemon -v
}

package() {
  # systemctl service file
  install -D -m644  'influxdb.service' "$pkgdir/usr/lib/systemd/system/influxdb.service"

  cd "$srcdir/$pkgname"

  # influxdb binary
  install -D -m755 'daemon' "$pkgdir/usr/bin/$pkgname"

  # admin console assets
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r admin "$pkgdir/usr/share/$pkgname"

  # configuration file
  pushd .
  cd "$srcdir/$pkgname"/src/configuration
  sed -i 's/\/tmp\/influxdb\/development\/db/\/var\/lib\/influxdb\/data/g' config.toml
  sed -i 's/\/tmp\/influxdb\/development\/raft/\/var\/lib\/influxdb\/raft/g' config.toml
  sed -i 's/\/tmp\/influxdb\/development\/wal/\/var\/lib\/influxdb\/wal/g' config.toml
  sed -i 's/influxdb.log/\/var\/log\/influxdb\/influxdb.log/g' config.toml
  sed -i 's/.\/admin/\/usr\/share\/influxdb\/admin/g' config.toml
  sed -i 's/seed-servers/#seed-servers/g' config.toml
  sed -i 's/\.\.\/cert.pem/\/usr\/share\/influxdb\/cert\.pem/g' config.toml
  install -D -m644 config.toml "$pkgdir/etc/$pkgname.conf"
  popd

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # self-signed certificate
  install -Dm644 cert.pem "$pkgdir/usr/share/influxdb/cert.pem"
}
