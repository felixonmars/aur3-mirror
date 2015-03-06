pkgname=kde-servicemenus-dropbox-simple
pkgver=1.0
pkgrel=4
pkgdesc="A servicemenu for KDE4 which allows easy sharing Dropbox links. It uses Dropbox CLI to generate public urls."
depends=('dropbox' 'dropbox-cli' 'xclip' 'perl')
source=('dropbox_actions.sh' 'get_dropbox_folder.sh' 'dropbox_all.desktop')
license=('GPL')
arch=('any')
url='https://github.com/glebtv/kde-servicemenus-dropbox-simple'
md5sums=('1e5d358ed22b1b6c91bff2ae1275d86e' '8d158b0d1b565168c317b5e385b3a6c0' 'bc082acfc8b34bd6fcfa678f9dcb4eb5')

package() {
    cd "$srcdir"
    install -Dm755 dropbox_actions.sh $pkgdir/usr/lib/dropbox/dropbox_actions.sh
    install -Dm755 get_dropbox_folder.sh $pkgdir/usr/lib/dropbox/get_dropbox_folder.sh
    install -Dm755 dropbox_all.desktop $pkgdir/usr/share/kde4/services/ServiceMenus/dropbox_all.desktop
}