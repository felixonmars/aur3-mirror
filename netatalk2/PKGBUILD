# Maintainer: SJ_UnderWater
# Based on netatalk package :
# Maintainer: Dominik Dingel <mail at wodar dot de>
# Contributor: William Udovich <nerdzrule7 at earthlink dot net>
# Contributor: Farhan Yousaf <farhany at xaviya dot com>

pkgname=netatalk2
pkgver=2.2.2
pkgrel=1
pkgdesc='A kernel level implementation of the AppleTalk Protocol Suite'
provides=('netatalk')
conflicts=('netatalk-git' 'netatalk')
arch=('i686' 'x86_64')
url='http://netatalk.sourceforge.net'
options=('!libtool')
license=('GPL')
backup=('etc/netatalk/afpd.conf'
        'etc/netatalk/netatalk.conf'
        'etc/netatalk/AppleVolumes.default'
        'etc/netatalk/AppleVolumes.system')
depends=('avahi' 'openssl' 'pam' 'coreutils>=7.1-2' 'db' 'libgcrypt')
makedepends=('file' 'git')
source=(afpd cnid_metad netatalk)
md5sums=('35bb2465a18587bd61214d72089cd54c'
         'd4fb163b2555035c4ccd4c5266f4dc77'
		 '7a7347f75386338a87b27bf2e747ad4f')
_gitroot='git://netatalk.git.sourceforge.net/gitroot/netatalk/netatalk'
_gitname='netatalk-2-2-2'

build() {
  cd "${srcdir}"
  msg 'Connecting to GIT server....'

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git checkout master && git pull origin
    git checkout "${_gitname}"
    msg 'The local files are updated.'
    msg 'Running make distclean'
    make distclean || :
  else
    git clone "${_gitroot}" "${_gitname}"
    cd "${_gitname}"
    git checkout "${_gitname}"
  fi

  cd ${srcdir}/${_gitname}
  msg 'Bootstrapping netatalk...'
  ./bootstrap

  msg 'Configuring netatalk...'
  ./configure --prefix=/usr --localstatedir=/var --with-cracklib --with-cnid-cdb-backend --enable-fhs
  read -p 'Make?'
  make || return 1
  make DESTDIR=$startdir/pkg install

  rm -r $startdir/pkg/usr/include $startdir/pkg/usr/share/aclocal
  rm $startdir/pkg/usr/share/man/man8/timelord.8
  rmdir $startdir/pkg/usr/share/man/man3 $startdir/pkg/usr/share/man/man4
  
  install -d $startdir/pkg/etc/rc.d
  install -m755 ../{afpd,cnid_metad,netatalk} $startdir/pkg/etc/rc.d
}