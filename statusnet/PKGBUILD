# Contributor: fauno <fauno@kiwwwi.com.ar>
pkgbase=statusnet
pkgname=statusnet
pkgver=0.9.9

# find available plugins and locales
srcfile=${SRCDEST}/${pkgbase}-${pkgver}.tar.gz
if [ -e ${srcfile} ]; then
plugins=($(bsdtar -tf ${srcfile} \
                      ${pkgbase}-${pkgver}/plugins | \
                      cut -d'/' -f3 | sort -u))
locales=($(bsdtar -tf ${srcfile} \
                      ${pkgbase}-${pkgver}/locale | \
                      cut -d'/' -f3 | sort -u))
fi

# looping avoids having "statusnet-plugin-" package
true && pkgname=(${pkgname}-base
         $(for plugin in ${plugins[@]}; do
             echo ${plugin} | tr [A-Z] [a-z] | \
             sed "s/^/statusnet-plugin-/"
         done)
         $(for locale in ${locales[@]}; do
             echo ${locale} | tr [A-Z] [a-z] | \
             sed "s/^/statusnet-i18n-/"
         done))
pkgrel=2
arch=('any')
pkgdesc="StatusNet is a Free and Open Source microblogging platform."
url="http://status.net"
license=('AGPL')
depends=('php>=5.2.3' 'mysql>=5' 'php-gd' 'php-curl' 'php-gmp')
source=("http://status.net/${pkgbase}-${pkgver}.tar.gz"
        statusnet.install)
install=statusnet.install
md5sums=('766c9d42825fc99d8ad6c554a959568b'
         'c638cb36b7da7eb67a67e031f59e6068')
options=(!strip !zipman emptydirs)

build() {
    /bin/true
}

package_statusnet-base() {
  provides=('statusnet')
  optdepends=('memcache: for caching database queries'
              'php-xcache: for accelerating PHP code execution'
              'php-apc: for accelerating PHP code execution'
              'php-ldap: for the LDAP plugin'
              'statusnet-plugin-ostatus: for federation')

  cd "$srcdir/$pkgbase-${pkgver}"

  etc_dir="${pkgdir}/etc/webapps/${pkgbase}"
  usr_dir="${pkgdir}/usr/share/webapps/${pkgbase}"

  install -d ${usr_dir}
  install -d ${etc_dir}
  install -d ${pkgdir}/usr/share/doc/${pkgbase}/
  install -d ${pkgdir}/usr/share/licenses/${pkgbase}

  install -m644 ./{config.php,htaccess}.sample \
      ${pkgdir}/usr/share/doc/${pkgbase}/

  install -m644 ./{README,EVENTS.txt,lighttpd.conf.example} \
      ${pkgdir}/usr/share/doc/${pkgbase}/

  install -m644 COPYING ${pkgdir}/usr/share/licenses/${pkgbase}/

  rm -f *.sample README COPYING README EVENTS.txt *.example

  cp -ra * ${usr_dir}/
  chmod a+w ${usr_dir}/{avatar,background,file}

  msg2 "Install bogus config.php"
  touch ${etc_dir}/config.php
  chmod a+w ${etc_dir}/config.php
  ln -s /etc/webapps/statusnet/config.php ${usr_dir}/config.php

  msg2 "Remove locale and plugins in favor of split packages"
  rm -rf ${usr_dir}/{locale,plugins}

  install -d ${usr_dir}/plugins
  install -d ${usr_dir}/locale

  install -d ${pkgdir}/srv/http
  ln -s /usr/share/webapps/${pkgbase} ${pkgdir}/srv/http/
} 

# Helper for creating i18n packages
statusnet-i18n-helper() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -d "${pkgdir}/usr/share/webapps/statusnet/locale/${1}"
  cp -ra "./locale/${1}" "${pkgdir}/usr/share/webapps/statusnet/locale/${1}/"
}

# Helper for creating plugin packages
statusnet-plugin-helper() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  install -d "${pkgdir}/usr/share/webapps/statusnet/plugins/${1}"
  cp -ra "./plugins/${1}" "${pkgdir}/usr/share/webapps/statusnet/plugins/${1}/"
}


for plugin in ${plugins[@]}; do
    plugin_lower=$(echo ${plugin} | tr [A-Z] [a-z])

    eval "
package_statusnet-plugin-${plugin_lower}() {
    pkgdesc='${plugin} plugin for StatusNet'
    depends=('statusnet-base')
    groups=('statusnet-plugins')

    statusnet-plugin-helper ${plugin}
}"
done

for locale in ${locales[@]}; do
    locale_lower=$(echo ${locale} | tr [A-Z] [a-z])

    eval "
package_statusnet-i18n-${locale_lower}() {
    pkgdesc='${locale} locale for StatusNet'
    depends=('statusnet-base')
    groups=('statusnet-locales')

    statusnet-i18n-helper ${locale}
}"
done
pkgdesc="StatusNet is a Free and Open Source microblogging platform."
