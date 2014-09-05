# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>

pkgname=cracks_and_crevices
pkgver=0.5
pkgrel=2
pkgdesc="Graphical ascii roguelike that takes ideas from UnderDark and SRL."
arch=('i686' 'x86_64')
url="https://redmine.bloodycactus.com/projects/sdlrl"
license=('GPL')
depends=('sdl')
source=('https://redmine.bloodycactus.com/attachments/download/32/cracks_and_crevices-0.5.tar.bz2')
md5sums=('dd6e27a5bfea81549c94d52c12b9682e')


prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # As this is quite old there are some warnings while compiling. -Werror is nerving
  sed -i Makefile -e "s/-Werror//" -e "s/-D_FORTIFY_SOURCE=0//"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  sed -i "s|/var/games/|/usr/share/|" sys_unix.c
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  _dest_dir=$pkgdir/usr/share/cracks_and_crevices
  mkdir -p $pkgdir/usr/bin
  mkdir -p "$_dest_dir"
  chown -R :games $_dest_dir
  chmod -R g+rw $_dest_dir

  install -T -D -m 755 "cnc" "$pkgdir/usr/bin/cnc"
}

# vim:set ts=2 sw=2 et:
