# Maintainer: Aleksey Ksenzov aka KsenZ <aksenzov@gmail.com>
pkgname=qutim-0.2_ru-git
pkgver=20110110
pkgrel=1
pkgdesc="Multiplatform instant messenger - Core, icq, jabber, Russian language and some plugins. GIT version"
arch=('i686' 'x86_64')
url="http://qutim.org/forum/viewtopic.php?f=20&t=1772"
license=('GPL')
depends=('qt' 'openssl' 'libxss' 'wget' 'gnutls' 'zlib')
makedepends=('gcc' 'make' 'cmake' 'git' 'pkgconfig')
conflicts=('qutim' 'qutim-svn-dev' 'qutim-archangel' 'qutim-svn' 'qutim-git')
provides=('qutim' 'qutim-svn-dev' 'qutim-archangel' 'qutim-svn')
replaces=('qutim-svn-dev' 'qutim-archangel')

_gitroot_core="git://gitorious.org/qutim/qutim.git"
_gitname_core="qutim"
_gitroot_protocols="git://gitorious.org/qutim/protocols.git"
_gitname_protocols="protocols"
_gitname_icq="protocols/oscar"
_gitname_jabber="protocols/jabber"
_gitroot_plugins="git://gitorious.org/qutim/plugins.git"
_gitname_plugins="plugins"
_gitname_sqlhistory="plugins/sqlhistory"
_gitname_yandexnarod="plugins/yandexnarod"
_gitroot_ru="git://gitorious.org/qutim/translations.git"
_gitname_ru="translations"
_smiles="Kolobok_Big_series"
#_picon="protocolicon-0.1.1"
#_trayconf="trayconf"

build() {
#build core from git
    if [ -d $srcdir/$_gitname_core ]
	then
	    msg "Updating local repository for core..."
	    cd $_gitname_core
	    git pull origin sdk02 || return 1
	    if [ -d $srcdir/$_gitname_core/$_gitname_protocols ]
		then
		    msg "Updating local repository for protocols..."
		    cd $srcdir/$_gitname_core/$_gitname_protocols
		    git pull origin sdk02 || return 1
		else
		    cd $srcdir/$_gitname_core
		    git clone $_gitroot_protocols
		    cd $_gitname_protocols
		    git checkout origin/sdk02
	    fi
	    if [ -d $srcdir/$_gitname_core/$_gitname_plugins ]
		then
		    msg "Updating local repository for plugins..."
		    cd $srcdir/$_gitname_core/$_gitname_plugins
		    git pull origin sdk02 || return 1
		else
		    cd $srcdir/$_gitname_core
		    git clone $_gitroot_plugins
		    cd $_gitname_plugins
		    git checkout origin/sdk02
	    fi
	    msg "The local files are updated."
	else
	    git clone $_gitroot_core
	    cd $srcdir/$_gitname_core
	    git checkout origin/sdk02
	    git clone $_gitroot_protocols
	    cd $srcdir/$_gitname_core/$_gitname_protocols
	    git checkout origin/sdk02
	    cd $srcdir/$_gitname_core
	    git clone $_gitroot_plugins
	    cd $srcdir/$_gitname_core/$_gitname_plugins
	    git checkout origin/sdk02
    fi
    msg "git checkout done or server timeout"
    msg "Creating temporary build directory..."

#Core
    msg "Building and installing core..."
    cd $srcdir/$_gitname_core
    mkdir build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
    make DESTDIR=${pkgdir} install || return 1
    cd $srcdir
    rm -Rf $_gitname_core/build

#icq protocol
    msg "Building and installing icq protocol..."
    mkdir $srcdir/$_gitname_core/$_gitname_icq/build
    cd $srcdir/$_gitname_core/$_gitname_icq/build
    qmake .. || return 1
    make || return 1
    install -Dm 644 liboscar.so $pkgdir/usr/lib/qutim/liboscar.so || return 1
    cd $srcdir
    rm -Rf $_gitname_core/$_gitname_icq/build

#jabber protocol
    msg "Build and installing jabber protocol..."
    mkdir $srcdir/$_gitname_core/$_gitname_jabber/build
    cd $srcdir/$_gitname_core/$_gitname_jabber/build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DGNUTLS=1 -DOpenSSL=1 -DZLib=1 || return 1
    make DESTDIR=${pkgdir} install || return 1
    install -Dm 644 $srcdir/$_gitname_core/$_gitname_jabber/include/qutim/jabber.h  ${pkgdir}/usr/include/qutim/jabber.h
    cd $srcdir
    rm -Rf $_gitname_core/$_gitname_jabber/build

#sqlhistory plugin
    msg "Build and installing sqlhistory plugin..."
    mkdir $srcdir/$_gitname_core/$_gitname_sqlhistory/build
    cd $srcdir/$_gitname_core/$_gitname_sqlhistory/build
    qmake .. || return 1
    make || return 1
    install -Dm 644 libsqlhistory.so $pkgdir/usr/lib/qutim/libsqlhistory.so || return 1
    cd $srcdir
    rm -Rf $_gitname_core/$_gitname_sqlhistory/build

#yandexnarod plugin
    msg "Build and installing sqlhistory plugin..."
    mkdir $srcdir/$_gitname_core/$_gitname_yandexnarod/build
    cd $srcdir/$_gitname_core/$_gitname_yandexnarod/build
    qmake .. || return 1
    make || return 1
    install -Dm 644 libyandexnarod.so $pkgdir/usr/lib/qutim/libyandexnarod.so || return 1
    cd $srcdir
    rm -Rf $_gitname_core/$_gitname_yandexnarod/build

#protocolicon plugin
#    msg "Build and installing protocolicon plugin..."
#    cd $srcdir
#    wget -c http://www.qutim.org/uploads/src/plugins/${_picon}.tar.bz2
#    tar -xjf ${_picon}.tar.bz2
#    mv $_picon $srcdir/$_gitname_core/$_gitname_plugins/protocolicon
#    cd $srcdir/$_gitname_core/$_gitname_plugins/protocolicon
#    mkdir build
#    cd build
#    qmake .. || return 1
#    make || return 1
#    install -Dm 644 ../libprotocolicon.so $pkgdir/usr/lib/qutim/libprotocolicon.so || return 1
#    rm -Rf $srcdir/$_gitname_core/$_gitname_plugins/protocolicon

#trayconf plugin
#    msg "Build and installing trayconf plugin..."
#    cd $srcdir
#    wget -c http://deltaz.org/sites/default/files/${_trayconf}-0.1.zip
#    unzip -q ${_trayconf}-0.1.zip
#    mv $_trayconf $srcdir/$_gitname_core/$_gitname_plugins/trayconf
#    cd $srcdir/$_gitname_core/$_gitname_plugins/trayconf
#    patch -Np0 -i $srcdir/trayconf-path.patch
#    mkdir build
#    cd build
#    qmake .. || return 1
#    make || return 1
#    install -Dm 644 libtrayconf.so $pkgdir/usr/lib/qutim/libtrayconf.so || return 1
#    cd $srcdir
#    rm -Rf $srcdir/$_gitname_core/$_gitname_plugins/trayconf

#build rus translation from git
    msg "Git checkout for translations"
    if [ -d $srcdir/$_gitname_ru ]
	then
	    msg "Updating local repository for translations..."
	    cd $srcdir/$_gitname_ru
	    git pull origin sdk02 || return 1
	    msg "The local files are updated."
	else
	    cd $srcdir
	    git clone $_gitroot_ru
	    cd $_gitname_ru
	    git checkout origin/sdk02
    fi

    msg "Git checkout done or server timeout"
    msg "Building and installing translations..."
    
    cd $srcdir/$_gitname_ru
    ./make.sh compile ru_RU
    install -Dm 644 ru_RU/binaries/core.qm $pkgdir/usr/share/qutim/languages/ru_RU/core.qm
    install -Dm 644 ru_RU/binaries/icq.qm $pkgdir/usr/share/qutim/languages/ru_RU/icq.qm
    install -Dm 644 ru_RU/binaries/jabber.qm $pkgdir/usr/share/qutim/languages/ru_RU/jabber.qm
    install -Dm 644 ru_RU/binaries/sqlhistory.qm $pkgdir/usr/share/qutim/languages/ru_RU/sqlhistory.qm
    install -Dm 644 ru_RU/binaries/yandexnarod.qm $pkgdir/usr/share/qutim/languages/ru_RU/yandexnarod.qm
#    install -Dm 644 ru_RU/binaries/protocolicon.qm $pkgdir/usr/share/qutim/languages/ru_RU/protocolicon.qm

    ./make.sh clean
    
#QIP Infium smile pack standart
    msg "Install QIP Infium standart smile pack"
    mkdir $srcdir/$_smiles
    cd $srcdir/$_smiles
    wget -c http://www.kolobok.us/content_files/downloads/messengers/qutim/kolobok_big_for_qutim.zip
    unzip -j kolobok_big_for_qutim.zip
    rm -Rf kolobok_big_for_qutim.zip
    install -d $pkgdir/usr/share/qutim/emoticons/$_smiles
    install -Dm 644 $srcdir/$_smiles/* $pkgdir/usr/share/qutim/emoticons/$_smiles
    install -d $pkgdir/usr/share/licenses/$_smiles
    install -Dm 644 $srcdir/$_smiles/Copyright* $pkgdir/usr/share/licenses/$_smiles

    rm -Rf $_smiles

}