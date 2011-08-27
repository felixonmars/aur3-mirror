# Contributor: Sven Kauber <celeon@gmail.com>
#
# Based loosely on the method described by Anthony Shearer
# Firewall log analysis using ACID, 05.12.2003, SANS Security Essentials
# (http://www.giac.org/certified_professionals/practicals/gsec/3479.php)

pkgname=ipt-base
pkgver=1.1.4
pkgrel=5
pkgdesc="A web-based firewall log analysis method using BASE"
url="http://secureideas.sourceforge.net/"
depends=('mysql' 'php' 'apache' 'gd' 'libpng' 'libjpeg' 'zlib' 'perl' 'perl-dbi' 'iptables' 'perl-libwww')
install=$pkgname.install
source=(http://puzzle.dl.sourceforge.net/sourceforge/secureideas/base-$pkgver.tar.gz \
        http://www.snort.org/dl/current/snort-2.3.3.tar.gz \
        http://shweps.free.fr/snorter/logsnorter-0.3.tar.gz \
	http://puzzle.dl.sourceforge.net/sourceforge/adodb/adodb464.tgz \
	sql \
	snorterd)
md5sums=('d8eee6f83a8dda8e2d170e8cd4b4ea5e'
         '06bf140893e7cb120aaa9372d10a0100'
	 'ac5447c519b18a8310473ae5802d390b'
	 '8d87f56de744929c9c49ba82e0c84b8e'
	 'acd0af3103a55b86bb96c05128a9539a'
	 'de29b9ed4fb77afaf29ffadde577fa46')
build()
{
  #1. creating the needed dirs
     mkdir -p $startdir/pkg/etc \
              $startdir/pkg/usr/bin \
	      $startdir/pkg/etc/rc.d \
	      $startdir/pkg/home/httpd/html/base \
     #the following is only needed when this package will be installed on a central
     #logging server - see Shearer's doc, page 7
       #mkdir -p $startdir/pkg/var/log
  
  #2. creating proper mysql tables and the database users (base and logsnorter)
     cd $startdir/src/snort-2.3.3/schemas
     echo -n "Insert your mysql root password to create and populate the database: "
     read -e PASSWD
     mysqladmin -uroot -p$PASSWD create probes
     mysql -uroot -p$PASSWD probes < create_mysql
     mysql -uroot -p$PASSWD probes < $startdir/sql
  
  #3. setting up the logsnorter script and its settings
     install -D -m755 $startdir/logsnorter $startdir/pkg/usr/bin/logsnorter
     install -D -m644 $startdir/logsnorter.conf $startdir/pkg/etc/logsnorter.conf
     install -D -m700 $startdir/snorterd $startdir/pkg/etc/rc.d/snorterd
     #only  for the central logging server
       #touch $startdir/pkg/var/log/probes
       
  #4. copying acid and needed stuff to their places and setting permissions
     cd $startdir/src
     cp -ax base-$pkgver/* adodb $startdir/pkg/home/httpd/html/base
     chown -R nobody.nobody $startdir/pkg/home/httpd/html/base
     mv $startdir/pkg/home/httpd/html/base/base_conf.php.dist $startdir/pkg/home/httpd/html/base/base_conf.php

  #5. sedding the configuration file
     ac="$startdir/pkg/home/httpd/html/base/base_conf.php"
     
     sed -i 's|^.*\$DBlib_path.*$|$DBlib_path = "/home/httpd/html/base/adodb";|' $ac
     sed -i 's|^.*\$DBtype.*$|$DBtype = "mysql";|' $ac
     sed -i 's|^.*\$alert_dbname.*$|$alert_dbname = "probes";|' $ac
     sed -i 's|^.*\$alert_host.*$|$alert_host = "localhost";|' $ac
     sed -i 's|^.*\$BASE_urlpath.*$|$BASE_urlpath = "/base";|' $ac
     sed -i 's|^.*\$alert_user.*$|$alert_user = "base";|' $ac
     sed -i 's|^.*\$alert_password.*$|$alert_password = "password";|' $ac 
     sed -i 's|^.*\$event_cache_auto_update.*$|$event_cache_auto_update = 0;|' $ac    
}
