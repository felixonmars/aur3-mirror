# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-hostmaster-dev
_pkgname=hostmaster
pkgver=3.0_alpha1
pkgrel=1
pkgdesc="mass Drupal hosting system - frontend (dev version)"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=(
    'aegir-provision'
    'cron'
    'php-gd'
    'rsync'
    'mariadb'
    'sudo'
    'smtp-forwarder'
    'unzip'
)
optdepends=(
    'apache: for apache support'
    'php-apache: for apache support'
    'nginx: for nginx support'
    'php-fpm: for nginx support'
)
install=$pkgname.install
options=(!upx !strip)
provides=('aegir-hostmaster')
conflicts=('aegir-hostmaster')
source=(
    "http://ftp.drupal.org/files/projects/${_pkgname}-7.x-${pkgver/_/-}-core.tar.gz"
    'http://ftp.drupal.org/files/projects/devel-7.x-1.5.tar.gz'
    'php.ini'
    'php-fpm.conf'
    'php-fpm.svc.conf'
    'nginx.conf'
    'nginx.svc.conf'
    'service'
    'sudoers'
)
md5sums=('ec94749f5b4d2243bba9ceda8ee62ca8'
         'f06c912eb4edbd48fbcc2867516726a3'
         '6bd6a1c6264fe7c06d79d1f5159b1e68'
         'c6d35d7fde52d628b13d1d65be8ff782'
         'e052eeae1565fcd35550900003ffa840'
         'a849c7594eedec0ef415b972da048815'
         'e8b6c3748c26caf4af21d402e7a0b947'
         '675f8f7b0bec18b3a02c6a5db5de5360'
         '21178d56a58133e39309dd98d94409cc')

package() {
    cd "${_pkgname}-7.x-${pkgver/_/-}"

    msg2 'Adding hostmaster site files'
    install -m755 -d "${pkgdir}/var/lib/aegir/hostmaster"
    mv sites "${pkgdir}/var/lib/aegir/hostmaster"
    chown -R http:http "${pkgdir}/var/lib/aegir"

    msg2 'Adding hostmaster static files'
    install -m755 -d "${pkgdir}/usr/share/webapps/aegir"
    ln -s /var/lib/aegir/hostmaster/sites "${pkgdir}/usr/share/webapps/aegir"
    mv * "${pkgdir}/usr/share/webapps/aegir"
    find "${pkgdir}/usr/share/webapps/aegir" -type f -exec chmod 0644 {} +
    find "${pkgdir}/usr/share/webapps/aegir" -type d -exec chmod 0755 {} +

    # Known issue: http://community.aegirproject.org/3.0-alpha1
    msg2 'Adding devel module (known 7.x-3.0-alpha1 bug)'
    cd $srcdir
    install -m755 -d "${pkgdir}/var/lib/aegir/hostmaster/sites/all/modules"
    mv devel "${pkgdir}/var/lib/aegir/hostmaster/sites/all/modules"

    msg2 'Adding misc config files'
    cd $srcdir
    install -Dm644 php.ini          "${pkgdir}/etc/php/conf.d/aegir.ini"
    install -dm750                  "${pkgdir}/etc/sudoers.d"
    install -Dm440 sudoers          "${pkgdir}/etc/sudoers.d/aegir"
    install -Dm644 php-fpm.conf     "${pkgdir}/etc/php/fpm.d/aegir.conf"
    install -Dm644 nginx.conf       "${pkgdir}/etc/nginx/aegir.conf"
    install -Dm644 service          "${pkgdir}/usr/lib/systemd/system/aegir.service"
    install -Dm644 php-fpm.svc.conf "${pkgdir}/usr/lib/systemd/system/php-fpm.service.d/aegir.conf"
    install -Dm644 nginx.svc.conf   "${pkgdir}/usr/lib/systemd/system/nginx.service.d/aegir.conf"
    mkdir -p "{pkgdir}/var/lib/aegir/{backups,clients,config/{includes,self,server_localhost,server_master/nginx/{platform,post,pre,subdir,platform}.d},platforms}"
    install -dm711 "${pkgdir}/var/lib/aegir/config"
    ln -sr /var/lib/aegir/config/server_master/nginx.conf "${pkgdir}/var/lib/aegir/config/nginx.conf"

    msg2 'Applying file permissions'
    chown -R 170:170 "${pkgdir}/usr/share/webapps/aegir"
    chown -R 170:170 "${pkgdir}/var/lib/aegir"
    find "${pkgdir}/usr/share/webapps/aegir" -type f -exec chmod 0644 {} +
    find "${pkgdir}/usr/share/webapps/aegir" -type d -exec chmod 0755 {} +
    find "${pkgdir}/var/lib/aegir" -type f -exec chmod 0644 {} +
    find "${pkgdir}/var/lib/aegir" -type d -exec chmod 0755 {} +
}
