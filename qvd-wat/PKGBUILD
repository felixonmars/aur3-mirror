# Contributor: Dan Serban

pkgname=qvd-wat
pkgver=0.01.9752.20
pkgrel=1
pkgdesc="The QVD Web Administration Tool is a web application for administering the QVD platform"
arch=(any)
url=http://qvdblog.qindel.com/
license=(GPL)
depends=(perl)
source=("http://qvd.qindel.com/debian/pool/main/libq/libqvd-admin-perl/libqvd-admin-perl_0.1.9963.95-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-admin-web-perl/libqvd-admin-web-perl_1.r9983~b97_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-config-perl/libqvd-config-perl_0.1.9804.105-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-db-perl/libqvd-db-perl_0.1.9838.94-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-l7r-loadbalancer-perl/libqvd-l7r-loadbalancer-perl_0.1.9719.8-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-log-perl/libqvd-log-perl_0.1.9241.30-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/q/qvd-sample-config/qvd-sample-config_0.01.8448~b12_all.deb"
        "http://qvd.qindel.com/debian/pool/main/q/qvd-wat/qvd-wat_0.01.9752.20_all.deb")
md5sums=('988f90215dc0cf27d487dec99734ae43'
         '6e54cdcc5c57cc13b3a0be766ef7c94a'
         '0bc79ba394d23eebe248de84a44d9b3c'
         '20bc4204e916810fc2e37086aa9139d9'
         'ebaef133f6657cbe9262014e136c0c0e'
         '3aabc81ce83d203259ac098d347567ad'
         '349305355b9e8a0b364ec2c05e9495a4'
         'b48a86b6427299e57886c2fed7ef2aa7')

build()
{
  ar -xv "libqvd-admin-perl_0.1.9963.95-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-admin-web-perl_1.r9983~b97_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-config-perl_0.1.9804.105-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-db-perl_0.1.9838.94-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-l7r-loadbalancer-perl_0.1.9719.8-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-log-perl_0.1.9241.30-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "qvd-sample-config_0.01.8448~b12_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "qvd-wat_0.01.9752.20_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  mv usr "${pkgdir}/"
}
