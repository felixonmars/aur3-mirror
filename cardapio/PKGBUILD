# Contributor : max.bra <max dot bra at alice dot it>
# Maintainer : max.bra <max dot bra at alice dot it>

pkgname=cardapio
pkgver=0.9.193
pkgrel=1
pkgdesc="An alternative Gnome menu, launcher, and much more! For AWN, Docky, Gnome-Panel and Gnome-Shell"
arch=('any')
url="https://launchpad.net/cardapio"
license=('GPL3')
depends=('pyxdg' 'xdg-user-dirs' 'dbus-python' 'gnome-python-desktop' 'python-keybinder' 'python-simplejson' 'gnome-control-center' 'tk' 'gnome-menus2')
makedepends=('intltool')
optdepends=('gnome-panel: for applet-mode use'
            'tracker: search capability'
            'alacarte: menu editing'
            'docky: docky integration'
            'avant-window-navigator: awn integration'
            'awn-extras-applets: awn integration' 
	    'gnome-shell: gnome-shell integration')
	    
source=(https://launchpad.net/~cardapio-team/+archive/unstable/+files/cardapio_0.9.193-ubuntu1-oneiric1.tar.gz 
        https://launchpad.net/~cardapio-team/+archive/unstable/+files/cardapio-gnomeshell_0.9.193-ubuntu1-oneiric1.tar.gz 
	https://launchpad.net/~cardapio-team/+archive/unstable/+files/cardapio-awn_0.9.192-ubuntu1-oneiric1.tar.gz 
	https://launchpad.net/~cardapio-team/+archive/unstable/+files/cardapio-docky_0.9.192-ubuntu1-oneiric1.tar.gz 
	'Makefile.patch' 
	'cardapio.patch' 
	'cardapio_helper.patch' 
	'cardapio_helper2.patch'
	'cardapio-gnome-panel-applet.patch')

md5sums=('ab9727e953d23dbccd3a503a08d0b031' 
        '8c4263acbcb65addcb5c371380a9d645' 
	'37ac04ce3f8e4f2c739141af88cf5204' 
	'32ebc1a494e4676a3d6246a11c69dc74' 
	'a3a72d6b4d82590860b8adc28dcc3aa6' 
	'be455bf3f8d7d407184402a96a5c0457' 
	'21be13038dd22eb797219a12e2a53a5b' 
	'74a1488724958efe792ffaeb1b6937c5' 
	'0f035c3c50d02a8aab65da6fa477dac1')

build() {
  cd "${srcdir}/cardapio"
  patch -p1 < ../Makefile.patch
  patch -p1 < ../cardapio.patch
  patch -p1 < ../cardapio_helper.patch
  patch -p1 < ../cardapio-gnome-panel-applet.patch
  cd "${srcdir}/cardapio-docky"
  patch -p1 < ../cardapio_helper2.patch
}

package() {
  cd "${srcdir}/${pkgname}/"
  make DESTDIR="'${pkgdir}'" install || return 1
  cd "${srcdir}/${pkgname}-gnomeshell/"
  make DESTDIR="'${pkgdir}'" install || return 1
  cd "${srcdir}/${pkgname}-awn/"
  make DESTDIR="'${pkgdir}'" install || return 1
  cd "${srcdir}/${pkgname}-docky/"
  make DESTDIR="'${pkgdir}'" install || return 1
}

