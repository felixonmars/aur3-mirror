# Maintainer: Radim Kolar <hsn at sendmail dot cz>
# Contributor: Guillaume ALAUX <guillaume at alaux dot net>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Konstantin Nikiforov <helllamer@gmail.com> 
# Contributor: Alper Kanat <alperkanat@raptiye.org>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>

# check() function is used to verify GPG signature. check() imports 3 keys into your GPG keyring at first build.
# See http://scarybeastsecurity.blogspot.com/2011/07/alert-vsftpd-download-backdoored.html for reason of this step.
# If you have problems with gpg, you can remove check() function, and all will be ok.

_pkgname=cassandra
pkgname="${_pkgname}-12"
pkgver=1.2.11
pkgrel=1
pkgdesc='NoSQL database (precompiled version)'
arch=('any')
url='http://cassandra.apache.org/'
license=('APACHE')
depends=('java-runtime')
makedepends=('gnupg')
checkdepends=('curl' 'gnupg' 'ca-certificates')
options=(!strip)
optdepends=('python: to use Python CLI administration scripts')
conflicts=('dsc-cassandra' 'cassandra-11' 'cassandra-1.2')
provideds=('cassandra')
backup=(etc/cassandra/cassandra-env.sh
        etc/cassandra/cassandra-rackdc.properties
        etc/cassandra/cassandra-topology.properties
        etc/cassandra/cassandra.yaml
        etc/cassandra/commitlog_archiving.properties
        etc/cassandra/log4j-server.properties
        etc/cassandra/log4j-tools.properties)
_url_tgz="http://archive.apache.org/dist/${_pkgname}/${pkgver}/apache-${_pkgname}-${pkgver}-bin.tar.gz"
install="${_pkgname}.install"
source=("${_url_tgz}"
        "${_pkgname}.service.systemd"
        "${_pkgname}.install"
        '01_fix_cassandra_home_path.patch'
        '02_fix_jvm_opts_for_jre7.patch')

build() {
  cd ${srcdir}/apache-cassandra-${pkgver}

  # https://issues.apache.org/jira/browse/CASSANDRA-4275
  for p in 01_fix_cassandra_home_path 02_fix_jvm_opts_for_jre7;
  do
    patch -p0 < ${srcdir}/${p}.patch
  done
}

## to check gpg signature
check() {
  msg "Checking GPG signature..."
  msg2 "(To disable gpg-check: build with '--nocheck')"
  gpg --list-keys | grep 'sylvain@datastax.com' || {
    _url_keys='https://www.apache.org/dist/cassandra/KEYS'
    msg "No maintainers' GPG keys found. Importing from ${_url_keys} ..."
    curl --silent -o - ${_url_keys} | gpg --import -
  }
  # no need to add signature to package dependences
  echo "${_url_tgz}.asc"
  curl --silent -o - "${_url_tgz}.asc" | gpg --verify - "apache-${_pkgname}-${pkgver}-bin.tar.gz"
  msg2 "Detached GPG signature is valid."
}

package() {
  cd ${srcdir}/apache-cassandra-${pkgver}

  mkdir -p ${pkgdir}/{usr/bin,etc/cassandra}
  mkdir -p ${pkgdir}/{usr/bin,usr/share/cassandra,usr/share/java/cassandra}

  cp -a interface pylib tools ${pkgdir}/usr/share/cassandra/

  mkdir -p ${pkgdir}/usr/share/cassandra/bin/
  for f in bin/*; do
    if [[ ! "${f}" == *.bat && -x ${f} ]]; then
      cp -a ${f} ${pkgdir}/usr/share/cassandra/bin/
      ln -s /usr/share/cassandra/${f} ${pkgdir}/usr/${f}
    fi
  done
  cp -a bin/cassandra.in.sh ${pkgdir}/usr/share/cassandra/

  cp -a lib/* ${pkgdir}/usr/share/java/cassandra/
  ln -s ../java/cassandra ${pkgdir}/usr/share/cassandra/lib

  cp -a conf/* ${pkgdir}/etc/cassandra/
  ln -s /etc/cassandra ${pkgdir}/usr/share/cassandra/conf

  install -Dm644 ${srcdir}/cassandra.service.systemd \
                 ${pkgdir}/lib/systemd/system/cassandra.service
}
md5sums=('c6f80161bcc90b9f5e909e9de388957a'
         'a528a268e681b621e34ccdf019243c9f'
         '1a87ea05115d3fb998b0d0f03ea5e8e1'
         '8d6129b0bf4e5d8a2cf8efea3d1279bd'
         '3d6f6eb899531bd0dc16ef519b523221')
