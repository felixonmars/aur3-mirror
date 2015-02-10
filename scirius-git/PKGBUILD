# Maintainer: Thomas Marchsteiner <tommy[0x2e]m86[0x40]gmail[0x2e]com>
pkgname=scirius-git
_pkgname=scirius
pkgver=1.0.rc1.r4.gbc96bf5
pkgrel=2
pkgdesc="a Django Application for Suricata IDS/IPS Rule Management"
arch=('any')
url="https://www.stamus-networks.com/"
license=('GPL3')
depends=('python2-django' 'python2-django-tables2' 'python2-django-bootstrap3' 'python2-south' 'python2-gitpython'
                'python2-pyinotify' 'python2-daemon' 'python2-pygments' 'python2-requests' 'python2-psutil'
                'python2-django-revproxy' 'python2-pytz' 'python2-lxml' )
optdepends=('elasticsearch: Display rule activity'
                        'kibana: Links Kibana Dashboards in scirius'
                        'nginx: a reversy proxy for the django app'
                        'python2-flup: fcgi support'
                         )
makedepends=('git')
install='scirius-git.install'
backup=('usr/share/webapps/scirius/db.sqlite3'
                'usr/share/webapps/scirius/scirius/settings.py')
conflicts=('scirius')
provides=('scirius')
options=(emptydirs)
source=('git+https://github.com/StamusNetworks/scirius.git'
            'scirius-fcgi.service'
            'scirius.service'
            'nginx.example.conf'
            'scirius-git.install'
            'suri_reloader.patch'
            'suri-reloader.service'
            'suri-reloader.defaults'
            'scirius.tmpfile')
md5sums=('SKIP'
                    '11004acf4ae17b950057b056ced73182'
                    'bd13da75f521e5968c0d7767c5e5f16f'
                    'c25edb72a450176f0bbd2b5122995817'
                    '49a5e9180eac2a6a8f1b35d02d163593'
                    '425a4fe6af73a6d11359294cd74ef46d'
                    '2a0b80ae3d113954f82f1f2d043ca7e9'
                    '859c61d447e71a7d1b74c4fdad1ebc5f'
                    '426b26add56b9dbf4c1d8bc439cec143')

pkgver() {
        cd $srcdir/$_pkgname
        ( set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}  

prepare() {
        cd ${srcdir}/${_pkgname}/suricata/scripts/
        patch -uN suri_reloader ${srcdir}/suri_reloader.patch || return 1
}

package() {
        
        cd ${srcdir}/${_pkgname}
        mkdir -p ${pkgdir}/usr/share/webapps/${_pkgname}/static
        cp -Rp ${srcdir}/${_pkgname}/* ${pkgdir}/usr/share/webapps/scirius
        cd ${pkgdir}/usr/share/webapps/${_pkgname}
        python2 manage.py syncdb --noinput
        
        #sed -i "s/#\!\/usr\/bin\/python/#\!\/usr\/bin\/python2/" ${pkgdir}/usr/share/webapps/$_pkgname/suricata/scripts/suri_reloader
        sed -i "s/#\!\/usr\/bin\/env\ python/#\!\/usr\/bin\/python2/" ${pkgdir}/usr/share/webapps/$_pkgname/manage.py
        
        chmod 660 ${pkgdir}/usr/share/webapps/$_pkgname/db.sqlite3
        
        install -d ${pkgdir}/etc/suricata/rules/rules
        install -d ${pkgdir}/usr/share/doc/$_pkgname
        install -d ${pkgdir}/usr/share/licenses/$_pkgname
        
        install -Dm644 ${srcdir}/scirius-fcgi.service ${pkgdir}/usr/lib/systemd/system/scirius-fcgi.service
        install -Dm644 ${srcdir}/scirius.service ${pkgdir}/usr/lib/systemd/system/scirius.service
        install -Dm755 ${pkgdir}/usr/share/webapps/$_pkgname/suricata/scripts/suri_reloader ${pkgdir}/usr/bin/suri_reloader      
        install -Dm644 ${pkgdir}/usr/share/webapps/$_pkgname/README.rst ${pkgdir}/usr/share/doc/$_pkgname/README.rst
        install -Dm644 ${pkgdir}/usr/share/webapps/$_pkgname/LICENSE ${pkgdir}/usr/share/licenses/$_pkgname/LICENSE
        install -Dm644 ${srcdir}/nginx.example.conf ${pkgdir}/usr/share/doc${_pkgname}/nginx.example.conf
        
        install -Dm644 ${srcdir}/suri-reloader.service ${pkgdir}/usr/lib/systemd/system/suri-reloader.service
        install -Dm644 ${srcdir}/suri-reloader.defaults ${pkgdir}/etc/default/suri-reloader
        install -Dm644 ${srcdir}/scirius.tmpfile ${pkgdir}/etc/tmpfiles.d/scirius.conf
        
}
