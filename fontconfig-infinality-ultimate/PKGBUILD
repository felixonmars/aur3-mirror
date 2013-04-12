# Maintainer: bohoomil <bohoomil AT gmail DOT com>

pkgname=fontconfig-infinality-ultimate
_gitname=fontconf
pkgver=2013.04.12
pkgrel=1
epoch=1
pkgdesc="Fontconfig files for use with freetype2-infinality. Customized by bohoomil."
arch=(any)
license=('CC-BY-SA')
url="https://github.com/bohoomil/fontconf"
depends=('fontconfig>=2.10.1' 'freetype2-infinality')
makedepends=('git')
provides=('fontconfig-infinality')
conflicts=('fontconfig-infinality' 'fontconfig-infinality-git')
install='fontconfig.install'
backup=('etc/fonts/infinality/infinality.conf'
        'etc/fonts/conf.d/52-infinality.conf')
source=('git://github.com/bohoomil/fontconf.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

package() {
  cd $_gitname
 
  mkdir -p ${pkgdir}/etc/fonts/{conf.d,infinality}
  mkdir -p ${pkgdir}/etc/profile.d

  cp -r ${srcdir}/fontconf/etc-fonts/infinality ${pkgdir}/etc/fonts
  cp ${srcdir}/fontconf/etc-profile.d/infinality-settings.sh ${pkgdir}/etc/profile.d/infinality-settings.sh.pacnew
  ln -sd /etc/fonts/infinality/conf.d/52-infinality.conf ${pkgdir}/etc/fonts/conf.d/52-infinality.conf
  install -m644 -D ${srcdir}/fontconf/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
