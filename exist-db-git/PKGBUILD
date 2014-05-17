# Maintainer: Andreas Wagner <andreas.wagner at em dot # uni-frankfurt dot de>
# Maintainer: Lazaros Koromilas <koromilaz@gmail.com>
pkgname=exist-db-git
pkgver=2.2RC
pkgrel=1
pkgdesc="XML database coded in Java"
arch=('i686' 'x86_64')
url="http://exist-db.org/"
license=('LGPL2.1')
depends=('java-runtime'
         'openssl')
makedepends=('git'
             'apache-ant')
conflicts=('exist')
provides=('exist')
install="exist.install"
source=('exist.initrc'
	'exist.sh'
	'exist.systemd')
# noextract=("${pkgname}-setup-${pkgver//_/-}.jar")

#_gitroot="https://github.com/eXist-db/exist.git."
_gitroot="git@github.com:eXist-db/exist.git"
_gitname="exist"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi

  cd $srcdir
  if [ -d $_gitname-build ]; then
    rm -rf $_gitname-build
  fi

  cp -a $_gitname $_gitname-build
  cd $_gitname-build

  ./build.sh

# build() {
#	cd "$srcdir"
# mkfifo pipe
# (
#	# Open pipe for writing.
#	exec 3>pipe
#	sleep 10
#	echo build >&3
#	sleep 2
#	echo 1 >&3
#	sleep 2
#	echo webapp/WEB-INF/data >&3
#	sleep 2
#	echo 1 >&3
#	sleep 2
#	echo adminPass >&3
#	sleep 2
#	echo adminPass >&3
#	sleep 2
#	echo 1024 >&3
#	sleep 2
#	echo 128 >&3
#	sleep 2
#	echo 1 >&3
#	# Close pipe.
#	exec 3>&-
#	) &

#	java -jar ${pkgname}-setup-${pkgver//_/-}.jar -console <pipe

#	# Remove Pipe
#	rm pipe

	# Prepare final pathnames in shell/config files
#	sed -i 's|EXIST_HOME=.*$|EXIST_HOME="/opt/eXist-db"|' \
#	    build-git/bin/*.{sh,bat}
#	sed -i 's|\${exist\.home}/webapp/WEB-INF/logs|/var/log/eXist-db|' \
#	    build-git/log4j.xml
}

package() {
  cd $srcdir/$_gitname-build
#  install -d -m755 "${pkgdir}/usr/lib"
#  make prefix=/usr mandir=/usr/share/man DESTDIR="${pkgdir}" install

	# Prepare directories
	install -dm755 ${pkgdir}/opt
	install -dm755 ${pkgdir}/etc/rc.d
	install -dm777 ${pkgdir}/var/log/exist
	install -dm755 ${pkgdir}/etc/systemd/system
	install -dm755 ${pkgdir}/etc/profile.d

	# Now move things over...
	mv ${srcdir}/$_gitname-build ${pkgdir}/opt/eXist-db
	rm -rf ${pkgdir}/opt/eXist-db/.git
	install -Dm755 ${srcdir}/exist.initrc    ${pkgdir}/etc/rc.d/exist
	install -Dm755 ${srcdir}/exist.systemd   ${pkgdir}/etc/systemd/system/exist-db.service
	install -Dm755 ${srcdir}/exist.sh        ${pkgdir}/etc/profile.d/

	# make the scripts evaluate their actual location
	sed -i 's|dirname "$0"|dirname $(readlink -f "$0")|' ${pkgdir}/opt/eXist-db/bin/*.sh
	sed -i 's|dirname "$PWD/$0"|dirname $(readlink -f "$PWD/$0")|' ${pkgdir}/opt/eXist-db/bin/*.sh

	# have nicer names
	for script in ${pkgdir}/opt/eXist-db/bin/*.sh
	    do ln -s $(basename $script) $(dirname $script)/exist-$(basename -s .sh $script)
	done

	install -dm 755 ${pkgdir}/usr/bin
	for script in ${pkgdir}/opt/eXist-db/bin/*.sh
	    do ln -s /opt/eXist-db/bin/$(basename $script) ${pkgdir}/usr/bin/exist-$(basename -s .sh $script)
	done
}

md5sums=('3a9d2c4afd083386f3222cac0415046a'
         'bbdcea2190f2c623469e433568303e31'
         '15be23f67688617b21f256eeddb03ea4')
