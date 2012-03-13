# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=mediasetviewer
pkgver=1.1
pkgrel=2
pkgdesc='A simple zenity script to watch Rai.tv, Mediaset, La7 and any other Silverlight based videos without using Moonlight.'
arch=('any')
url='http://lippolweblog.wordpress.com/2012/03/09/vedere-episodi-interi-su-video-mediaset-e-rai-tv-senza-moonlight-benvenuto-mediasetviewer/'
license=('GPL')
depends=('curl' 'zenity' 'vlc')
source=("http://dl.dropbox.com/u/2766931/LippolWeblog/MediasetViewer.tar.gz")
md5sums=('0742378d6e96ead486a60117ba3fb074')

package() {
  cd "${srcdir}"
  install -Dm755 mediasetviewer \
    "${pkgdir}"/usr/bin/mediasetviewer
  install -Dm644 mediasetviewer.png \
    "${pkgdir}"/usr/share/pixmaps/mediasetviewer.png
  install -Dm644 Mediaset\ Viewer.desktop \
    "${pkgdir}"/usr/share/applications/Mediaset\ Viewer.desktop
}
