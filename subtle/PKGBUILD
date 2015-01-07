# $Id: PKGBUILD 116181 2014-07-23 16:39:01Z anatolik $
# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: unexist <unexist@dorfelite.net>
# Contributor: Abakus <java5@arcor.de>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Xilon <xilonmu@gmail.com>

pkgname=subtle
# check the mercurial hash at http://hg.subforge.org/subtle
_hg_revision=3244
_hg_hash=31e0a9716e58
pkgver=0.11.r$_hg_revision
pkgrel=1
pkgdesc='Grid-based manual tiling window manager'
arch=(x86_64 i686)
url='http://subtle.subforge.org/'
license=(GPL)
depends=(ruby libxrandr libxft libxpm libxinerama libxtst)
backup=(etc/xdg/subtle/subtle.rb)
install=subtle.install
source=(http://hg.subforge.org/subtle/archive/$_hg_hash.tar.bz2
        do_not_relink_binaries_on_install.diff)
sha256sums=('a6350b4efd7a194352a0658e05195b89513cc4271320f8826d43871d3876de24'
            '448dd3bcc8fd3807ab0f66c1d82edccbeb830502dfe758770e7f7a76ffce35a0')

prepare() {
  cd subtle-$_hg_hash

  # Use vendor_ruby instead of site_ruby
  sed -e \
    's/RbConfig::CONFIG\["sitelibdir"\]/RbConfig::CONFIG\["vendorlibdir"\]/' \
    -i Rakefile

  patch -p1 < "$srcdir"/do_not_relink_binaries_on_install.diff
}

build() {
  cd subtle-$_hg_hash

  rake build revision=$_hg_revision
}

package() {
  cd subtle-$_hg_hash

  # regenerate config with proper $pkgdir, revision and cppflags are not needed at this step
  rake config destdir="$pkgdir"
  rake install

  install -D -m644 data/subtle.desktop "$pkgdir"/usr/share/xsessions/subtle.desktop
}
