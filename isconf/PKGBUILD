# Maintainer: Alex 'AdUser' Z <ad_user@mail.ru>

pkgname='isconf'
pkgver='4.2.8.250'
pkgrel='2'
pkgdesc='Infrastructure configuration management tool'
arch=('any')
url=('http://www.isconf.org')
license=('GPL')
depends=('python2')
source=("http://trac.t7a.org/isconf/pub/${pkgname}-${pkgver}.tar.gz"
        "main.cf")
sha256sums=('c946a560455ad7e1fce2636ae6fe4f7b90310a6c0635263179e37a3727ca502d'
            'c15bf8e2f1c7a45ce955a912417b5f7e715da31801263d3d5a29a76e35f4b9ca')

build()
{
  cd ${srcdir}/${pkgname}-${pkgver}

  make
}

package()
{
  cd ${srcdir}/${pkgname}-${pkgver}
	
  python2 ./setup.py install --root="${pkgdir}/usr" --optimize=1

  # init script
  install -D -m755 "etc/rc.isconf" "${pkgdir}/etc/rc.d/isconf"

  # config
  install -D -m644 "../main.cf" "${pkgdir}/etc/is/main.cf"
  echo "udp 127.0.0.1"    > "${pkgdir}/etc/is/nets"
  echo "#udp 192.168.1.1" > "${pkgdir}/etc/is/nets"

  # manpages
  mkdir -p "${pkgdir}/usr/share/man/man8"
  gzip -c "doc/isconf.8" > "${pkgdir}/usr/share/man/man8/isconf.8.gz"

  # cache and journal data
  mkdir -p "${pkgdir}/var/is/conf"
}

# vim:set ts=2 sw=2 et:
