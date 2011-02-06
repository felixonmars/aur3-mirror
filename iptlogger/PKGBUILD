#Contributor: Sven Kauber <celeon@gmail.com>

pkgname=iptlogger
pkgver=0.4
pkgrel=2
pkgdesc="A php/perl based iptables log analyzer"
url="http://www.gege.org/iptables/"
depends=('perl' 'perl-dbd-mysql' 'apache' 'php' 'mysql')
backup=('/home/httpd/html/iptables/config.php' '/usr/bin/feed_db.pl')
install=iptlogger.install
source=(http://www.gege.org/iptables/iptables_logger_v${pkgver}.tar.gz \
	iptlogd \
	install.php)
md5sums=('e680c934afa1ef05e27833bea90b8739' 
	 '420c0fa9e8628caaa31aae1ce12aea07'
	 '39a875ac9cb54e98757669c1c5a6b4ee')

build()
{
    #making the directories
    mkdir -p $startdir/pkg/usr/bin $startdir/pkg/home/httpd/html/iptables $startdir/pkg/etc/rc.d
    
    #copying stuff for the package and setting some rights
    cd $startdir/src/iptables
    cp -ax web/* $startdir/pkg/home/httpd/html/iptables
    cp -ax sql $startdir/pkg/home/httpd/html/iptables    
    install -D -m700 $startdir/iptlogd $startdir/pkg/etc/rc.d/iptlogd
    install -D -m700 $startdir/install.php $startdir/pkg/home/httpd/html/iptables/install.php
    install -D -m700 $startdir/src/iptables/scripts/feed_db.pl $startdir/pkg/usr/bin/feed_db.pl
    
    #setting the proper rights
    chown -R nobody.nobody $startdir/pkg/home/httpd/html/iptables
    chown -R nobody.nobody $startdir/pkg/usr/bin/feed_db.pl #to allow editing via install.php
    cd $startdir/pkg/home/httpd/html/
    find -regex ".*\.php" -type f -exec chmod 700 \{\} \;
    find -type d -exec chmod 711 \{\} \;
}
