# Contributor: Kosenko Roman <madkite@gmail.com>
pkgname=subcommander2-svn
pkgver=2.0.0
url='http://subcommander.tigris.org'
_svntrunk="${url}/svn/subcommander/trunk/"
pkgrel=2201
true && pkgrel=$(svn info --username 'guest' --password 'dummy' "${_svntrunk}" | awk '/Revision/ {print $2}')
pkgdesc='A GUI frontend for subversion (based on Qt4)'
license=('GPL')
depends=('subversion>=1.4.4' 'neon' 'openssl' 'db' 'apr' 'apr-util' 'boost' 'qt4>=4.3.0' 'gettext' 'krb5-crypto' 'zlib')
makedepends=('gcc' 'gawk' 'perl' 'python' 'ruby')
arch=('i686' 'x86_64')
source=(subcommander2-patches.zip)
md5sums=()
options=('!libtool')
conflicts=('subcommander')

_svnsrc="${SRCDEST}/${pkgname}-${pkgver}.tar.gz"

build() {
	cd ${startdir}/src/
	[ -d ${pkgname} ] && rm -rf ${pkgname}
	[ -f ${_svnsrc} ] && tar -xzf ${_svnsrc}
	msg "Connecting to ${_svntrunk} SVN server..."
	if [ -d ${pkgname}/.svn ]; then
		svn up ${pkgname}
	else
		svn co --username 'guest' --password 'dummy' "${_svntrunk}" ${pkgname}
	fi
	msg 'SVN checkout done or server timeout'
	tar -czf ${_svnsrc} ${pkgname}
	cd ${pkgname}
	msg 'Starting make...'
	for i in ../*.patch; do
		patch -i $i -p1 || return $?
	done
	./gen_ac.sh
	./gen_version.rb
	./configure --prefix=/usr --enable-nls --with-qt=/usr || return $?
	cp sublib/settings/SettingsWidget.* sublib/
	make || return $?
	make prefix=${startdir}/pkg/usr install || return $?
}
