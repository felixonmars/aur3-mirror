# Maintainer: Diego <cdprincipe@at@gmail@dot@com>

pkgname=faba-icon-theme
pkgver=1.0
pkgrel=2
pkgdesc="Faba is meant to be a base icon set for others."
arch=('any')
url="http://www.snwh.org/faba-icon-theme/"
license=('GPL3') 

optdepends=('moka-icon-theme: comprehensive companion icon theme')

source=('https://launchpad.net/~moka/+archive/faba-icon-theme/+files/faba-icon-theme_1.0-0~28~ubuntu14.04.1.tar.gz'
    'https://launchpad.net/~moka/+archive/faba-icon-theme/+files/faba-icon-theme-symbolic_1.0-0~18~ubuntu14.04.1.tar.gz'
    'https://launchpad.net/~moka/+archive/faba-icon-theme/+files/faba-mono-icons_1.0-0~25~ubuntu14.04.1.tar.gz')
md5sums=('72abad1dd7b76f138be1fe0b64e65968'
         '37dac2af38dbac6c5e3b5ccf0ef9545d'
         'f4524d35d95afbb1c7b4fbbee2ddded6')

package() {
  # Extract
  cd $srcdir/recipe-{debupstream}-0~{revno}

  
  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Faba
  install -d -m 755 "$pkgdir"/usr/share/icons/Faba-Dark
  install -d -m 755 "$pkgdir"/usr/share/icons/Faba-Light

  # install theme
  cd ./Faba
  cp -r . "$pkgdir"/usr/share/icons/Faba/
  cd ../Faba-Dark
  cp -r . "$pkgdir"/usr/share/icons/Faba-Dark/
  cd ../Faba-Light
  cp -r . "$pkgdir"/usr/share/icons/Faba-Light/

  
  find "${pkgdir}"/usr/share/icons -type d -exec chmod 755 '{}' \;
  find "${pkgdir}"/usr/share/icons -type f -exec chmod 644 '{}' \;
}
