# Maintainer: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Thomas Dziedzic <gostrc at gmail>
# Contributor: Konstantin Nikiforov <helllamer@gmail.com> 
# Contributor: adam2fours <adam@2fours.com>
_pkgname=dsc-cassandra
pkgname=${_pkgname}-1.2
pkgver=1.2.19
pkgrel=1
pkgdesc='DataStax Community Edition 1.2 distribution of Apache Cassandra'
arch=('any')
url='http://www.datastax.com/'
license=('APACHE')
depends=('java-runtime')
makedepends=('gnupg')
optdepends=('python: to use Python CLI administration scripts')
provides=('cassandra')
install='cassandra.install'
backup=('etc/cassandra/cassandra-env.sh'
        'etc/cassandra/cassandra-topology.properties'
        'etc/cassandra/cassandra.yaml'
        'etc/cassandra/commitlog_archiving.properties'
        'etc/cassandra/log4j-server.properties'
        'etc/cassandra/log4j-tools.properties')
source=("http://downloads.datastax.com/community/${_pkgname}-${pkgver}-bin.tar.gz"
        'cassandra.service'
        'cassandra.install'
        'cassandra-tmpfile.conf'
        '01_fix_cassandra_home_path.patch')
sha256sums=('7c616dea9b7551f369606173b0aa5cb8be9949dd5334910df62b2645cb19dfd3'
            '62b59ed5eff8ced3487e99a5ee42d16ed6c0a461c7b4cfa7dab42a871f82641e'
            '4ba9f4d2b68cf1d142471aec145ffd656e6af6473352fe2e41552f55f39eb09e'
            'c786b224827b313255912ea42a1e312d22d28b9b9e8dcb1a091c18eaa6081acf'
            'bbb5dcc19cac4e19c506210da901280c3063a6a241480bf12bc874e6a5c02657')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}

  patch -p0 < ${srcdir}/01_fix_cassandra_home_path.patch
}

package() {
  mkdir -p ${pkgdir}/etc
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/cassandra
  mkdir -p ${pkgdir}/usr/share/java/cassandra
  mkdir -p ${pkgdir}/usr/lib/python2.7/site-packages

  cd "${srcdir}/${_pkgname}-${pkgver}"

  cp -a pylib/cqlshlib ${pkgdir}/usr/lib/python2.7/site-packages
  cp -a {lib,interface} ${pkgdir}/usr/share/cassandra/
  cp -a conf ${pkgdir}/etc/cassandra/
  ln -s /etc/cassandra ${pkgdir}/usr/share/cassandra/conf

  cd "${srcdir}/${_pkgname}-${pkgver}/bin"

  install \
    cassandra \
    cassandra-cli \
    cqlsh \
    json2sstable \
    nodetool \
    sstable2json \
    sstablekeys \
    sstableloader \
    sstablescrub \
    stop-server \
    ${pkgdir}/usr/bin/

  install \
    cassandra.in.sh \
    ${pkgdir}/usr/share/cassandra/

  install -D -m644 ${srcdir}/cassandra.service ${pkgdir}/lib/systemd/system/cassandra.service
  install -Dm644 ${srcdir}/cassandra-tmpfile.conf ${pkgdir}/usr/lib/tmpfiles.d/cassandra.conf
}

# vim:set ts=2 sw=2 et:
