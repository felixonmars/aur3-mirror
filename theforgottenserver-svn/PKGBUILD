# Maintainer: Gadget3000 <gadget3000 at msn dot com>
# Contributor: zoulnix <z[o]ulnix.borke[dd]uck.c[o]m>
pkgname=theforgottenserver-svn
pkgver=80
_pkgver=0.3.6pl1
pkgrel=1
pkgdesc="Server based on OpenTibia."
arch=('i686' 'x86_64')
url="http://otland.net"
license=('GPL')
depends=('gmp' 'libxml2' 'lua' 'libmysqlclient' 'sqlite3')
makedepends=('autoconf' 'automake' 'gcc' 'make' 'pkgconfig' 'subversion' 'boost')
options=('!libtool')
provides=('theforgottenserver')
conflicts=('theforgottenserver')
backup=('etc/forgottenserver/config.lua')

_svntrunk="svn://svn.otland.net/public/forgottenserver/tags/${_pkgver}"
_svnmod="forgottenserver"

build() { 
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #

  # Generating build system
  ./autogen.sh || return 1

  ./configure --prefix=/usr \
	      --sysconfdir=/etc/${_svnmod} \
	      --localstatedir=/var \
	      --disable-static \
	      --enable-server-diag \
	      --enable-homedir-conf \
	      --enable-mysql \
	      --enable-sqlite

  touch Makefile.new
  for i in $(eval echo {1..$(cat Makefile | wc -l)}); do
	if [ -z "$(cat Makefile | tail -n +$i | head -n 1 | grep "OPTIONAL_FLAGS")" ]; then
		cat Makefile | tail -n +$i | head -n 1 >> Makefile.new
	else
		cat Makefile | tail -n +$i | head -n 1 | sed "s/$/ -DBOOST_FILESYSTEM_VERSION=2/" >> Makefile.new
	fi
  done
  mv Makefile.new Makefile

  make
  
  install -Dd ${pkgdir}/usr/share/${_svnmod}/
  install -Dd ${pkgdir}/usr/bin/
  install -Dd ${pkgdir}/etc/${_svnmod}/
  install -Dd ${pkgdir}/usr/share/${_svnmod}/schemas/
#  install -Dd ${pkgdir}/usr/share/${_svnmod}/

  cp -r data ${pkgdir}/usr/share/${_svnmod}/
  install -m755 theforgottenserver ${pkgdir}/usr/bin/ || return 1
  install -m644 config.lua ${pkgdir}/etc/${_svnmod}/ || return 1
  install -m644 schemas/*.sql ${pkgdir}/usr/share/${_svnmod}/schemas/ || return 1
  install -m644 forgottenserver.s3db ${pkgdir}/usr/share/${_svnmod}/ || return 1
}
