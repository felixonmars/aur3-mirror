# Contributor: Dan Serban

pkgname=qvd-db
pkgver=0.01.8443
pkgrel=1
pkgdesc="The QVD database maintains the current state of the platform"
arch=(any)
url=http://qvdblog.qindel.com/
license=(GPL)
depends=(perl postgresql)
source=("http://qvd.qindel.com/debian/pool/main/libq/libqvd-config-perl/libqvd-config-perl_0.1.9804.105-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-db-perl/libqvd-db-perl_0.1.9838.94-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-log-perl/libqvd-log-perl_0.1.9241.30-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/q/qvd-sample-config/qvd-sample-config_0.01.8448~b12_all.deb"
        "http://qvd.qindel.com/debian/pool/main/q/qvd-db/qvd-db_0.01.8443~b12_all.deb")
md5sums=('0bc79ba394d23eebe248de84a44d9b3c'
         '20bc4204e916810fc2e37086aa9139d9'
         '3aabc81ce83d203259ac098d347567ad'
         '349305355b9e8a0b364ec2c05e9495a4'
         '1d1835acbf68be90e5a09019c0f9d602')

build()
{
  ar -xv "libqvd-config-perl_0.1.9804.105-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-db-perl_0.1.9838.94-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-log-perl_0.1.9241.30-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "qvd-sample-config_0.01.8448~b12_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "qvd-db_0.01.8443~b12_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  mv usr "${pkgdir}/"
}
