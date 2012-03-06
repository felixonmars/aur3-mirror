# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=openqa-git
pkgver=20120306
pkgrel=1
pkgdesc="Webfrontend and scheduler for os-autoinst"
arch=('any')
url="http://os-autoinst.org/"
license=('GPL')
groups=()
provides=('openqa')
depends=('sudo' 'perl-time-hires' 'perl-perlmagick' 'perl-json' 'perl-text-microtemplate-extended' \
	'perl-tidy' 'make' 'wget' 'curl' 'rsync' 'vorbis-tools' 'apache' 'os-autoinst-git' 'withlock-svn')
optdepends=('perl-algorithm-line-bresenham: for mouse interaction')
makedepends=('git' 'autoconf' 'automake' 'perl')
install='openqa.install'
source=()
md5sums=()

_gitroot="git://github.com/asdil12/openQA.git"
_gitname="openqa"

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

  cd "$srcdir/$_gitname"

  ./autogen.sh || return 1
  ./configure --prefix=/usr --exec-prefix=/usr --bindir=/usr/bin --sbindir=/usr/sbin --sysconfdir=/etc --datadir=/usr/share \
              --libexecdir=/usr/lib --localstatedir=/var --docdir=/usr/share/doc/openqa --libdir=/usr/lib/ --with-apacheconfd=/etc/httpd/conf/extra/ || return 1
  mkdir -p "$pkgdir/etc/sudoers.d/"
  echo "http  ALL=(openqa) NOPASSWD:/usr/bin/autoinstctl" >> "$pkgdir/etc/sudoers.d/openqa"
  chmod 0440 "$pkgdir/etc/sudoers.d/openqa"
  chmod 0750 "$pkgdir/etc/sudoers.d"
}
package() {
  cd "$srcdir/$_gitname"
  make DESTDIR=$pkgdir install
} 
