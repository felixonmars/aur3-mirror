# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=mediasetviewer-kde
pkgver=1
pkgrel=1
pkgdesc='A simple script for KDE to watch Rai.tv, Mediaset, La7 and any other
Silverlight based videos without Moonlight or Flash'
arch=('any')
url='http://lippolweblog.wordpress.com/2012/03/09/vedere-episodi-interi-su-video-mediaset-e-rai-tv-senza-moonlight-benvenuto-mediasetviewer/'
license=('GPL')
depends=('curl' 'vlc' 'kdebase-runtime')
install=${pkgname}.install
source=('mediasetviewer-kde.sh'
        'mediasetviewer-kde.desktop'
        'mediasetviewer-kde.png')
md5sums=('6641f482bff90a54edc626780c2397a9'
         '49320ee979b72a7f7301033999121bfd'
         '4a23b7df0c4dc9e34af4d6edc64ff3e6')

package() {
  cd "${srcdir}"

  install -Dm755 mediasetviewer-kde.sh \
    "${pkgdir}"/usr/bin/mediasetviewer-kde
  install -Dm644 mediasetviewer-kde.png \
    "${pkgdir}"/usr/share/pixmaps/mediasetviewer-kde.png
  install -Dm644 mediasetviewer-kde.desktop \
    "${pkgdir}"/usr/share/applications/mediasetviewer-kde.desktop
}
