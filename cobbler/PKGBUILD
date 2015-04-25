# Contributor: Michael Eckert <michael.eckert@linuxmail.org>
pkgname=cobbler
pkgver=2.6.7
pkgrel=1
pkgdesc="Cobbler is a Linux installation Server"
arch=('i686' 'x86_64')
url="http://cobbler.github.com"
license=('GPLv2+')
depends=( 'python>=2.3' apache tftp-hpa mod_wsgi2 createrepo python2-augeas python2-cheetah python2-netaddr python2-simplejson urlgrabber python2-yaml rsync cdrkit python2-distribute)
makedepends=( python2-cheetah )
source=( "https://github.com/cobbler/cobbler/archive/v${pkgver}.tar.gz"
         "cobbler.conf" )
md5sums=( 'a42aa6d9d919b394988adab4c5ed3fe1'
          'a7002f68f558495ac28c5b88a1c9902f' )

build() {
  cd $srcdir/cobbler-${pkgver}
  # compile
  python2 setup.py build
}

package() {
  cd $srcdir/cobbler-${pkgver}
  python2 setup.py install --optimize=1 --root=${pkgdir} $PREFIX
  mkdir -p ${pkgdir}/etc/httpd/conf.d/
  cp ../cobbler.conf ${pkgdir}/etc/httpd/conf.d/

  mkdir -p ${pkgdir}/var/spool/koan
  mkdir -p ${pkgdir}/srv/tftp/images

  rm -f ${pkgdir}/etc/cobbler/cobblerd

  rm -rf ${pkgdir}/etc/init.d/
  mkdir -p ${pkgdir}/usr/lib/systemd/system/
  install -m0644 config/cobblerd.service ${pkgdir}/usr/lib/systemd/system/
}
