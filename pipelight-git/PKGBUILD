# Maintainer: Your Name <youremail@domain.com>
pkgname=pipelight-git
pkgver=591.1fc8580
pkgrel=1
pkgdesc="Pipelight is a special browser plugin which allows one to use windows only plugins like silverlight or unity3d inside Linux browsers (tested with wine-compholio-bin instead of wine-silverlight). Netflix, Lovefilm and others are supported."
arch=("i686" "x86_64")
url="https://launchpad.net/pipelight" #Also http://fds-team.de/cms/articles/2013-08/pipelight-using-silverlight-in-linux-browsers.html
license=('GPL')
makedepends=("git" "mingw-w64-gcc") # some mingw that can create 32 bit windows binaries
depends=("wine-compholio" 'ttf-ms-fonts' 'wget' 'cabextract' 'unzip' 'gnupg') #If you want wine-silverlight instead of wine-compholio, change the dependency to wine-silverlight and add --wine-path=/usr/bin/wine to configure
if  [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-libsm' 'lib32-libgl')
else
  depends+=('libsm' 'libgl')
fi
optdepends=('zenity: needed for file dialogs',
            'kdebase-kdialog: needed for file dialogs in KDE')
provides=("silverlight-plugin" "pipelight")
#options=()
install="pipelight.install"
_name=pipelight
source=("$_name::git+https://bitbucket.org/mmueller2012/pipelight.git")
groups=("pipelight-devel")

build() {
        #export CXXFLAGS="$CXXFLAGS -fpermissive" # not needed anymore

	cd "$srcdir/$_name"
	./configure \
        --prefix=/usr \
        --show-installation-dialogs \
        --win32-static

        #--win32-static compiles the mingw libraries right into the pipelight libraries. If you want dynamic linking, use this instead:
        #--gcc-runtime-dlls=/opt/mingw_w32/i686-w64-mingw32/lib \

	make
}

package() {
	cd "$srcdir/$_name"
	make DESTDIR="$pkgdir/" install

        #instead of cluttering the system with untracked files by "unlocking" plugins, create the copies for the library ourselves here:
        cd "$pkgdir/usr/share/pipelight/configs/"
        for i in *
        do
                install "$pkgdir/usr/lib/pipelight/libpipelight.so" "$pkgdir/usr/lib/pipelight/lib$i.so"
        done
}

pkgver() {
  cd "$srcdir/$_name"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

md5sums=('SKIP')
