# Maintainer: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Charles B. Johnson <mail@cbjohnson.info>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Ben Alex <ben.alex@acegi.com.au>

pkgname=influxdb
pkgver=0.8.4
pkgrel=1
epoch=
pkgdesc='Scalable datastore for metrics, events, and real-time analytics'
arch=('i686' 'x86_64')
url='http://influxdb.org/'
license=('MIT')
groups=()
depends=('leveldb' 'rocksdb')
makedepends=('protobuf' 'bison' 'flex' 'go')
checkdepends=()
optdepends=()
provides=('influxdb')
conflicts=()
replaces=()
backup=('etc/influxdb.conf')
options=()
install="$pkgname.install"
changelog=
source=("http://get.influxdb.org/with_dependencies/$pkgname-$pkgver.src.tar.gz"
        "$pkgname.service"
        "$pkgname.install"
        '.AURINFO')
noextract=()
md5sums=('8d0d039342dadc118bed163849b2743f'
         'c59b9926d74776d5990889bd48f98543'
         'b4203001919b80999f18ebfa564ae6e3'
         'SKIP')

_prefix='/usr'

build() {
  export GOPATH="$srcdir"
  cd "$srcdir/src/github.com/influxdb/influxdb"
  ./configure --prefix=$_prefix
  make protobuf
  make parser
  go build -o "$pkgname" github.com/influxdb/influxdb/daemon
}

check() {
  cd "$srcdir/src/github.com/influxdb/influxdb"
  ./influxdb -v
}

package() {
  # systemctl service file
  install -D -m644  'influxdb.service' "$pkgdir/usr/lib/systemd/system/influxdb.service"

  cd "$srcdir/src/github.com/influxdb/influxdb"

  # influxdb binary
  install -D -m755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

  # admin console assets
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r admin-ui "$pkgdir/usr/share/$pkgname"

  # configuration file
  sed -i 's/\/tmp\/influxdb\/development\/db/\/var\/lib\/influxdb\/data/g' config.sample.toml
  sed -i 's/\/tmp\/influxdb\/development\/raft/\/var\/lib\/influxdb\/raft/g' config.sample.toml
  sed -i 's/\/tmp\/influxdb\/development\/wal/\/var\/lib\/influxdb\/wal/g' config.sample.toml
  sed -i 's/influxdb.log/\/var\/log\/influxdb\/influxdb.log/g' config.sample.toml
  sed -i 's/.\/admin/\/usr\/share\/influxdb\/admin-ui/g' config.sample.toml
  sed -i 's/\.\.\/cert.pem/\/usr\/share\/influxdb\/cert\.pem/g' config.sample.toml
  install -D -m644 config.sample.toml "$pkgdir/etc/$pkgname.conf"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # self-signed certificate
  install -Dm644 cert.pem "$pkgdir/usr/share/influxdb/cert.pem"
}
