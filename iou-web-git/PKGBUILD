pkgname=iou-web-git
_pkgname=iou-web
pkgver=2.b8a256b
pkgrel=1
pkgdesc="Cisco IOU Web Interface"
arch=("any")
url="http://www.routereflector.com/en/cisco/cisco-iou-web-interface/"
license=("GPLv3")
depends=("apache>=2"
         "sqlite>=3"
         "php>=5"
         "php-apache"
         "php-gd"
         "php-pspell"
         "php-sqlite"
         "php-pear"
         "dos2unix"
         "libpcap"
         "xdotool"
         "shellinabox")
backup=("etc/httpd/conf/extra/httpd-${_pkgname}.conf"
        "etc/webapps/${_pkgname}/custom.php")
conflicts=("${_pkgname}")
makedepends=("git")
options=("emptydirs")
install="${_pkgname}.install"
source=("${_pkgname}.install")
md5sums=("eb482c7a57d7b621bfd36beb4b714739")
sha1sums=("77ca9c6103a1d4efeb35c0edf857c0c6035c0f0b")
pkgver() {
  git clone "https://bitbucket.org/dainok/${_pkgname}.git"
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
prepare(){
cat << EOL > "${srcdir}/sudoers"
Defaults:http runas_default=root, !requiretty, setenv, umask_override, umask=0002
http ALL=(root) NOPASSWD: /usr/share/webapps/${_pkgname}/bin/*
http ALL=(root) NOPASSWD: /usr/bin/ifconfig
http ALL=(root) NOPASSWD: /usr/bin/pkill
http ALL=(root) NOPASSWD: /usr/bin/rm
http ALL=(root) NOPASSWD: /usr/bin/apachectl
http ALL=(root) NOPASSWD: /usr/bin/fuser
http ALL=(root) NOPASSWD: /usr/bin/kill
http ALL=(root) NOPASSWD: /usr/bin/reboot
http ALL=(root) NOPASSWD: /usr/bin/fuser
EOL
cat << EOL > "${srcdir}/custom.php"
<?php
/**
 * Configuration file for ${_pkgname}
 **/
define('ADMIN', true);
// define('TIMEZONE', 'Europe/Rome');
// define('BASE_DIR', '/usr/share/webapps/${_pkgname}');
// define('BASE_WWW', 'http://192.168.0.130:81/iou');
// define('BASE_PORT', '2000');
// define('BCK_RETENTION', '10');
define('CHECK_UPDATE', false);
// define('PROXY', '192.168.0.1:3128');
// define('UPDATE_INTERVAL', '2');
?>
EOL
cat << EOL > "${srcdir}/${_pkgname}.conf"
d /tmp/iou 2755 http http
EOL
cat << EOL > "${srcdir}/shellinabox.css"
#vt100 #cursor.bright {
  background-color: #00FF00;
  color:            #000000;
}
#vt100 #scrollable {
  color:            #00FF00;
  background-color: #000000;
}
#vt100 #scrollable.inverted {
  color:            #000000;
  background-color: #00FF00;
}
#vt100 .ansi15 {
  color:            #000000;
}
#vt100 .bgAnsi0 {
  background-color: #00FF00;
}
EOL
}
build() {
  cd "${srcdir}/iou-web/wrapper"    && make clean && make || return 1
  cd "${srcdir}/iou-web/ioulive86"  && make clean && make || return 1
  cd "${srcdir}/iou-web/IOUsniffer" && make clean && make || return 1
}
package() {
  install -dm 1777 "${pkgdir}/tmp"
  install -dm 2755 "${pkgdir}/tmp/iou"
  install -dm 0750 "${pkgdir}/etc/sudoers.d/"
  install -dm 0755 "${pkgdir}/etc/webapps/"
  install -dm 0755 "${pkgdir}/etc/webapps/${_pkgname}"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${_pkgname}/"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${_pkgname}/bin"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${_pkgname}/cgi-bin"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${_pkgname}/labs"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${_pkgname}/data"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${_pkgname}/data/Export"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${_pkgname}/data/Import"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${_pkgname}/data/Logs"
  install -dm 0755 "${pkgdir}/usr/share/webapps/${_pkgname}/data/Sniffer"

  install -Dm 0755 "${srcdir}/iou-web/wrapper/wrapper-linux" "${pkgdir}/usr/share/webapps/${_pkgname}/bin/wrapper-linux"
  install -Dm 0755 "${srcdir}/iou-web/ioulive86/ioulive86"   "${pkgdir}/usr/share/webapps/${_pkgname}/bin/ioulive86"
  install -Dm 0755 "${srcdir}/iou-web/IOUsniffer/iousniff"   "${pkgdir}/usr/share/webapps/${_pkgname}/bin/iousniff"
  install -Dm 0755 "${srcdir}/${_pkgname}/cgi-bin/console"   "${pkgdir}/usr/share/webapps/${_pkgname}/cgi-bin/console"
  install -Dm 0644 "${srcdir}/${_pkgname}/data/template.sdb" "${pkgdir}/usr/share/webapps/${_pkgname}/data/template.sdb"
  install -Dm 0640 "${srcdir}/${_pkgname}.conf"              "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm 0644 "${srcdir}/custom.php"                    "${pkgdir}/etc/webapps/${_pkgname}/custom.php"
  install -Dm 0640 "${srcdir}/sudoers"                       "${pkgdir}/etc/sudoers.d/${_pkgname}"
  install -Dm 0644 "${srcdir}/${_pkgname}/conf/apache.conf"  "${pkgdir}/etc/httpd/conf/extra/httpd-${_pkgname}.conf"

  cp -r ${srcdir}/${_pkgname}/html/* ${pkgdir}/usr/share/webapps/${_pkgname}/
  rm "${pkgdir}/usr/share/webapps/${_pkgname}/includes/custom.php"
  ln -s "/etc/webapps/${_pkgname}/custom.php" "${pkgdir}/usr/share/webapps/${_pkgname}/includes/custom.php"

  install -Dm 0644 "${srcdir}/shellinabox.css" "${pkgdir}/usr/share/webapps/${_pkgname}/css/shellinabox.css"

  chown -R 33:33 "${pkgdir}/tmp/iou"
  chown -R 33:33 "${pkgdir}/usr/share/webapps/${_pkgname}/"

  sed -i "s/\/opt\/iou/\/usr\/share\/webapps\/${_pkgname}/g" \
         "${pkgdir}/etc/httpd/conf/extra/httpd-${_pkgname}.conf"
  sed -i "s/\/usr\/share\/webapps\/${_pkgname}\/html/\/usr\/share\/webapps\/${_pkgname}/g" \
         "${pkgdir}/etc/httpd/conf/extra/httpd-${_pkgname}.conf"
  sed -i "s/\/var\/www\/html/\/usr\/share\/httpd/g" \
         "${pkgdir}/etc/httpd/conf/extra/httpd-${_pkgname}.conf"
  sed -i "/Order allow,deny/d;s/Allow from all/Require all granted/g" \
         "${pkgdir}/etc/httpd/conf/extra/httpd-${_pkgname}.conf"

  sed -i "4d; 3 a \	/usr/bin/shellinaboxd --cgi --css=/usr/share/webapps/${_pkgname}/css/shellinabox.css --cert=/var/lib/shellinabox --service=\"/:\$(id -u):\$(id -g):HOME:telnet 127.0.0.1 \${parms}\"" \
         "${pkgdir}/usr/share/webapps/${_pkgname}/cgi-bin/console"

  sed -i "s/\/opt\/iou/\/usr\/share\/webapps\/${_pkgname}/g" \
         $(grep -rl "/opt/iou" "${pkgdir}/usr/share/webapps/${_pkgname}/")
  sed -i "s/\/html\/includes/\/includes/g" \
         $(grep -rl "/html/includes" "${pkgdir}/usr/share/webapps/${_pkgname}/")
}
