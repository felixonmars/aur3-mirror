# Maintainer: Mark Coolen
# Contributor: Dan Serban

pkgname=storybook
pkgver=4.0.9
pkgrel=1
pkgdesc="Open Source Novel Writing Software for Novelists, Authors and Creative Writers"
arch=(any)
url="http://www.novelist.ch/joomla/"
license=(GPL)
depends=(java-runtime)
source=("http://downloads.sourceforge.net/project/storybook2/$pkgname/4.0/$pkgname-$pkgver-linux.bin")
md5sums=('43df9e90323fd2d3552fd3e7981fcf03')
options=('!strip')

build()
{
 
  chmod +x "$pkgname"-"$pkgver"-linux.bin
  mkdir -p "${pkgdir}"/usr/share/storybook
  ./"$pkgname"-"$pkgver"-linux.bin --noexec --keep --target "${pkgdir}"/usr/share/storybook
  mkdir -p "${pkgdir}"/usr/bin
  USRBINFILE="${pkgdir}"/usr/bin/storybook
  echo '#!/bin/bash' > "${USRBINFILE}"
  echo 'cd /usr/share/storybook' >> "${USRBINFILE}"
  echo 'java -Xmx256m -splash:splash.png -jar lib/storybook.jar' >> "${USRBINFILE}"
  chmod +x "${USRBINFILE}"
  mkdir -p "${pkgdir}"/usr/share/applications
  DESKTOPFILE="${pkgdir}"/usr/share/applications/storybook.desktop
  echo "[Desktop Entry]" > "${DESKTOPFILE}"
  echo "Name=Storybook" >> "${DESKTOPFILE}"
  echo "Comment=Open Source Novel Writing Software for Novelists, Authors and Creative Writers" >> "${DESKTOPFILE}"
  echo "Exec=storybook" >> "${DESKTOPFILE}"
  echo "Terminal=false" >> "${DESKTOPFILE}"
  echo "Type=Application" >> "${DESKTOPFILE}"
  echo "Icon=/usr/share/storybook/storybook-icon.png" >> "${DESKTOPFILE}"
  echo "Categories=Office;" >> "${DESKTOPFILE}"
}

