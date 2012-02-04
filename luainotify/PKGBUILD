# Maintainer: Greg Fitzgerald <greg@gregf.org>
pkgname=luainotify
pkgver=20090818
pkgrel=1
pkgdesc="A Lua interface to the Linux inotify subsystem"
arch=('i686' 'x86_64')
url="http://www3.telus.net/taj_khattra/luainotify.html"
license=('custom')
depends=(lua)
source=("http://www3.telus.net/taj_khattra/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c899074c6cdba898e1b34cdf99aec889')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make || return 1
  install -D -s inotify.so "${pkgdir}"/usr/lib/lua/5.1/inotify.so
}

# vim:set ts=4 sw=4 et:
