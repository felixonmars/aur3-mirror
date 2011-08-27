# Contributor: Kosenko Roman <madkite@gmail.com>
pkgname=red5-dev
pkgver=1.0.0
pkgrel=4195
pkgdesc='Open-Source Flash Server (Development Version)'
arch=('i686' 'x86_64')
url='http://osflash.org/red5'
license=('LGPL')
depends=('java-environment>=5')
makedepends=(subversion 'apache-ant>=1.7.0')
backup=(etc/conf.d/red5 etc/red5/{access.properties,catalina.policy,context.xml,ehcache.xml,logback.xml,password.properties,quartz.properties,realm.properties,red5.globals,red5.policy,red5.properties,red5.xml,tomcat-users.xml,web.xml})
install="${pkgname%-*}.install"
source=(
	#http://dist.osjava.org/releases/official/simple-jndi/simple-jndi-0.11.4.1.tar.gz \
	http://mirrors.ibiblio.org/pub/mirrors/maven2/simple-jndi/simple-jndi/0.11.4.1/simple-jndi-0.11.4.1.jar \
	${pkgname%-*}.sh ${pkgname%-*}.conf)
noextract=(red5-$pkgver.tar.gz)
options=(docs)
provides=("red5=$pkgver")
conflicts=("red5")

_svnurl='http://red5.googlecode.com/svn/java/server/trunk'
_svnsrc="${SRCDEST}/$pkgname-$pkgver.tar.gz"
_docurl='http://red5.googlecode.com/svn/doc/trunk'
_demosurl='http://red5.googlecode.com/svn/flash/trunk/deploy'

#if you want to build 1.0rc1 then comment out next line
true && pkgrel=$(svn info "${_svnurl}" | awk '/Revision/ {print $2}')

build() {
	cd $startdir/src
	msg 'Preparing sources...'
	[ -d $pkgname ] && rm -rf $pkgname
	[ -f ${_svnsrc} ] && tar -xzf ${_svnsrc}
	if [ -d $pkgname/.svn ]; then
		msg "Updating from ${_svnurl}"
		svn up -r $pkgrel $pkgname
	else
		msg "Checkouting from ${_svnurl}"
		svn co "${_svnurl}" -r $pkgrel $pkgname
	fi
	cd $pkgname
	if [ -d doc/.svn ]; then
		msg "Updating from ${_docurl}"
		svn up -r $pkgrel doc
	else
		msg "Checkouting from ${_docurl}"
		svn co "${_docurl}" -r $pkgrel doc
	fi
	if [ -d webapps/root/demos/.svn ]; then
		msg "Updating from ${_demosurl}"
		svn up -r $pkgrel webapps/root/demos
	else
		msg "Checkouting from ${_demosurl}"
		svn co "${_demosurl}" -r $pkgrel webapps/root/demos
	fi
	cd -
	tar -czf ${_svnsrc} $pkgname
	cd $pkgname || return $?

	msg 'Starting make...'
	sed 's/${java.target_version}/1.6/g' -i build.xml
	ant || return $?
	cd dist
	#sed -i 's|\(.port\)=443|\1=8443|' conf/red5.properties

	msg 'Starting install...'
	mkdir -p $startdir/pkg/opt/red5
	#mv $startdir/src/simple-jndi-*/simple-jndi-*.jar lib
	install -m0644 $startdir/src/simple-jndi-*.jar lib
	mv lib $startdir/pkg/opt/red5
	#install -m0755 red5.sh $startdir/pkg/opt/red5
	install -m0644 *.jar $startdir/pkg/opt/red5
	mv plugins $startdir/pkg/opt/red5

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

	find ../doc -depth -type d -name .svn -exec rm -r {} \;
	mkdir -p $startdir/pkg/usr/share/doc
	mv ../doc $startdir/pkg/usr/share/doc/red5
	#mv swf $startdir/pkg/usr/share/doc/red5

	cd ../src; rm -rf conf; find -depth -type d -name .svn -exec rm -r {} \;
	zip -rq $startdir/pkg/opt/red5/src.zip *

	install -D -m0754 -o 67 -g 67 $startdir/src/${pkgname%-*}.sh $startdir/pkg/etc/rc.d/${pkgname%-*}
	install -D -m0664 -o 67 -g 67 $startdir/src/${pkgname%-*}.conf $startdir/pkg/etc/conf.d/${pkgname%-*}
}

#md5sums=('e19aaacee16be383fe805ce8acd28620' '5a7ff7c813c0862b96bca96984c89797' 'b49fadd28934e899b2143f297faa97a2')
md5sums=('5141e422734fd718e0f82d73124388ba' '5a7ff7c813c0862b96bca96984c89797' 'b49fadd28934e899b2143f297faa97a2')
