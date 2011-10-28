## Contributor: shahid <helllamer@gmail.com>
## Originally based on following PKGBUILDs:
## - Thomas Dziedzic's: cassandra 

## More info about this PKGBUILD: 
## - https://bitbucket.org/helllamer/archlinux-pkgbuild/wiki/pkgbuild/solandra-git

name=solandra
pkgname=$name-git
pkgver=20111029
pkgrel=1
pkgdesc="NoSQL database (Cassandra with Apache Solr)"
arch=('any')
url="https://github.com/tjake/Solandra"
license=('Apache 2.0')
conflicts=('cassandra')
depends=('java-runtime')
makedepends=('apache-ant' 'git')
provides=('cassandra')

_gitroot=$url
_gitname=$name

gitdir=$srcdir/$_gitname
builddir=$srcdir/$_gitname-build

SOLANDRA_HOME=usr/share/$name

## install directories
etc_d=etc/$name
share_d=$SOLANDRA_HOME
bin_d=usr/bin
var_lib_d=var/lib/$name
var_log_d=var/log/$name


build() {
	cd $srcdir
	msg "Connecting to the git server..."

	if [[ -d $srcdir/$_gitname ]] ; then
		cd $_gitname
		git remote set-url origin $_gitroot
		git pull origin
		msg "The local files are updated."
	else
		git clone --depth 1 $_gitroot $_gitname || echo skipping
	fi
	msg "Git checkout done"

	msg "Starting make..."
	rm -rf $builddir
	cp -r $gitdir $builddir

	## recently installed apache-ant may not be seen shell
	which ant || . /etc/profile.d/apache-ant.sh

	## making all things
	cd $builddir
	ant
}

## unit tests
check1() {
	cd $builddir
	ant test
}


package() {
	mkdir -p $pkgdir/$var_lib_d
	mkdir -p $pkgdir/$var_log_d
	mkdir -p $pkgdir/$bin_d
	mkdir -p $pkgdir/$etc_d
	mkdir -p $pkgdir/$share_d/lib

	chown http:http $pkgdir/$var_lib_d $pkgdir/$var_log_d
	
	## install everything
	cd $builddir/solandra-app
	install -D -m755 bin/{solandra,nodetool,cassandra-cli} $pkgdir/$bin_d

	## install bash-include with fixed paths
	install -D -m755 bin/$name.in.sh $pkgdir/$share_d
	sed -e "s@\`dirname \$0\`/..@/$share_d@" \
	    -e 's@\(for jar in \)\(lib\)@\1$SOLANDRA_HOME/\2@' \
	    -i $pkgdir/$share_d/$name.in.sh
	
	## fix path for storing data: from /tmp to /var/lib
	sed -e "s@/tmp/cassandra-data@/$var_lib_d@g" -i conf/cassandra.yaml
	sed -e "s@/var/log/cassandra@/$var_log_d@g"  -i conf/log4j-server.properties
	## move configs to /etc with symlink
	install -m644 conf/* $pkgdir/$etc_d
	ln -s /$etc_d $pkgdir/$share_d/conf
	
	## copy lib
	install -D -m644 lib/* $pkgdir/$share_d/lib/
}
