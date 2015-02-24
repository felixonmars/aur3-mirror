# Contributor: Zhuoyi Xu <xzy476386434@vip.qq.com>
pkgname=razorqt-lde
pkgver=1.0.0
pkgrel=1
pkgdesc="The LDE Desktop Environment Bundling of Razor-qt"
url="http://razor-qt.org"
arch=('i686' 'x86_64')
license="GPL2"
depends=('qt4' 'polkit-qt' 'udev' 'libxrender' 'libxcomposite' 'libxdamage' 'zlib' 'file' 'libxcursor' 'libstatgrab')
optdepends=('lde: a lightweight, powerful desktop environment'
            'udisks: For the Removable Media plugin to work'
            )
makedepends=('git' 'cmake')
provides=('razorqt-lde')
conflicts=('razorqt-lde')
source=("git://github.com/xuzhuoyi/razorqt-lde.git")
md5sums=('SKIP')

_gitname="razorqt-lde"


pkgver() {
    cd "$srcdir/$_gitname"

    echo "$(LANG=C date '+%Y%m%d')_$(git describe --tags --always | sed 's/-/_/g')"
}


build() {
  cd "$srcdir/$_gitname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DQT_QMAKE_EXECUTABLE=qmake-qt4 \
        -DENABLE_LIGHTDM_GREETER=OFF \
        -DMODULE_LIGHTDM=OFF \
        -DBUNDLE_XDG_UTILS=NO \
        -DLIB_SUFFIX= \
        .
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
