# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Berkus <berkus@madfire.net>
# Contributor: Robert Emil Berge <filoktetes@linuxophic.org>
# Contributor: Sebastien Piccand <sebcactus gmail com>
# Contributor: Gimmeapill <gimmeapill at gmail dot com>

pkgname=neil-hg
pkgver=1996.3fb33c1585f6
pkgrel=1
pkgdesc="A modular Buzz-like tracker, fork of aldrin"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sites.google.com/site/neilsequencer/"
depends=('pygtk' 'python2-numpy' 'python2-opengl' 'wxpython'
         'libmad' 'gtkglarea' 'gtkglext' 'fftw' 'mpg123' 'jack'
         'ladspa' 'dssi' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('mercurial' 'scons' 'boost' 'docbook-xsl' 'xmlto')
provides=('neil' 'libneil' 'libneil-hg')
conflicts=('neil' 'libneil' 'libneil-hg')
install="$pkgname.install"
source=("$pkgname::hg+http://bitbucket.org/bucket_brigade/neil")
md5sums=('SKIP')

pkgver(){
  cd "$srcdir/$pkgname"
  echo $(hg identify -n).$(hg identify -i)
}

prepare() {
  cd "$srcdir/$pkgname"

  # python2 fix
  sed -i "s|\(env python\).*|\12|" `grep -rl "env python"`
  sed -i "s|'python |'python2 |g" libneil/SConscript
}

build() {
  cd "$srcdir/$pkgname"
  scons configure PREFIX=/usr
  scons
}

package() {
  cd "$srcdir/$pkgname"
  scons install DESTDIR="$pkgdir/"

  # config file path fix
  sed -i "s|$pkgdir||" "$pkgdir/etc/neil/path.cfg"
}

