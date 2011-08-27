# Contributor: L29Ah <zl29ah@gmail.com>
# Contributor: LexsZero <lexszero@gmail.com>
# Maintainer:  Padavan <padavankun@gmail.com>

#hatexmpp is a xmpp-client featuring ii-like interface
#to run: hatexmpp <mountpoint> -d
#to configure: echo 'username' > <mountpoint>/config/username
#The same operation you need to do with other settings like
#server, password, resource, muc_default_nick, jiv_name, jiv_os, jiv_version

pkgname=hatexmpp-git
pkgver=20101027
pkgrel=1
pkgdesc="hatexmpp is a xmpp-client featuring ii-like interface"
arch=('i686' 'x86_64')
url="http://github.com/l29ah/hatexmpp"
license=('WTFPL-2')
depends=('glib' 'fuse' 'loudmouth')
makedepends=('git')
md5sums=('')

_gitroot="git://github.com/l29ah/hatexmpp.git"
_gitname="hatexmpp"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then 
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else 
    git clone $_gitroot $_gitname
  fi 

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  #rm -rf "$srcdir/$_gitname-build"
  #git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname"

  #
  # BUILD HERE
  #

  LDFLAGS=""; export LDFLAGS
  make || return 1
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/{bin,share} || return 1
  cp -R hatexmpp ${pkgdir}/usr/share/hatexmpp || return 1
  ln -s /usr/share/hatexmpp/hatexmpp ${pkgdir}/usr/bin/hatexmpp || return 1
}
