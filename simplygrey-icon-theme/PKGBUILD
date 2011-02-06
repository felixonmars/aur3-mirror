# Contributor: grimi <grimi at poczta dot fm>

pkgname=simplygrey-icon-theme
pkgver=0.51
pkgrel=5
pkgdesc="Color-free icon theme (just three shades of grey)"
arch=('any')
url="http://www.gnome-look.org/content/show.php/SimplyGrey?content=93674"
license=('GPL')
makedepends=('sed')
source=("http://fc01.deviantart.com/fs43/f/2009/154/9/e/SimplyGrey_0_51_by_Scnd101.zip" \
        "archpkg.svg")
md5sums=('dd3b44cf97ed42ba301840e2737b6dd2'
         'ad95e65e176410c5fef2ea587f872fef')

build() {
  cd "$srcdir"

  # extract subarchive
  tar xjf SimplyGrey051fix/SimplyGrey.v0.5_by_Scnd101.tar.bz2

  # fix pdf mime suffix
  mv SimplyGrey/scalable/mimetypes/application-pdfsvg \
     SimplyGrey/scalable/mimetypes/application-pdf.svg

  # archpkg mime icon
  install -m644 "$srcdir"/archpkg.svg \
     SimplyGrey/scalable/mimetypes/application-x-archpkg.svg

  # replace def start icon with arch icon
  cp -p SimplyGrey/scalable/places/start-here-arch.svg \
     SimplyGrey/scalable/places/start-here.svg

  # fix index.theme ( lack of some icons -> no inherit )
  sed '4{s|.*|Inherits=gnome,Tango\n|;}' -i SimplyGrey/index.theme
}

package() {
  # moveup to dest
  install -d "$pkgdir"/usr/share/icons
  mv "$srcdir"/SimplyGrey "$pkgdir"/usr/share/icons
}


