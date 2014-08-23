# Maintainer: Martin I. Aranciaga <malakian14@live.com>
pkgname=sentora-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Sentora is an open-source web hosting control panel built 
specifically to work on a variety of Linux distributions (ZPanel fork)" 
arch=('i686' 'x86_64')
url="http://sentora.io/"
license=('GPL')
depends=('mariadb' 'apache' 'php-apache' 'php' 
'php-gd' 'php-mcrypt' 'php-pear' 'php-xsl' 'db'
'zip' 'dovecot' 'postfix' 'postfix-tools' 'libsass'
'proftpd' 'bind' 'webalizer' 'php-suhosin' 'cronie'
 'at' 'pigeonhole' 'git')
conflicts=('apparmor' 'apparmor-bzr')
install=sentora.install
source=("git://github.com/sentora/sentora-core")
md5sums=('SKIP')

package() {

cd "sentora-core"

install -dm777 "${pkgdir}/etc/zpanel"
install -dm777 "${pkgdir}/etc/zpanel/configs"
install -dm777 "${pkgdir}/etc/zpanel/panel"
install -dm777 "${pkgdir}/etc/zpanel/docs"

install -dm777 "${pkgdir}/var/zpanel"
install -dm777 "${pkgdir}/var/bind"
install -dm770 "${pkgdir}/var/zpanel/hostdata"
install -dm770 "${pkgdir}/var/zpanel/hostdata/zadmin"
install -dm770 "${pkgdir}/var/zpanel/hostdata/zadmin/public_html"

chown -R http:http "${pkgdir}/var/zpanel/hostdata"

install -dm777 "${pkgdir}/var/zpanel/logs"
install -dm777 "${pkgdir}/var/zpanel/logs/proftpd"
install -dm777 "${pkgdir}/var/zpanel/backups"
install -dm777 "${pkgdir}/var/zpanel/temp"

cp -rf . "${pkgdir}/etc/zpanel/panel"
cd "${pkgdir}"
git clone http://github.com/wlan0/zpanelconfigpack_archlinux
cp -R "${pkgdir}/zpanelconfigpack_archlinux/archlinux/." "${pkgdir}/etc/zpanel/configs/"

chmod 664 "${pkgdir}/etc/zpanel/configs/phpmyadmin/config.inc.php"
chmod -R 777 "${pkgdir}/etc/zpanel/panel/etc/tmp"

chmod +x "${pkgdir}/etc/zpanel/panel/bin/zppy"
chmod +x "${pkgdir}/etc/zpanel/panel/bin/setso"
chmod +x "${pkgdir}/etc/zpanel/panel/bin/setzadmin"

cc -o "${pkgdir}/etc/zpanel/panel/bin/zsudo" "${pkgdir}/etc/zpanel/configs/bin/zsudo.c"
sudo chown root "${pkgdir}/etc/zpanel/panel/bin/zsudo"
chmod +s "${pkgdir}/etc/zpanel/panel/bin/zsudo"

}
