# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Maciej Sitarz <macieks@freesco.pl>

_pkgname=kadu
pkgname=kadu-git
pkgver=0.10.0.beta2.r4453.gc57623f
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Qt-based Gadu-Gadu client - git build"
url="http://www.kadu.net/"
license=(GPL2)
depends=('qt>=4' 'libgadu-devel' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'inputproto')
optdepends=('libsndfile: module sound' \
	'aspell: module spellchecker' \
	'phonon: module phonon_sound' \
	'qca-ossl: module encryption' \
	'libxtst: module panelkadu' \
	'libxss: module idle' \
	'curl: module plus_pl_sms'
	'geoip: module geoip_lookup')
conflicts=('kadu')
provides=('kadu')
install=kadu-git.install
source=('git://gitorious.org/kadu/kadu.git'
		'kadu-git.install'
		'kadu-git.modules')
md5sums=('SKIP'
         '4d5fcec9fdc6825a489dbe448b5c5f04'
         '432da87b47f18020b9049a1d49ec7f2e')


pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd ${srcdir}

  # Include file with modules list
  source ${srcdir}/kadu-git.modules

  check_new_modules
  change_modules

  mkdir -p ${srcdir}/BUILD
  cd ${srcdir}/BUILD

  cmake -D CMAKE_INSTALL_PREFIX=/usr -D CMAKE_BUILD_TYPE="Release" -DQT_QMAKE_EXECUTABLE=qmake-qt4 ../$_pkgname

  make
}

package() {
  cd $_pkgname

  make DESTDIR=$pkgdir install

  rm -rf $pkgdir/usr/share/kadu/{HISTORY,README}
  mv "$pkgdir"/usr/sdk "$pkgdir"/usr/share/kadu/sdk
}

change_modules() {
	for MOD in $modules_static; do
		echo $MOD | grep '!' &> /dev/null
		if [ "$?" == "1" ]; then
			msg "Static... $MOD"
			if [ ! -z "`grep -w $MOD .config`" ]; then
				sed -i "s/^$MOD=./$MOD=y/" .config
			else
				error "$MOD not found in .config"
				#return 1
			fi
		fi
	done
	for MOD in $modules_dynamic; do
		echo $MOD | grep '!' &> /dev/null
		if [ "$?" == "1" ]; then
			msg "As module... $MOD"
			if [ ! -z "`grep -w $MOD .config`" ]; then
				sed -i "s/^$MOD=./$MOD=m/" .config
			else
				error "$MOD not found in .config"
				#return 1
			fi
		fi
	done
	for MOD in $modules_skip; do
		echo $MOD | grep '!' &> /dev/null
		if [ "$?" == "1" ]; then
			msg "Disabling module... $MOD"
			if [ ! -z "`grep -w $MOD .config`" ]; then
				sed -i "s/^$MOD=./$MOD=n/" .config
			else
				error "$MOD not found in .config"
				#return 1
			fi
		fi
	done
}

check_new_modules() {
    ALL_MODULES="`awk '/\=[ynm]/ && sub("=[ynm]","")' .config`"
    new_modules="0"

    for M in $ALL_MODULES; do
    	found="0"
	for m in $modules_static $modules_dynamic $modules_skip; do
	    if [ "$M" == "$m" -o "!$M" == "$m" ]; then
		    found="1"
	    fi
	done

	if [ "$found" == "0" ]; then
		warning "$M not found in PKGBUILD variables"
		let new_modules++
	fi
    done
    if [ "$new_modules" != "0" ]; then
    	sleep 10
	return 0
    fi
    return 0
}
