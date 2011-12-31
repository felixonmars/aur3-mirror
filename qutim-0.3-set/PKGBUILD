# Maintainer: Eugene aka Koshon <koshon@live.ru>
# Ideological inspiration: Mike Melnikov <make.programs@gmail.com> and Aleksey Ksenzov aka KsenZ <aksenzov@gmail.com>
pkgname=qutim-0.3-set
pkgver=20111231
pkgrel=1
pkgdesc="Multiplatform instant messenger with icq protocol and selected plugins. Unstable version."
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL 2')
depends=('qt>=4.7' 'openssl' 'libxss' 'gnutls' 'zlib' 'libidn' 'qca>=2' 'qca-ossl' 'cyrus-sasl' 'attica'  'sdl' 'aspell' 'hunspell')
makedepends=('gcc' 'make' 'cmake' 'git' 'pkgconfig' 'libpurple')
conflicts=(qutim-0.2.80.00-meta-git qutim-0.3-meta-git, qutim-meta-git)
provides=(qutim-0.2.80.00-meta-git qutim-0.3-meta-git, qutim-meta-git)
replaces=(qutim-0.2.80.00-meta-git qutim-0.3-meta-git, qutim-meta-git)

_gitroot="git://github.com/euroelessar/qutim.git"
_gitname="qutim"

#Build
 
build() {
  LDFLAGS="-Wl,--hash-style=gnu"
  if [ -d $srcdir/$_gitname ]
  then
	msg "Updating local repository."
	cd $srcdir/$_gitname && git pull
  else
	git clone $_gitroot
	cd $_gitname
  fi
	git submodule update --init --recursive
	git submodule foreach --recursive "git pull origin master"
	[ -d build ] || mkdir build
	cd build
	msg "Creating temporary build directory..."
	cp -r $srcdir/$_gitname $srcdir/$_gitname-build
	cd ${srcdir}/${_gitname}-build/build
	msg "Removing temporary unusable plugin..."
        msg "Building..."
	cmake -DJABBER=0 -DSCRIPTAPI=0 -DQSOUNDBACKEND=0 -DUNITYLAUNCHER=0 -DANTIBOSS=0 -DMAEMO5INTEGRATION=0 -DKDEINTEGRATION=0 -DFLOATIES=0 -DHISTMAN=0 -DMASSMESSAGING=0 -DOLDDELEGATE=0 -DLOGGER=0 -DPHONONSOUND=0 -DMOBILITY=0 -DJOINGROUPCHATDLG=0 -DMULTIMEDIABACKEND=0 -DBEARERMANAGER=0 -DNOWPLAYING=0 -DASPELLER=0 -DMEEGOINTEGRATION=0 -DYANDEXNAROD=0 -DQRCICONS=0 -DCONNECTIONMANAGER=0 -DMACINTEGRATION=0 -DAWN=0 -DWEATHER=0 -DIRC=0 -DMRIM=0 -DQUETZAL=0 -DVKONTAKTE=0 -DPHOTOALBUM=0 -DWALL=0 -DVPHOTOALBUM/DEFAULT=0 -DMOBILENOTIFICATIONSSETTINGS=0 -DKOPETEEMOTICONSBACKEND=0 -DQMLCHAT=0 -DKINETICPOPUPS=0 -DSTACKEDCHATFORM=0 -DQUICKCHAT=0 -DMOBILEABOUT=0 -DKINETICSCROLLER=0 -DWEBKITSTYLE/MAEMO=0 -DMOBILECONTACTINFO=0 -DMOBILESETTINGSDIALOG=0 -DSYMBIANINTEGRATION=0 -DSYMBIANCHATFORM=0 -DASTRAL=0 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .. || return 1

#-DPLISTCONFIG=0 -DWININTEGRATION=0 -DMIGRATION02X03=0 -DIMAGEPUB=0 -DNOCRYPTOSERVICE=0 -DDBUSAPI=0 DDBUSNOTIFICATIONS=0 -DANTISPAM=0 -DPLUGMAN=0 -DTRAYICON=0 -DSQLHISTORY=0 -DWEBHISTORY=0 -DAESCRYPTO=0 -DBIRTHDAYREMINDER=0 -DCLCONF=0 -DHUNSPELLER=0 -DADDCONTACTDLG=0 -DAUTHDIALOG=0 -DCONTACTINFO -DSHORTCUTSETTINGS=0 -DXSETTINGSDIALOG=0 -DSIMPLEACTIONBOX=0 -DFILETRANSFER=0 -DSIMPLEROSTERSTORAGE=0 -DFILETRANSFERSETTINGS=0 -DTABBEDCHATFORM=0 -DWEBKITCHAT=0 -DTEXTCHAT=0 -DJSONCONFIG=0 -DPASSWORD=0 -DSERVICECHOOSER=0 -DOLDSOUNDTHEME=0 -DSIMPLEACTIONS=0 -DSEARCHDIALOG=0 -DACCOUNTCREATOR=0 -DSESSIONHELPER=0 -DQTICONS=0 -DSIMPLEABOUT=0 -DPROXYSETTINGS=0 -DSOUNDTHEMESELECTOR=0 -DICONS/HICOLOR=0 -DHUMANITY-ICONS=0 -DCHATSPELLCHECKER=0 -DSIMPLECONTACTLISTWIDGET=0 -DTORYCONTACTLISTWIDGET=0 -DPLAINCONTACTSMODEL=0 -DTREECONTACTSMODEL=0 -DSEPARATEDCONTACTSMODEL=0 -DSIMPLECONTACTLIST=0 -DNOTIFICATIONFILTER=0 -DCHATNOTIFICATIONSBACKEND=0 -DLOCALIZATION=0 -DJOINCHATDIALOG=0 -DEMOTICONSSETTINGS=0 -DIDLESTATUSCHANGER=0 -DNOTIFICATIONSSETTINGS=0 -DSOFTKEYSACTIONBOX=0 -DIDLEDETECTOR=0 -DDATAFORMSBACKEND=0 -DJSONHISTORY=0 -DJOINGROUPCHATDLG=0 -DMETACONTACTS=0 -DXSTATUS=0 -DIDENTIFY=0 -DOSCAR=0 -DUNREADMESSAGESKEEPER=0 -DOLDCONTACTDELEGATE=0 -DURLPREVIEW=0 -DINDICATOR=0 -DEMOEDIT=0 -DWEBKITSTYLE/TORY=0 -DWEBKITSTYLE/GAJIM-LIKE=0 -DWEBKITSTYLE/ALPHA-CLASSIC=0 -DWEBKITSTYLE/DEFAULT=0
#If you do not need a plug-in or, conversely, requires a protocol, just add/remove -DPLUGINNAME=0 in the line above where cmake unsigned comment #. Save the modified PKGBUILD separately so that the next time you rebuild just insert the individual piece.
#Р•СЃР»Рё РІР°Рј РЅРµ РЅСѓР¶РµРЅ РєР°РєРѕР№-С‚Рѕ РїР»Р°РіРёРЅ РёР»Рё, РЅР°РѕР±РѕСЂРѕС‚, РЅРµРѕР±С…РѕРґРёРј РєР°РєРѕР№-С‚Рѕ РїСЂРѕС‚РѕРєРѕР», С‚Рѕ РїСЂРѕСЃС‚Рѕ РґРѕР±Р°РІСЊС‚Рµ/СѓРґР°Р»РёС‚Рµ -DPLUGINNAME=0 РІ СЃС‚СЂРѕС‡РєСѓ РІС‹С€Рµ Р±РµР· Р·РЅР°РєР° РєРѕРјРјРµРЅС‚Р°СЂРёСЏ #. РҐРѕС‚СЏ СЏ РІСЃРµ РїР»Р°РіРёРЅС‹/РїСЂРѕС‚РѕРєР»С‹ РїСЂРѕРїРёСЃР°Р», РЅРѕ РґРѕРїРѕР»РЅРёС‚РµР»СЊРЅРѕ Рѕ РїР»Р°РіРёРЅР°С…/РїСЂРѕС‚РѕРєРѕР»Р°С… РјРѕР¶РЅРѕ РїРѕСЃРјРѕС‚СЂРµС‚СЊ Р·РґРµСЃСЊ: http://wiki.qutim.org/ru/maintainers. РЎРѕС…СЂР°РЅРёС‚Рµ РёР·РјРµРЅРµРЅРЅС‹Р№ PKGBUILD РѕС‚РґРµР»СЊРЅРѕ, С‡С‚РѕР±С‹ РІ СЃР»РµРґСѓСЋС‰РµР№ СЂР°Р· РїСЂРё РїРµСЂРµСЃР±РѕСЂРєРµ РїСЂРѕСЃС‚Рѕ РІСЃС‚Р°РІРёС‚СЊ РёРЅРґРёРІРёРґСѓР°Р»СЊРЅСѓСЋ Р·Р°РіРѕС‚РѕРІРєСѓ.
	
	make -j3 || return 1
	make DESTDIR=${pkgdir} install || return 1

# Add freedesktop compatibility

        install -D -m 664 $srcdir/$_gitname-build/core/share/icons/hicolor/512x512/apps/qutim.png $pkgdir/usr/share/pixmaps/qutim.png || return 1
        install -D -m 664 $srcdir/$_gitname-build/core/share/applications/qutim.desktop $pkgdir/usr/share/applications/qutim.desktop || return 1
	msg "Removing build directory..."
	cd ${srcdir}
	rm -Rf ${_gitname}-build
	msg "Ready ;)..."
}