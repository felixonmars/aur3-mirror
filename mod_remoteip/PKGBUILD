# Maintainer: Allen Zhong <moeallenz@gmail.com>
pkgname=mod_remoteip
pkgver=2.2
pkgrel=2
pkgdesc="A backport of mod_remoteip in apache httpd 2.4.x"
arch=(i686 x86_64)
url="http://httpd.apache.org/docs/current/mod/mod_remoteip.html"
license=('apache')
depends=('apache>=2.2' 'apache<2.3')
makedepends=('apache>=2.2' 'apache<2.3' 'git')
install=mod_remoteip.install

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [ -d $pkgname ]; then
    git fetch https://github.com/buzztaiki/mod_remoteip-httpd22.git
    msg "The local files are updated."
  else
    git clone --depth=1 https://github.com/buzztaiki/mod_remoteip-httpd22.git "$pkgname"
  fi
  msg "GIT checkout done or server timeout"

  cd "$pkgname"
  sed -i'' -e 's/which apxs2/which apxs/g' Makefile
  apxs -c -n mod_remoteip.so mod_remoteip.c || return 1
  mkdir -p $pkgdir/usr/lib/httpd/modules
  apxs -S LIBEXECDIR=$pkgdir/usr/lib/httpd/modules -i -n mod_remoteip.so mod_remoteip.la
}

