# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Steven Merrill <steven.merrill@gmail.com>

pkgname=varnish-git
pkgver=20110606
pkgrel=1
pkgdesc="High-performance HTTP accelerator"
arch=('i686' 'x86_64')
url="http://www.varnish-cache.org/"
license=('BSD')
makedepends=('git')
depends=('ncurses' 'pcre' 'groff' 'libxslt' 'python-sphinx')
backup=('etc/varnish.conf')
provides=('varnish')
conflicts=('varnish')
install=varnish.install
# Varnish from git does not like to be compiled -j9.
options=('!makeflags !libtool')

_gitroot="git://git.varnish-cache.org/varnish-cache"
_gitname="varnish"

source=($_gitname.conf
        $_gitname.init
        $_gitname.runit
        $_gitname.log.runit)
sha256sums=('46701975e6d975966316b7d253ca6310544523a1ba57400441f538cb82e17962'
            'b28a1acc6ea272c50eca928166ed2f85e80182eec370c35e98c955dc1bd4deca'
            '0bcbe89585fc5c83fa4a47fbe7d62443e2c3a97aa7bf9df10a1bc59e78060cbf'
            '18318e89528f70292c703340c9e209d96edbe8c36cb9c59fe1fa08c48d9fc7dd')

build() {
  cd "$srcdir"
  msg "Connecting to git server...."

  if [[ -d $_gitname ]] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "git checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR=${pkgdir} install

  #license
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/$_gitname/LICENSE

  cd "$srcdir"

  install -d ${pkgdir}/var/$_gitname/$(hostname)
  install -D -m755 ${srcdir}/$_gitname.init ${pkgdir}/etc/rc.d/$_gitname
  install -D -m755 ${srcdir}/$_gitname.runit ${pkgdir}/etc/sv/$_gitname/run
  install -D -m755 ${srcdir}/$_gitname.log.runit ${pkgdir}/etc/sv/$_gitname/log/run
  install -D -m755 ${srcdir}/$_gitname.conf ${pkgdir}/etc/$_gitname.conf

}
