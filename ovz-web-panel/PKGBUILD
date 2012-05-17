# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=ovz-web-panel
pkgver=2.1
pkgrel=1
pkgdesc='GUI web-based frontend for controlling of the hardware and virtual servers with the OpenVZ virtualization technology'
arch=('any')
url='http://code.google.com/p/ovz-web-panel/'
license=('GPL2')
groups=('openvz')
depends=(
ruby1.8
rubygems1.8
ruby1.8-sqlite3
ruby1.8-rake
linux-openvz
vzctl
php
)
optdepends=(
"vzquota: quota control"
"vzpkg: VPS package tools"
"vzdump: for snapshot"
"r8168-openvz: support for Realtek 8168 network cards"
)
install='owp.install'
source=(
"http://ovz-web-panel.googlecode.com/files/$pkgname-$pkgver.tgz"
owp
)
backup=(
etc/webapps/ovz-web-panel/config.yml
etc/webapps/ovz-web-panel/hw-daemon.ini
etc/conf.d/owp.conf
)
options=('!strip' '!emptydirs')

build(){
  cd "$srcdir"
  _install_dir="/usr/share/webapps"
  _etc_dir="/etc/webapps"

  install -dm755 $pkgdir/${_etc_dir}/$pkgname \
    $pkgdir/${_install_dir}/$pkgname

  tar -c $pkgname --exclude $pkgname/.gitignore \
    | tar -x -C $pkgdir/${_install_dir}

#  Fix shebang
  grep  '/usr/bin/env ruby' $pkgdir/${_install_dir}/$pkgname -rl \
    | xargs perl -pi -e 's%#!/usr/bin/env ruby$%#!/usr/bin/env ruby-1.8%'

  grep  '/usr/bin/ruby' $pkgdir/${_install_dir}/$pkgname -rl \
    | xargs perl -pi -e 's%#!/usr/bin/ruby$%#!/usr/bin/env ruby-1.8%'

#  daemon script and configuration
  install -Dm755 owp $pkgdir/etc/rc.d/owp
  install -Dm644 $pkgname/config/owp.conf.sample $pkgdir/etc/conf.d/owp.conf

  install -Dm644 $pkgname/config/config.yml.sample $pkgdir/${_etc_dir}/$pkgname/config.yml
  install -Dm644 $pkgname/utils/hw-daemon/hw-daemon.ini.sample \
    $pkgdir/${_etc_dir}/$pkgname/hw-daemon.ini

  install -dm755 $pkgdir/var/lock $pkgdir/var/log/owp

#  configuration symlinks
  cd $pkgdir/${_install_dir}/$pkgname/config
  ln -s ${_etc_dir}/$pkgname/config.yml
  cd ../utils/hw-daemon
  ln -s ${_etc_dir}/$pkgname/hw-daemon.ini

}


md5sums=('231ded608b37286b21450fd12153127c'
         '8e0280a3e2bf6264b280b68cc4d5eb14')
