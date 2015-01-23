# Maintainer:  Theodoros Theodoridis <theodoridisgr@gmail.com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: Fergus Symon <fergofrog at fergofrog dot com>

pkgname=razercfg-git
_pkgname=razercfg
pkgver=20150110
pkgrel=1
pkgdesc="Next generation Razer device configuration tool"
arch=('any')
url="http://dual.bues.ch/cms/hacking/razercfg.html"
license=('GPL')
depends=('python2' 'libusb')
makedepends=('git' 'cmake')
optdepends=('python-pyside: for the graphical qrazercfg tool')
backup=('etc/razer.conf')
source=("$_pkgname.desktop"
        'razerd.service'
        'razer.svg::http://upload.wikimedia.org/wikipedia/en/0/00/Razer_Snake_Logo.svg')
md5sums=('1cf8494fc25ae16ddab4cbd4804f507d'
         'fa10feaec06fe57485cef5799c7ac42b'
         'b069094e1fc60ceb37bab31551477a01')
install="$pkgname.install"
         
_gitroot="git://git.bues.ch/razer.git"
_gitname="$_pkgname"

build() {
    cd "${srcdir}"
    msg "Connecting to ${_gitroot} GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin
    else
        echo $_gitroot
        git clone "${_gitroot}" "$_gitname"
    fi
    msg "GIT checkout done"
    cd "$srcdir"
    rm -rf "$srcdir/$_gitname-build"
    git clone "$_gitname" "$_gitname-build"
    msg "Starting make..."
	cd "$srcdir/$_gitname-build"
    find ui -type f -exec sed -i 's/python/&2/' {} +
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "$srcdir/$_gitname-build"
	make DESTDIR="$pkgdir" install
	
	install -Dm 644 "$srcdir/razercfg.desktop" "$pkgdir/usr/share/applications/razercfg.desktop"
	install -Dm 644 "$srcdir/razer.svg" "$pkgdir/usr/share/pixmaps/razer.svg"
    install -Dm 644 "$srcdir/razerd.service" "$pkgdir/usr/lib/systemd/system/razerd.service"
	install -Dm 644 "razer.conf" "$pkgdir/etc/razer.conf"
}
