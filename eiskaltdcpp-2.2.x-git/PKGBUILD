# Contributor: nixtrian <nixtrian@gmail.com>

_name=eiskaltdcpp
pkgbase=$_name-2.2.x-git
pkgname=$_name-2.2.x-git
#true && pkgname=("eiskaltdcpp-gtk-2.2.x-git" "eiskaltdcpp-qt-2.2.x-git" "eiskaltdcpp-cli-2.2.x-git" "eiskaltdcpp-daemon-2.2.x-git" "eiskaltdcpp-core-2.2.x-git" "eiskaltdcpp-data-2.2.x-git" )
pkgname="eiskaltdcpp-cli-2.2.x-git"
pkgver=20120121
pkgrel=1
license=('GPL3')
arch=('i686' 'x86_64')
url="http://code.google.com/p/eiskaltdc/"
conflicts=('eiskaltdcpp' 'eiskaltdcpp-git')
options=(!emptydirs)
_gitroot="git://github.com/negativ/eiskaltdcpp.git"
_gitname=$_name
_branch="2.2.x"
makedepends=('perl-data-dump' 'perl-term-shellui' 'perl-json-rpc-legacy')

build() {
        cd $srcdir
        if [ -d $_gitname ]; then
            cd $_gitname && git pull origin
            msg "The local files are updated."
        else
            git clone --depth=1 $_gitroot $_gitname --branch=$_branch
        fi
        msg "GIT checkout done or server timeout"
        msg "Starting make..."
        rm -rf $srcdir/build
        mkdir $srcdir/build
        cd $srcdir/build
        cmake ../$_gitname -DENABLE_STACKTRACE=ON -DCMAKE_INSTALL_PREFIX=/usr -DUSE_MINIUPNP=ON -DLOCAL_MINIUPNP=ON -DPERL_REGEX=ON -DLOCAL_BOOST=ON -DLUA_SCRIPT=ON -DWITH_LUASCRIPTS=ON -DWITH_DHT=ON -DUSE_QT=OFF
        #make
}

#package_eiskaltdcpp-2.2.x-git() {
    #depends=('qt' 'gtk2' 'libnotify' 'lua' 'libidn' 'pcre' 'bzip2')
    #optdepends=('aspell: spellchecking'
                #'qtscriptgenerator: need for qtscript'
                #'php: needed for some optionаl scripts')
    #pkgdesc="DC and ADC client based on dcpp core"
    #install=$_name.install
    #cd $srcdir/build
    #cmake ../$_gitname  -DUSE_JS=ON -DUSE_QT=ON -DUSE_GTK=ON -DNO_UI_DAEMON=ON
    #make DESTDIR=$pkgdir install
#}

package_eiskaltdcpp-gtk-2.2.x-git() {
    depends=('gtk2' 'libnotify' 'desktop-file-utils' 'eiskaltdcpp-core-2.2.x-git' 'eiskaltdcpp-data-2.2.x-git')
    pkgdesc="EiskaltDC++: Gtk2-based DC and ADC client based on dcpp core"
    conflicts=('eiskaltdcpp-gtk' 'eiskaltdcpp')
    provides=('eiskaltdcpp-gtk')
    install=$_name.install
    cd $srcdir/build
    cmake ../$_gitname -DUSE_GTK=ON
    make -C cmake
    make -C eiskaltdcpp-gtk DESTDIR=$pkgdir install

}
package_eiskaltdcpp-qt-2.2.x-git() {
    depends=('qt' 'eiskaltdcpp-core-2.2.x-git' 'eiskaltdcpp-data-2.2.x-git')
    optdepends=('aspell: spellchecking'
                'qtscriptgenerator: need for qtscript')
    pkgdesc="EiskaltDC++: Qt4-based DC and ADC client based on dcpp core"
    conflicts=('eiskaltdcpp-qt' 'eiskaltdcpp')
    provides=('eiskaltdcpp-qt')
    install=$_name.install
    cd $srcdir/build
    cmake ../$_gitname  -DUSE_JS=ON -DUSE_QT=ON
    make translations_qt
    make -C eiskaltdcpp-qt DESTDIR=$pkgdir install
}

package_eiskaltdcpp-cli-2.2.x-git() {
    depends=('perl-data-dump' 'perl-term-shellui' 'perl-json-rpc<=0.96' 'eiskaltdcpp-daemon-2.2.x-git' 'eiskaltdcpp-data-2.2.x-git' )
    pkgdesc="EiskaltDC++ cli interface for daemon with xmlrpc"
    cd $srcdir/build
    cmake ../$_gitname -DUSE_CLI_JSONRPC=ON
    make -C eiskaltdcpp-cli DESTDIR=$pkgdir install clean
}
package_eiskaltdcpp-daemon-2.2.x-git() {
    depends=('eiskaltdcpp-core-2.2.x-git' 'eiskaltdcpp-data-2.2.x-git' 'gcc-libs')
    pkgdesc="EiskaltDC++ Daemon"
    conflicts=('eiskaltdcpp-daemon' 'eiskaltdcpp')
    provides=('eiskaltdcpp-daemon')
    cd $srcdir/build
    cmake ../$_gitname -DNO_UI_DAEMON=ON -DJSONRPC_DAEMON=ON
    make -C eiskaltdcpp-daemon DESTDIR=$pkgdir install
}

package_eiskaltdcpp-core-2.2.x-git() {
    depends=('bzip2' 'openssl' 'lua' 'libidn' 'pcre')
    pkgdesc="EiskaltDC++ Core"
    conflicts=('eiskaltdcpp-core' 'eiskaltdcpp')
    provides=('eiskaltdcpp-core')
    cd $srcdir/build
    make -C cmake
    make -C dcpp DESTDIR=$pkgdir install
}

package_eiskaltdcpp-data-2.2.x-git() {
    arch=('any')
    depends=('sh' 'bash' 'hicolor-icon-theme')
    optdepends=('php: needed for some optionаl scripts')
    conflicts=('eiskaltdcpp-data' 'eiskaltdcpp')
    provides=('eiskaltdcpp-data')
    install=$_name.install
    pkgdesc="EiskaltDC++ Data files"
    cd $srcdir/build
    make -C data DESTDIR=$pkgdir install
}
pkgdesc="DC and ADC client based on dcpp core (2.2.x branch) (current development branch)"
depends=('qt' 'libnotify' 'bzip2' 'pcre' 'lua' 'libidn' 'gtk2')
