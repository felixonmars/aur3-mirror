# Contributor: Borislav Gerassimov (slimmer) <borislavba (at) gmail.com>
pkgname=qutim
pkgver=0.2.0
pkgrel=8
pkgdesc="Free open-source multiprotocol (ICQ, Jabber/GTalk/Ya.Online, LiveJournal.com, Mail.Ru, IRC) instant messenger"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
depends=('qt' 'libxss' 'openssl' 'libidn' 'gnutls') 
makedepends=('gcc' 'make' 'cmake' 'pkgconfig')
conflicts=('qutim' 'qutim-icq' 'qutim-svn-archangel' 'qutim-plugin-yandexnarod')
provides=('qutim-plugin-yandexnarod')
source=(http://repository.slacky.eu/slackware-13.0/network/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a0cf5b7bc1a8fd9e0a6a712d6f1b98e7')

# Remove the plugins you don't need in the next line. Keep them separated with spaces.
# Available plugins: histman icq irc jabber mrim plugman vkontakte yandexnarod
_plugins="histman icq irc jabber mrim plugman vkontakte yandexnarod"

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  msg2 "Building core..."
  sed "s/TARGET_LINK_LIBRARIES (qutim/TARGET_LINK_LIBRARIES (qutim\nX11/" -i CMakeLists.txt
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release || return 1
  make DESTDIR=${pkgdir} install || return 1

  for plug in ${_plugins}
  do
    msg2 "Building ${plug} plugin"
    cd ${srcdir}/${pkgname}-${pkgver}/plugins/${plug}
    case ${plug} in
      jabber)
	cmake . -DGNUTLS=1 -DZLib=1 -DCMAKE_INSTALL_PREFIX=/usr \
		-DQUTIM_INCLUDE_DIRS=${srcdir}/${pkgname}-${pkgver}/include || return 1 ;
	make DESTDIR=${pkgdir} install || return 1 ;;
      mrim|plugman)
        cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1 ;
        make || return 1 ;
        install -Dm 644 lib${plug}.so "${pkgdir}/usr/lib/${pkgname}/lib${plug}.so" || return 1 ;;
      histman|irc|vkontakte|yandexnarod)
	echo "INSTALLS += target" >> ${plug}.pro || return 1;
	echo "unix:target.path += /usr/lib/qutim" >> ${plug}.pro || return 1 ;
        qmake || return 1 ;
        make INSTALL_ROOT=${pkgdir} install || return 1 ;;
      icq)
        qmake || return 1 ;
        make INSTALL_ROOT=${pkgdir} install || return 1 ;;
    esac
  done
}
