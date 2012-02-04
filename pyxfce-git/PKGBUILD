# Contributor: Silvio Knizek <killermoehre@gmx.net>

pkgname=pyxfce-git
pkgver=20110223
pkgrel=1
pkgdesc="python bindings for xfce"
arch=('i686' 'x86_64')
license=('GPL')
url="http://pyxfce.xfce.org/"
groups=('xfce4-git')

depends=('python2' 'libxfce4util' 'xfconf' 'libxfce4ui' 'libxfce4menu-git' 'xfce4-panel' 'gtk2' 'pygtk')
makedepends=('pkgconfig' 'intltool' 'git')

provides=('pyxfce')
conflicts=('python>=3')
options=('!libtool')

source=(gen.patch menu.patch panel.patch testtrayarea.patch	ui.patch util.patch xfconf.patch xfconf-test.patch)
md5sums=(   a2569949f7f2f57ec1b76df007598073
            72b84a77489b9334adbb8a3d98afb6ae
            aa64821261ed7dcf594e52bacfd71b60
            4f35ac96d49b5bfb6323eb412b15473b
            014b9932c300e5d549cd8317b92c3989
            12dedcc1942168747dcea99393e3f1ba
            218a96e817ea9677494e58a251895b48
            a242a116a07aa79dc25f4625524fd5fe)

_gitname="pyxfce"
_gitroot="git://git.xfce.org/bindings/pyxfce"

build() {
	cd $startdir/src/

	msg "Getting sources..."
	if [[ -d $_gitname ]] ; then
		cd $_gitname && git pull origin || return 1
		msg2 "The local files are updated." &&	cd ../
	else
		git clone $_gitroot || return 1
	fi

 	[ -d $_gitname-build ] && rm -r $_gitname-build
	cp $_gitname $_gitname-build -r || return 1

    msg "Patching files..."
    patch $_gitname-build/util/gen < gen.patch
    patch $_gitname-build/menu/menu.py < menu.patch
    patch $_gitname-build/panel/panel.py < panel.patch
    patch $_gitname-build/examples/systemtray/testtrayarea.py < testtrayarea.patch
    patch $_gitname-build/ui/ui.py < ui.patch
    patch $_gitname-build/util/util.py < util.patch
    patch $_gitname-build/xfconf/xfconf.py < xfconf.patch
    patch $_gitname-build/xfconf/tests/testwmconf.py < xfconf-test.patch
    
	cd $_gitname-build
	msg "Starting build..."
	./autogen.sh --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib/ \
	--localstatedir=/var \
	--enable-shared \
	--enable-debug=no \
	--enable-final
	
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}


