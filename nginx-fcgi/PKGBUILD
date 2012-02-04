# Contributor: Piotr Rogoża <rogoza.piotr@gmail.com>
pkgname=nginx-fcgi
pkgver=0.4.3
pkgrel=2
pkgdesc="nginx-fcgi is a perl script to provide simple cgi support for nginx http daemon, it's still in development by Daniel Dominik Rudnicki."
arch=('any')
url="http://www.nginx.eu/nginx-fcgi.html"
license=('GPL')
depends=('perl-fcgi' 'perl-io-all')
backup=('etc/conf.d/nginx-fcgi.conf' 'etc/nginx/nginx-fcgi.conf')
optdepends=('nginx: stable 0.7.65' 'nginx-unstable: unstable >0.8.35 from AUR')
source=('http://www.nginx.eu/nginx-fcgi/nginx-fcgi.txt'
  'http://www.nginx.eu/download/nginx.cgi.txt'
  'http://www.nginx.eu/download/nginx.logrotate.txt'
  'http://www.nginx.eu/nginx-fcgi/nginx-fcgi.sysconfig.txt'
  'http://www.nginx.eu/nginx-fcgi/nginx-fcgi.init.txt'
  'nginx-fcgi'
  'nginx.conf')
build() {
	sed -i "s#\"nginx\"#\"http\"#" ${pkgname}.sysconfig.txt
	sed -i "s#nginx/nginx-fcgi.log#nginx-fcgi/nginx-fcgi.log#" ${pkgname}.sysconfig.txt
	#sed -i -e 's/#SPAWN_PORT/SPAWN_PORT/' ${pkgname}.sysconfig.txt
	#sed -i -e 's/#SPAWN_ADDR/SPAWN_ADDR/' ${pkgname}.sysconfig.txt
	sed -i -e "s#nginx nginx#http http#" nginx.logrotate.txt
	sed -i -e "s#/sbin/service nginx graceful#/etc/rc.d/nginx reload#" nginx.logrotate.txt
	sed -i 2d nginx.logrotate.txt
	sed -i '1 a compress' nginx.logrotate.txt
	install -Dm775 ${pkgname} ${pkgdir}/etc/rc.d/${pkgname}
	install -Dm775 ${pkgname}.txt ${pkgdir}/usr/bin/${pkgname}
	install -Dm664 ${pkgname}.sysconfig.txt ${pkgdir}/etc/conf.d/${pkgname}.conf
	install -Dm775 nginx.cgi.txt ${pkgdir}/usr/share/doc/${pkgname}/examples/nginx.cgi
	install -Dm775 ${pkgname}.init.txt ${pkgdir}/usr/share/doc/${pkgname}/${pkgname}
	install -Dm664 nginx.conf ${pkgdir}/etc/nginx/nginx-fcgi.conf
	install -Dm664 nginx.logrotate.txt ${pkgdir}/etc/logrotate.d/${pkgname}
	install -dm775 -o http -g http ${pkgdir}/var/log/${pkgname}
	
  echo "You can include file /etc/nginx/${pkgname}.conf to your virtualhost's configure"

}

md5sums=('31b373e4ff18fb2891fa338b7157c91d'
         '8695e4a6957314055a820133e0bea2f0'
         'db3821985a2e3a9c25ca796ae4d96458'
         '0db736adeb4f87c22d758e977ba85363'
         '86322e7bf623eb74f983d6f5952588e6'
         '845a933fb161c442961f747b2759e443'
         'bb1f25bd2de31efcc8fe4e81e3951d01')
