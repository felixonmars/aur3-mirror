#Contributors:
# Calimero <calimeroteknik@free.fr>
# ericb <ericb@openoffice.org>
# Coolgeek <coolman_789 at hotmail dot com>
# Gyo <gyo_at_archlinux_dot_fr>

# WARNING : this compile needs 13GB of free disk space !

# Set of langs                                                                  
_langs=(ar de es fi fr it nb nl sl pt uk zh-CN zh-TW da el ru)

# Generate pkgname with _langs
_pkgname=()
for _l in ${_langs[*]}; do
  _pkgname=(${_pkgname[*]} "ooo4kids-${_l}")
done

# r874 == v 1.0
# r964 == v 1.1
# r1205 == v 1.2
#_revision=1205
pkgver=1236
pkgrel=1
arch=('i686' 'x86_64')
url="http://ooo4kids.org/"
license=('LGPL3')

_my_svnmod="trunk"
_my_svntrunk="svn://svn.adullact.net/svnroot/ooo4kids1"

if [ ! -n "$_revision" ]; then
	_svnmod=$_my_svnmod
	_svntrunk=$_my_svntrunk
fi
_application_name=OOo4Kids
_project_short=ooo4kids12
_projectname="ooo4kids"
_projectver="1.2"
_project="${_projectname}${_projectver}"

build() {
 cd ${srcdir}

 msg "Downloading from svn repository..."
 if [ -n "$_revision" ]; then
   svn co -r $_revision --no-auth-cache ${_my_svntrunk}/${_my_svnmod}
 else
   svn co --no-auth-cache ${_my_svntrunk}/${_my_svnmod}
 fi
 msg "SVN checkout done or server timeout"

 msg "Starting make..."
 cd ${_my_svnmod}


 ./configure --prefix=/usr --exec-prefix=/usr\
             --without-fonts\
             --disable-odk\
             --with-system-lucene=no\
             --with-system-saxon=no\
             --with-lang="${_langs[*]}"\
             --enable-dbus\
             --with-dict=ALL\
             --enable-opengl\
             --disable-vba\
             --disable-mozilla\
             --with-system-stdlibs\
             --with-system-libs\
             --with-alloc=system\
	     --with-system-jars=no\
             --with-system-python\
             --with-system-libxml\
             --enable-cups\
             --disable-gnome-vfs\
             --with-${_application_name}\
             --disable-gtk\
             --with-package-format=native\
             --enable-presenter-console\
             --with-system-jpeg\
             --with-system-vigra\
             --with-system-hunspell\
             --with-system-lpsolve\
             --enable-presenter-extra-ui\
             --with-package-format=installed\
	     --without-stlport\
	     --with-system-zlib\
	     --with-system-boost\
	     --with-system-sane-header\
	     --enable-xrender-link\
	     --with-system-agg\
	     --with-system-redland\
	     --with-system-db\
	     --with-system-mythes\
	     --with-system-libwpd=no\
	     --with-system-icu

 
 # Setup environment for build
 if [ "$CARCH" = "x86_64" ]; then
  source LinuxX86-64Env.Set.sh
 else
  source LinuxX86Env.Set.sh
 fi

 # Build
  ./bootstrap ||return 1


 ## exploit all the processors
 # automatic config : load each processor with 2 objects at a time
 export CUSTOM_DMAKE="$(_init=1;for _i in `grep -o processor /proc/cpuinfo`;do if [ "$_init" == "1" ];then echo -n '-P2';_init=0;else echo -n ' -- -P2';fi;done;echo)" 

 # manual config example :
 #export CUSTOM_DMAKE="-P5 -- -P5" #for 2 parallel threads loading each core with 5 objects at a time : on a dual core with a lot of ram.

 cd ${srcdir}/${_my_svnmod}/instsetoo_native
 perl $SOLARENV/bin/build.pl --all ${CUSTOM_DMAKE} || return 1
}

package_ooo4kids-base() {
 pkgdesc="OpenOffice lightened, relooked for kids"
 install=('ooo4kids.install')
 provides=('ooo4kids')
 conflicts=('ooo4kids')

 cd ${srcdir}/${_my_svnmod}/instsetoo_native/util
 mkdir -p ${pkgdir}/usr/lib
 LOCALINSTALLDIR=${pkgdir}/usr/lib dmake openoffice_en-US PKGFORMAT=installed

 ## This is a /opt/-style installation, correcting ##

 # Replace symlinks with real folders
 # Step 1
 cd ${pkgdir}/usr/lib
 mv ${_project} ${_projectname}
 cd ${pkgdir}/usr/lib/${_projectname} || return 1
 mv ure basis${_projectver}/ || return 1
 cd basis${_projectver} || return 1
 rm ure-link && mv ure ure-link || return 1
 # Step 2
 cd ${pkgdir}/usr/lib/${_projectname}/ || return 1
 rm basis-link && mv basis${_projectver} basis-link || return 1

 cd ${pkgdir}/usr/lib/${_projectname} || return 1

 # .desktop files
 _destdir=${pkgdir}/usr/lib/${_projectname}/share
 mkdir -p ${_destdir}/icons/hicolor
 cd ${_destdir}/xdg

 # fix exec commands and icon names
 sed -i -e "s|Exec=/usr/bin/${_project}-printeradmin|Exec=/usr/bin/spadmin|g" printeradmin.desktop || return 1
 sed -i -e "s|${_project} -writer %U|${_projectname} -writer|g" writer.desktop || return 1
 sed -i -e "s|${_project} -calc %U|${_projectname} -calc|g" calc.desktop || return 1
 sed -i -e "s|${_project} -draw %U|${_projectname} -draw|g" draw.desktop || return 1
 sed -i -e "s|${_project} -impress %U|${_projectname} -impress|g" impress.desktop || return 1
 sed -i -e "s|${_project} -math %U|${_projectname} -math|g" math.desktop || return 1
 sed -i -e "s|${_project}-printeradmin|${_projectname}-printeradmin|g" printeradmin.desktop || return 1
 sed -i -e "s|${_project} %U|${_projectname}|g" ${_projectname}.desktop || return 1
 sed -i -e "s|Icon=${_project_short}|Icon=${_project}|g" *.desktop || return 1

 # remove quickstarter, we disabled it above
 rm -f qstart.desktop

 # add _project to the name of *.desktop (avoiding OOo conflicts)
 for _aFile in $(ls) ; do
  mv ${_aFile} ${_projectname}-${_aFile}
 done

 cd ${_destdir}
 mkdir -p ${pkgdir}/usr/share/applications
 mv ${_destdir}/xdg/*.desktop ${pkgdir}/usr/share/applications

 # install icons
 mkdir -p ${pkgdir}/usr/share/icons

 for _icon in $(cd ${srcdir}/${_my_svnmod}/sysui/desktop/icons/hicolor; find ??x?? -name "*.png")
  do
  # only paths containing our app name are useful
  if test "x${_icon}" != "x${_icon/${_application_name}}" ; then
   # create the target dir
   _targetdir=${pkgdir}/usr/share/icons/hicolor/$(dirname ${_icon/${_application_name}})
   mkdir -p ${_targetdir}
   # copy the icon
   _destfile=${_targetdir}/${_project:-}${_project:+-}$(basename ${_icon})
   cp ${srcdir}/${_my_svnmod}/sysui/desktop/icons/hicolor/${_icon} $_destfile
   chmod 0644 $_destfile
  fi
 done

 # make symlinks
 mkdir -p  ${pkgdir}/usr/bin
 cd ${pkgdir}/usr/bin
 ln -sf ../lib/${_projectname}/program/soffice ${_projectname}
 ln -sf ../lib/${_projectname}/program/spadmin ${_projectname}-printeradmin

 # fix home config path s|~/.config/.appname|~/.config/appname|
 sed -i 's|$SYSUSERCONFIG/.|$SYSUSERCONFIG/|' ${pkgdir}/usr/lib/${_projectname}/program/bootstraprc || return 1

 # remove logs
 rm -rf ${pkgdir}/usr/log

 # Fix permissions
 chmod -R 755 ${pkgdir}/usr/lib
}

for _lang in ${_langs[*]};do
 eval 'package_'${_projectname}'-'"$_lang"'() {
   depends=("'${_projectname}'-base")
   pkgdesc=("'"$_lang"' language pack for '${_projectname}'")
   provides=("'${_projectname}'-'"$_lang"'")
   conflicts=("'${_projectname}'-'"$_lang"'")

   cd ${srcdir}/${_my_svnmod}/instsetoo_native/util
   mkdir -p ${pkgdir}/usr/lib
   LOCALINSTALLDIR=${pkgdir}/usr/lib dmake ooolanguagepack_'"$_lang"' PKGFORMAT=installed || return 1

   # Adapt path
   mv ${pkgdir}/usr/lib/'${_project}' ${pkgdir}/usr/lib/'${_projectname}'
   cd ${pkgdir}/usr/lib/'${_projectname}' && mv basis'${_projectver}' basis-link

   # Fix permissions
   chmod -R 755 ${pkgdir}/usr/lib
 }'
done

pkgbase=ooo4kids-svn
pkgname=ooo4kids-svn
pkgdesc="OpenOffice lightened, relooked for kids"
provides=('ooo4kids')
conflicts=('ooo4kids')

# Hack to upload it on AUR
(( 42 )) && pkgname=('ooo4kids-base' ${_pkgname[*]})

depends=('pango' 'hunspell' 'python2' 'libxaw' 'libjpeg' 'dbus-glib' 'libxslt' 'lpsolve' 'libgraphite' 'hyphen' 'mesa' 'agg' 'redland' 'icu')

makedepends=('libcups' 'libmythes' 'vigra' 'gstreamer0.10-base' 'subversion' 'gconf' 'gperf' 'boost' 'pkg-config' 'perl-archive-zip' 'zip' 'unzip' 'curl' 'sane' 'agg')
optdepends=( 'sane:             for scanner access'
	     'libcups:          adds printing support' 
	     'libmythes:        for use in thesaurus'
	     'vigra:            C++ computer vision library, usable in Basebmp'
	     'gstreamer0.10-base: + some gstr-plugins to support multimedia content, e.g. in impress'
	     )