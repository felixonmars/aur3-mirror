# Maintainer: carbncl <carbncl at gmail>
# Based on netatalk package :
# Maintainer: Dominik Dingel <mail at wodar dot de>
# Contributor: William Udovich <nerdzrule7 at earthlink dot net>
# Contributor: Farhan Yousaf <farhany at xaviya dot com>

pkgname=netatalk-git
pkgver=20111014
pkgrel=1
pkgdesc="A kernel level implementation of the AppleTalk Protocol Suite"
provides=('netatalk')
conflicts=('netatalk')
arch=('i686' 'x86_64')
url="http://netatalk.sourceforge.net"
options=('!libtool')
license=("GPL")
backup=('etc/netatalk/afpd.conf' 
        'etc/netatalk/netatalk.conf' 
        'etc/netatalk/atalkd.conf' 
        'etc/netatalk/papd.conf' 
        'etc/netatalk/AppleVolumes.default' 
        'etc/netatalk/AppleVolumes.system'
        'etc/avahi/services/afpd.service')
depends=('openssl' 'pam' 'coreutils>=7.1-2' 'db' 'libgcrypt')
makedepends=('git')
optdepends=('avahi: STRONGLY RECOMMENDED: to use zeroconf features'
            'libcups: Printing system'
            'tcp_wrappers')
source=(afpd atalkd papd cnid)
install=netatalk.install
md5sums=('16ab9fa50ec4abde6de478fc7de57805'
         '2d05de4a16faf7d4af21b5f14e33fa82'
         'b16a687c96dd1ca7ffefd7c995356c0d'
         '84d1961726aaa8df08d63a0925358b1a')
_gitroot="git://netatalk.git.sourceforge.net/gitroot/netatalk/netatalk"
_gitname="netatalk"
_commit=51b00627bd2239880ab68f6565eb640b0b5d37c6

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git checkout master && git pull origin
    [[ "${_commit}" ]] && git checkout "${_commit}"
    msg "The local files are updated."
    msg "Running make distclean"
    make distclean || :
  else
    git clone "${_gitroot}" "${_gitname}"
    cd "${_gitname}"
    [[ "${_commit}" ]] && git checkout "${_commit}"
  fi

  cd ${srcdir}/${_gitname}
  msg "Bootstrapping netatalk..."
  ./bootstrap

  msg "Configuring netatalk..."
  ./configure --prefix=/usr --with-ssl-dir=/usr --localstatedir=/var --enable-fhs --enable-zeroconf=/usr --disable-srvloc --with-cnid-cdb-backend
  make || return 1
  make DESTDIR=$startdir/pkg install

  mv $startdir/pkg/usr/include/netatalk{,2}

  install -d $startdir/pkg/etc/rc.d
  install -m755 ../{afpd,atalkd,papd,cnid} $startdir/pkg/etc/rc.d

  rm -f $startdir/pkg/usr/share/man/man1/timeout.1{,.gz}
}

