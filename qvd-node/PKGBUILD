# Contributor: Dan Serban

pkgname=qvd-node
pkgver=0.01ubuntu1.9669.181
pkgrel=1
pkgdesc="QVD cluster servers handle virtual desktop connections from QVD clients and manage virtual machines"
arch=(any)
url=http://qvdblog.qindel.com/
license=(GPL)
source=("http://qvd.qindel.com/debian/pool/main/libq/libqvd-config-perl/libqvd-config-perl_0.1.9804.105-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-db-perl/libqvd-db-perl_0.1.9838.94-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-hkd-perl/libqvd-hkd-perl_0.1.9894.141-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-http-perl/libqvd-http-perl_0.1.9241.25-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-httpc-perl/libqvd-httpc-perl_0.1.9573.34-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-httpd-perl/libqvd-httpd-perl_0.1.9241.35-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-l7r-loadbalancer-perl/libqvd-l7r-loadbalancer-perl_0.1.9719.8-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-l7r-perl/libqvd-l7r-perl_0.1.9859.105-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-log-perl/libqvd-log-perl_0.1.9241.30-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-node-perl/libqvd-node-perl_0.1.9894.28-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-parallelnet-perl/libqvd-parallelnet-perl_0.01.9162~b19_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-simplerpc-perl/libqvd-simplerpc-perl_0.1.9763.39-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-uri-perl/libqvd-uri-perl_0.1.9241.37-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/q/qvd-sample-config/qvd-sample-config_0.01.8448~b12_all.deb"
        "http://qvd.qindel.com/debian/pool/main/q/qvd-node/qvd-node_0.01ubuntu1.9669.181_all.deb")
md5sums=('0bc79ba394d23eebe248de84a44d9b3c'
         '20bc4204e916810fc2e37086aa9139d9'
         '6c4624ea787b9d36dbd183a528b3e1be'
         'f4e609e51490c4877eed074c775e5091'
         '4570039bd5e361629701fe13a4912d6d'
         'f2be1e8938c7698ca34826d027f9ed96'
         'ebaef133f6657cbe9262014e136c0c0e'
         'ef770ca0576f7820dd383a301370066a'
         '3aabc81ce83d203259ac098d347567ad'
         'a196c6f64c57aa47a31d0159b2fb8410'
         '3b68952a8b82a72acdcaabaa22a87f6f'
         '4c06104fbb9455ad097240452f3e2512'
         '60e9ffb327917da53c86839b1b10e039'
         '349305355b9e8a0b364ec2c05e9495a4'
         '52ed9f95ef9fcf0e0ab0cf3942d88f9c')

build()
{
  ar -xv "libqvd-config-perl_0.1.9804.105-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-db-perl_0.1.9838.94-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-hkd-perl_0.1.9894.141-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-http-perl_0.1.9241.25-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-httpc-perl_0.1.9573.34-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-httpd-perl_0.1.9241.35-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-l7r-loadbalancer-perl_0.1.9719.8-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-l7r-perl_0.1.9859.105-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-log-perl_0.1.9241.30-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-node-perl_0.1.9894.28-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-parallelnet-perl_0.01.9162~b19_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-simplerpc-perl_0.1.9763.39-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-uri-perl_0.1.9241.37-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "qvd-sample-config_0.01.8448~b12_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "qvd-node_0.01ubuntu1.9669.181_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  mv usr "${pkgdir}/"
}
