# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Contributor: Werner Hartnagel <cssguru@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=gitblit
pkgver=1.0.0
pkgrel=1
pkgdesc="Pure Java stack for managing, viewing, and serving Git repositories."
arch=(any)
url="http://gitblit.com"
license=(APACHE)
depends=('java-environment>=6' 'bash')
optdepends=('smtp-server: to enable mail notifications'
            'gitblit-manager: remote administration client')
install=${pkgname}.install
changelog=Changelog
backup=("etc/${pkgname}/${pkgname}.properties"
        "etc/${pkgname}/users.conf"
        "etc/conf.d/${pkgname}")
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.zip"
        "${pkgname}.conf.d"
        "${pkgname}.install"
        "${pkgname}.logrotate.d"
        "${pkgname}.rc.d"
        "${pkgname}.properties.patch")
md5sums=('a9868a85881c6ed0996db5592edd7d30'
         '411d09fb25d917937e4e20e49e0982b2'
         '484c9437cb93515f0f8920223a2335ad'
         '598c329cfe7817c4b7d1df91248dc881'
         '7940f1ed85d01901fd2c9a20f0357183'
         '57b7e20b63e0a5fddd963f340d55a366')

build() {
  msg2 "Patch paths in ${pkgname}.properties..."
  cd "${srcdir}"
  patch -p0 -i ${pkgname}.properties.patch
}

package() {
  msg2 "Install Java livraries in /usr/share/java/${pkgname}..."
  install -Dm644 "${srcdir}/${pkgname}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  msg2 "Install configuration files in /etc/${pkgname}..."
  install -dm755                                   "${pkgdir}/etc/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.properties" "${pkgdir}/etc/${pkgname}/"
  install -Dm644 "${srcdir}/users.conf"            "${pkgdir}/etc/${pkgname}/"

  msg2 "Setup links to runtime resources in /var/lib/${pkgname}..."
  install -dm755                                  "${pkgdir}/var/lib/${pkgname}"
  ln -s /usr/share/java/${pkgname}/${pkgname}.jar "${pkgdir}/var/lib/${pkgname}/"
  ln -s /etc/${pkgname}/${pkgname}.properties     "${pkgdir}/var/lib/${pkgname}/"

  msg2 "Install daemon script in /etc/rc.d..."
  install -Dm755 "${srcdir}/${pkgname}.rc.d" "${pkgdir}/etc/rc.d/${pkgname}"

  msg2 "Install daemon conf file in /etc/conf.d..."
  install -Dm644 "${srcdir}/${pkgname}.conf.d" "${pkgdir}/etc/conf.d/${pkgname}"

  msg2 "Install logrotate configuration in /etc/logrotate.d..."
  install -Dm755 "${srcdir}/${pkgname}.logrotate.d" "${pkgdir}/etc/logrotate.d/${pkgname}"

  msg2 "Install documentation resources in /usr/share/doc/${pkgname}..."
  install -Dm644 "${srcdir}/NOTICE" "${pkgdir}/usr/share/doc/${pkgname}/NOTICE"
  cp -a "${srcdir}"/docs/*          "${pkgdir}/usr/share/doc/${pkgname}/"

  msg2 "Install copyright resources in /usr/share/licenses/${pkgname}..."
  install -Dm644 "${srcdir}/LICENSE"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  ln -s /usr/share/doc/${pkgname}/NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
