# Maintainer: Mikhail Khvoinitsky <mikhail.khvoinitsky[at]yandex[dot]ru>
pkgname=geary-dark-theme-larger-font
pkgver=1
pkgrel=1
pkgdesc="Dark theme and larger font for Geary email client. You should reinstall this package after every Geary update and use --force pacman option."
url="http://www.yorba.org/projects/geary/"
arch=('any')
license=('GPLv3')
depends=('geary')

build() {
  true
}

package() {
  mkdir -p $pkgdir/usr/share/geary/theming/
  cp /usr/share/geary/theming/message-viewer.css $pkgdir/usr/share/geary/theming/

  cat >> $pkgdir/usr/share/geary/theming/message-viewer.css << EOF

* {
        color: white !important;
        background-color: black !important;
        font-size: 14pt !important;
        font-family: DejaVu Sans !important;
        word-wrap: break-word !important;
}
 
.email {
        box-shadow: 0px 0px 5px 2px white !important;
}
 
.email .body * {
        line-height: 150% !important;
        max-width: 100% !important;
        width: initial !important;  
        height: initial !important;
        margin-left: 0px !important;
}
EOF

}
