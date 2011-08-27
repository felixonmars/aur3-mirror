# Contributor: Kosenko Roman <madkite@gmail.com>
pkgname=red5
pkgver=0.9.1
pkgrel=1
pkgdesc='Open-Source Flash Server'
arch=('i686' 'x86_64')
url='http://osflash.org/red5'
license=('LGPL')
depends=('java-environment>=6')
backup=(etc/conf.d/red5 etc/red5/{access.properties,catalina.policy,ehcache.xml,log4j.properties,logback.xml,password.properties,realm.properties,red5.globals,red5.policy,red5.properties,red5.xml,tomcat-users.xml,web.xml})
install="${pkgname%-*}.install"
source=(http://trac.red5.org/downloads/$(tr '.' '_' <<< ${pkgver%.*})/red5-$pkgver.tar.gz \
	#http://dist.osjava.org/releases/official/simple-jndi/simple-jndi-0.11.4.1.tar.gz \
	http://mirrors.ibiblio.org/pub/mirrors/maven2/simple-jndi/simple-jndi/0.11.4.1/simple-jndi-0.11.4.1.jar \
	${pkgname%-*}.sh ${pkgname%-*}.conf)
noextract=(red5-$pkgver.tar.gz simple-jndi-0.11.4.1.jar)
options=(docs)

build() {
	cd $startdir/src
	#ar -x red5_*.deb && tar xfz data.tar.gz && cd usr/lib/red5 || return $?
	mkdir red5 && tar xfz red5-*.tar.gz -C red5 && cd red5 || return $?
	cd red5-*

	#sed -i 's|\(.port\)=443|\1=8443|' conf/red5.properties

	mkdir -p $startdir/pkg/opt/red5
	#mv $startdir/src/simple-jndi-*/simple-jndi-*.jar lib
	mv $startdir/src/simple-jndi-*.jar lib
	mv lib $startdir/pkg/opt/red5
	#install -m0755 red5.sh $startdir/pkg/opt/red5
	install -m0644 *.jar $startdir/pkg/opt/red5

	for i in conf/red5*.xml conf/red5.globals; do
		sed 's#${red5.root}/webapps#/srv/red5#' -i $i
	done

	mkdir -p $startdir/pkg/etc
	mv conf $startdir/pkg/etc/red5
	chgrp -R 67 $startdir/pkg/etc/red5
	chmod 0640 $startdir/pkg/etc/red5/*
	ln -s /etc/red5 $startdir/pkg/opt/red5/conf

	mkdir -p $startdir/pkg/srv
	mv webapps $startdir/pkg/srv/red5
	chown -R 67:67 $startdir/pkg/srv/red5
	chmod 0775 $startdir/pkg/srv/red5
	ln -s /srv/red5 $startdir/pkg/opt/red5/webapps

	install -d -m775 -o 67 -g 67 $startdir/pkg/var/log/red5
	ln -s /var/log/red5 $startdir/pkg/opt/red5/log

	ln -s /var/tmp $startdir/pkg/opt/red5/work

	#find ../doc -depth -type d -name .svn -exec rm -r {} \;
	mkdir -p $startdir/pkg/usr/share/doc
	mv doc $startdir/pkg/usr/share/doc/red5
	#mv swf $startdir/pkg/usr/share/doc/red5

	#unzip -q src.zip
	#cd src; #rm -rf conf; find -depth -type d -name .svn -exec rm -r {} \;
	#zip -rq $startdir/pkg/opt/red5/src.zip *
	mv src.zip $startdir/pkg/opt/red5

	install -D -m0754 -o 67 -g 67 $startdir/src/${pkgname%-*}.sh $startdir/pkg/etc/rc.d/${pkgname%-*}
	install -D -m0664 -o 67 -g 67 $startdir/src/${pkgname%-*}.conf $startdir/pkg/etc/conf.d/${pkgname%-*}
}

#md5sums=('a2eb54ce2a86584c5274db9d0a515475' 'e19aaacee16be383fe805ce8acd28620' '5a7ff7c813c0862b96bca96984c89797' 'b49fadd28934e899b2143f297faa97a2')
md5sums=('a2eb54ce2a86584c5274db9d0a515475' '5141e422734fd718e0f82d73124388ba' '5a7ff7c813c0862b96bca96984c89797' 'b49fadd28934e899b2143f297faa97a2')
