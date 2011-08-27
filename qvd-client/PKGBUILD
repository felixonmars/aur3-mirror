# Contributor: Dan Serban

pkgname=qvd-client
pkgver=0.01.8560
pkgrel=1
pkgdesc="The QVD client allows establishing a virtual desktop session on a QVD server"
arch=(any)
url=http://qvdblog.qindel.com/
license=(GPL)
depends=(nxserver)
source=("http://qvd.qindel.com/debian/pool/main/libq/libqvd-client-perl/libqvd-client-perl_0.1.9753.129-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-config-perl/libqvd-config-perl_0.1.9804.105-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-http-perl/libqvd-http-perl_0.1.9241.25-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/libq/libqvd-httpc-perl/libqvd-httpc-perl_0.1.9573.34-1_all.deb"
        "http://qvd.qindel.com/debian/pool/main/q/qvd-client/qvd-client_0.01.8560~b11_all.deb")
md5sums=('7c3e8ac8c8ba8f000ddf746c32777fd0'
         '0bc79ba394d23eebe248de84a44d9b3c'
         'f4e609e51490c4877eed074c775e5091'
         '4570039bd5e361629701fe13a4912d6d'
         'a3d8a074fac14b3e8bbb814b198293fd')

build()
{
  ar -xv "libqvd-client-perl_0.1.9753.129-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-config-perl_0.1.9804.105-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-httpc-perl_0.1.9573.34-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "libqvd-http-perl_0.1.9241.25-1_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  ar -xv "qvd-client_0.01.8560~b11_all.deb"
  bsdtar -xvf data.tar.gz
  rm data.tar.gz
  mv usr "${pkgdir}/"
}
