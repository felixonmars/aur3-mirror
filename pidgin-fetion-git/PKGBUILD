# Maintainer: Chen Xing <cxcxcxcx@gmail.com>

pkgname=pidgin-fetion-git
_pidginver=2.6.6
pkgver=20100622
pkgrel=1
pkgdesc="China Mobile Fetion Protocol Plugin for pidgin, git version maintained by standin000"
arch=('i686' 'x86_64')
url="http://github.com/standin000/fetion"
license=('GPL')
makedepends=('avahi' 'tk' 'ca-certificates' 'intltool' 'git')
depends=('pidgin>=2.6.0')
options=('!libtool')

_gitroot="git://github.com/standin000/fetion.git"
_gitname="fetion"


source=( http://downloads.sourceforge.net/pidgin/pidgin-$_pidginver.tar.bz2
)

build() {

  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d "${srcdir}/${_gitname}" ] ; then
    cd ${_gitname} && git pull --rebase
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/pidgin-$_pidginver"
  rm -rf libpurple/protocols/fetion
  cp -r ../${_gitname} libpurple/protocols/fetion
  sed -i 's/qq/fetion/g' configure.ac
#  patch -p1 < ../config.patch
#  patch -p1 < ../protocol-makefile.patch

  ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install --disable-meanwhile \
--disable-nm --disable-perl --disable-gnutls --enable-cyrus-sasl --disable-doxygen \
--with-system-ssl-certs=/etc/ssl/certs || return 1
  make distclean
  ./configure --prefix=/usr --sysconfdir=/etc --disable-schemas-install --disable-meanwhile \
--disable-nm --disable-perl --disable-gnutls --enable-cyrus-sasl --disable-doxygen \
--with-system-ssl-certs=/etc/ssl/certs || return 1
  cd libpurple/protocols/fetion
  make || return 1
  mkdir -p $pkgdir/usr/lib/purple-2 || return 1
  mv .libs/libfetion.so $pkgdir/usr/lib/purple-2/


}
md5sums=(
'b37ab6c52db8355e8c70c044c2ba17c1'
)

