# Contributor: Philipp 'TamCore' B. <philipp {at} tamcore {dot} eu>
# Maintainer: Hoang Duc Hieu <hdh @ lazny.tang.la>

pkgname=etherpad-git
pkgver=20100824
pkgrel=1
pkgdesc="This is the open source repo of EtherPad, a web-based realtime collaborative document editor"
url="http://github.com/ether/pad"
license=('APACHE')
arch=('i686' 'x86_64')
depends=('scala2.7' 'mysql' 'jre') # scala 2.8 broke something with the byte type
makedepends=('git' 'jdk' 'javacc')
source=(http://ftp.gwdg.de/pub/misc/mysql/Downloads/Connector-J/mysql-connector-java-5.1.11.tar.gz
    variable-scala-exe.patch
    etherpad.sh
    etherpad.install)
install=('etherpad.install')

md5sums=('22630172e67c1a96996c3201d9b30398'
         '94d92ea833649f18acbead9818258e21'
         '139aca195c80df64b102b5fb98bffac6'
         '5c7013916f7fa770e64f964bd8926bed')

_gitroot="http://github.com/ether/pad.git"
_gitname="etherpad"

build() {
	# msg "Connecting to Git server..."
	# if [ -d $_gitname ]; then
	# 	cd $_gitname
	# 	git pull origin
	# 	msg2 "The local files have been updated"
	# else
	# 	git clone $_gitroot $_gitname || return 1
	# 	msg2 "Git checkout done"
	# fi
	# msg "Update complete."

	if [ ! -z "`grep 'localbox.info' $srcdir/$_gitname/etherpad/etc/etherpad.localdev-default.properties`" ]; then
		echo "Under which domain do you want to run etherpad? "
		read domain
		sed -i "s/localbox.info/${domain}/" "$srcdir"/$_gitname/etherpad/etc/etherpad.localdev-default.properties
	fi

	if [ ! -z "`grep 'listen = 9000' $srcdir/$_gitname/etherpad/etc/etherpad.localdev-default.properties`" ]; then
		echo "On which port do you want to run etherpad?: "
		read port
		sed -i "s/listen = 9000/listen = ${port}/" "$srcdir"/$_gitname/etherpad/etc/etherpad.localdev-default.properties
	fi

	if [ ! -z "`grep 'etherpad.adminPass = password' $srcdir/$_gitname/etherpad/etc/etherpad.localdev-default.properties`" ]; then
		echo "Enter an etherpad admin password: "
		read adminpass
		sed -i "s/etherpad.adminPass = password/etherpad.adminPass = ${adminpass}/" "$srcdir"/$_gitname/etherpad/etc/etherpad.localdev-default.properties
	fi

	source "$srcdir"/etherpad.sh
	export CC=$SCALA_HOME/bin/fsc
	export SCALA_LIBRARY_JAR=$SCALA_HOME/lib/scala-library.jar
	export MYSQL_CONNECTOR_JAR="$srcdir"/mysql-connector-java-5.1.11/mysql-connector-java-5.1.11-bin.jar

	cd "$srcdir"/$_gitname/
	git checkout infrastructure/bin/comp.sh infrastructure/ace/bin/make infrastructure/ace/bin/serve # for some reason patch makes makepkg abort, have to revert the files
	patch -Np1 -i "$srcdir"/variable-scala-exe.patch
	cd "$srcdir"/$_gitname/infrastructure/
	bin/makejar.sh || return 1
	cd "$srcdir"/$_gitname/infrastructure/ace
	bin/make normal etherpad || return 1
	cd "$srcdir"/$_gitname/
	mv infrastructure/build/appjet.jar etherpad/appjet-eth-dev.jar
	rm -rf infrastructure/{appjet,build,buildjs,buildcache}

	mkdir -p "$pkgdir"/opt/etherpad
	cp -a "$srcdir"/$_gitname/etherpad "$srcdir"/$_gitname/infrastructure "$pkgdir"/opt/etherpad/ || return 1
	rm -r "$pkgdir"/opt/etherpad/infrastructure/{bin,rhino1_7R1,yuicompressor}
	install -D -m644 "$srcdir"/etherpad.sh "$pkgdir"/etc/profile.d/etherpad.sh || return 1

	mkdir -m 774 "$pkgdir"/opt/etherpad/etherpad/data
	chown http "$pkgdir"/opt/etherpad/etherpad/data
}
