# Maintainer: Gustavo Castro <gustawho[at]gmail[dot]com>

pkgname=plasma-theme-evolvere-git
pkgver=0.r201.4f9f1e6
pkgrel=1
pkgdesc=('Aurorae, Plasma and color themes, part of the Evolvere suite.')
license=('CC BY-SA 4.0')
arch=('any')
url="https://github.com/franksouza183/EvolvereSuit"
depends=('kdebase-workspace')
makedepends=('git')
groups=('evolvere')
source=('evolvere::git+https://github.com/franksouza183/EvolvereSuit.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/evolvere"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # Aurorae themes
  cd "$srcdir/evolvere/aurorae-themes"
  install -d -m755 "$pkgdir"/usr/share/apps/aurorae/themes
  rm -rf {.git,.gitignore,LICENSE,README.md,changelog}
  cp -r . "${pkgdir}/usr/share/apps/aurorae/themes/"

  # Color schemes
  cd "$srcdir/evolvere/kde-color-schemes"
  install -d -m755 "$pkgdir"/usr/share/apps/color-schemes
  cp -r *.colors "$pkgdir"/usr/share/apps/color-schemes/
  
  # Plasma theme
  cd "$srcdir/evolvere/kde-plasma-themes/kde4"
  install -d -m755 "$pkgdir"/usr/share/apps/desktoptheme
  rm -rf {.git,.gitignore,LICENSE,README.md,changelog}
  cp -r . "$pkgdir"/usr/share/apps/desktoptheme/

  # Wallpaper 
  cd "$srcdir/evolvere/wallpapers"
  rsvg-convert otium.svg --width=3648 --height=2280 --format=png -o 3648x2280.png
  rsvg-convert otium.svg --width=1920 --height=1200 --format=png -o 1920x1200.png
  rsvg-convert otium.svg --width=1920 --height=1080 --format=png -o 1920x1080.png
  rsvg-convert otium.svg --width=1600 --height=1200 --format=png -o 1600x1200.png
  rsvg-convert otium.svg --width=1280 --height=1024 --format=png -o 1280x1024.png
  rsvg-convert otium.svg --width=400 --height=250 --format=png -o screenshot.png
  mkdir -p "$pkgdir"/usr/share/wallpapers/Otium/contents/images
  install -m755 *.png "$pkgdir"/usr/share/wallpapers/Otium/contents/images/
  install -m755 screenshot.png "$pkgdir"/usr/share/wallpapers/Otium/contents/
  install -m755 "$srcdir/metadata.desktop" "$pkgdir"/usr/share/wallpapers/Otium/
  rm "$pkgdir"/usr/share/wallpapers/Otium/contents/images/screenshot.png

  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
}
