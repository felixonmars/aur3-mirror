# Maintainer: Xinkai <yeled.nova@gmail.com>
pkgdesc="An attempt to bring Xware (Xunlei on routers) to desktop Linux."
url="https://github.com/Xinkai/XwareDesktop/wiki"

_commit="d5542c899c4a785db18d290af6dd748a077bb508"
_md5sums="1be2cd645f35efa842dc37a5a7789a02"
pkgver="20140604"
pkgrel=1

pkgname="xware_desktop-git"
arch=("i686" "x86_64")
conflicts=("xware_desktop")
license=("GPL" "custom")

makedepends=("python-pyqt5" "coffee-script" "chrpath" "findutils" "sed")
if test "$CARCH" == x86_64; then
    makedepends+=("gcc-multilib")
else
    makedepends+=("gcc")
fi

depends=("python-pyqt5" "qt5-webkit" "qt5-multimedia" "libcap" "python-requests" "python-pyinotify" "desktop-file-utils")
if test "$CARCH" == x86_64; then
    depends+=("lib32-glibc" "lib32-zlib")
else
    depends+=("glibc" "zlib")
fi

if [ ! -f .localdev ]; then
    source=("${_commit}.tar.gz::https://github.com/Xinkai/XwareDesktop/archive/${_commit}.tar.gz")
    md5sums=(${_md5sums})
    _nonlocal=1
fi

install=xware_desktop.install

build() {
    if test $_nonlocal; then
        cd XwareDesktop-${_commit}
    else
        cd ../
    fi
    make all
}

package() {
    if test $_nonlocal; then
        cd XwareDesktop-${_commit}
    else
        cd ../
    fi
    make DESTDIR=${pkgdir} install
    install -D -m 644 build/xwared.service ${pkgdir}/usr/lib/systemd/system/xwared.service
    echo -e "\n__githash__ = \"${_commit}\"\n" >> ${pkgdir}/opt/xware_desktop/frontend/__init__.py
}
