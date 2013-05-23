# Contributor: Philip Müller <philm_at_manjaro_dot_org>
# Maintainer: Pablo Lezaeta <prflr88 (arroba) gmail (dot) com>

pkgname=xfce-theme-greenbird
pkgver=9.f023ace
pkgrel=1
epoch=1
pkgdesc="Desktop theme for Xfce based on Graybird, used on Manjaro"
arch=('any')
url="git://git.manjaro.org/manjaro-linux-graphics/greenbird.git"
license=('GPL2' 'CCPL')
depends=('gtk-engine-murrine')
makedepends=('git')
optdepends=('faenza-green-icon-theme: matching icon theme'
            'lightdm-gtk-greeter: lightdm theme'
            'lightdm-unity-greeter: lightdm unity theme')
source=("$pkgname::git+git://git.manjaro.org/manjaro-linux-graphics/greenbird.git")
md5sums=("SKIP")
pkgver(){
	cd $pkgname
	echo "$(git rev-list --count HEAD | sed 's/-/0.git/g' ).$(git describe --always | sed 's/-/~/g' )"
}

package() {
  cd "$srcdir/$pkgname"

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/themes/Greenbird{,-compact/xfwm4}

  # install compact theme
  install -m 644 xfwm4_compact/* "$pkgdir"/usr/share/themes/Greenbird-compact/xfwm4/

  # clean up
  rm -rf {.git,.gitignore,LICENSE.{CC,GPL},README,xfwm4_compact}

  # install theme
  cp -r . $pkgdir/usr/share/themes/Greenbird/
}

# vim:set ts=2 sw=2 et:
