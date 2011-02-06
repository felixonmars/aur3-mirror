# Maintainer: Hans-Kristian Arntzen <maister@archlinux.us>

pkgname=alsa-plugins-rsound-git
pkgver=20100317
pkgrel=1
pkgdesc="Extra alsa plugins, with rsound support"
arch=('i686' 'x86_64')
url="http://www.alsa-project.org"
license=('GPL')
depends=('rsound')
makedepends=('git')
conflicts=('alsa-plugins')
provides=('alsa-plugins')
options=('!libtool')
install=$pkgname.install

_gitroot="git://github.com/Themaister/alsa-plugins-rsound.git"
_gitrepo="alsa-plugins"

build() {
  cd $srcdir
  
  if [ -d $_gitrepo ]; then
	  cd $_gitrepo && git pull && cd $srcdir
  else
	  git clone $_gitroot $_gitrepo
  fi

  cd $_gitrepo
  ./gitcompile || return 1
  make DESTDIR=$startdir/pkg install || return 1
  mkdir -p $startdir/pkg/etc/profile.d && \
  cat >$startdir/pkg/etc/profile.d/alsa.sh <<EOF && \
#!/bin/bash
export ALSA_PLUGINS_DIR=/usr/lib/alsa-lib
EOF
  chmod 0755 $startdir/pkg/etc/profile.d/alsa.sh
}

