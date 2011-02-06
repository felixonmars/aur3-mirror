# Contributor: Darwin Bautista <djclue917@gmail.com>

pkgname=kdeicons-oxygen-svn
pkgver=716090
pkgrel=1
pkgdesc="The KDE 4 icon theme"
arch=('i686' 'x86_64')
url="http://www.oxygen-icons.org/"
license=('LGPL' 'custom:CC by-sa 3.0')
makedepends=('bc' 'imagemagick' 'inkscape' 'subversion')
install=kdeicons-oxygen-svn.install
source=(http://websvn.kde.org/*checkout*/trunk/playground/artwork/Oxygen/utils/index.theme?pathrev=674297 \
        http://websvn.kde.org/*checkout*/trunk/KDE/kdelibs/pics/oxygen/COPYING?pathrev=651879 \
        http://websvn.kde.org/*checkout*/trunk/KDE/kdelibs/pics/oxygen/AUTHORS?pathrev=643003 \
        http://websvn.kde.org/*checkout*/trunk/KDE/kdelibs/pics/oxygen/scalable/devices/dvd-unmount.svg?pathrev=670000 \
        http://websvn.kde.org/*checkout*/trunk/KDE/kdebase/runtime/pics/oxygen/scalable/apps/ark.svgz?pathrev=707333 \
        http://websvn.kde.org/*checkout*/trunk/KDE/kdebase/runtime/pics/oxygen/scalable/apps/konsole.svgz?pathrev=706969 \
        http://websvn.kde.org/*checkout*/trunk/KDE/kdebase/runtime/pics/oxygen/scalable/apps/korganizer.svgz?pathrev=707384 \
        folder_icons.tar.gz \
        missing_icons.tar.gz \
        ICONSLIST \
        rename-icons.py \
        dash2underscore.sh \
        generate_oxy_theme.sh \
        no_huge_action_icons.patch \
        transparent.png)
noextract=(ark.svgz?pathrev=707333 \
           konsole.svgz?pathrev=706969 \
           korganizer.svgz?pathrev=707384)
md5sums=('d17bac734c52d888abc9feab210e5789'
         'f3e5498dea1ce1298cdff5be2c05e6fc'
         '40b9c7d79778553cb690f92778c0d575'
         '02b5a7a17b925e4866e502535ba3426c'
         '51da52df4f3056dc5586466a057f3c78'
         '4326a0f3652a763d2e5f33948acd62b2'
         'c077bd392c95cf8600e4e6149bb1668e'
         '94afaee1146dc8d052dbda1e1b69e32a'
         'aef49dd8526827c361f244fd8ec72342'
         '43ca21c86af99813c32a72e2ba83c128'
         'fe18774687db8d535b52a828688c72b1'
         '151879de99ce802c99e6403bd972a60e'
         '9a21e6174453dd6806b509b73f243078'
         '80f4d70a9804840aa67e16338625c9d3'
         '4ac551652d595240a474c7dc571b8c40')
options=(!emptydirs)


_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/KDE/kdebase/runtime/pics/oxygen
_svnmod=scalable

build() {
  touch ~/.subversion

  # Checkout SVN repository
  msg "Checking out SVN repository..."
  svn co ${_svntrunk}/${_svnmod}@${pkgver} --config-dir ./ -r ${pkgver} ${_svnmod}

  msg "SVN checkout finished or server timed out..."

  cd ${startdir}/src/scalable/

  install -m755 ../{generate_oxy_theme.sh,dash2underscore.sh,rename-icons.py} .
  cp ../ICONSLIST .

  # Remove some inconsistent small versions of icons
  rm apps/small/16x16/{basket,kate,kget,kmail,knotes,konqueror,kwrite}.svgz
  rm apps/small/22x22/{basket,kget,none}.svgz
  rm devices/small/16x16/{computer,drive-harddisk,video-display}.svgz

  # Delete duplicate/obsolete files
  rm -f mimetypes/{,small/{16x16,22x22}/}audio-x-monkey.svgz
  rm -f places/{,small/{16x16,22x22,32x32}/}link.svgz

  rm mimetypes/application-x-ar.svgz
  # c++
  rm -f mimetypes/{,small/{16x16,22x22}/}text-x-adasrc.svgz
  # pdf
  rm -f mimetypes/{,small/{16x16,22x22}/}application-pdf.svgz
  # html
  rm -f mimetypes/{,small/{16x16,22x22}/}{application-{relaxng,x-mswinurl,xhtml+xml,xslt+xml,xml,xsd},text-{mathml,vnd.wap.wml,x-dtd,x-xslfo,xml}}.svgz
  # wordprocessing
  rm -f mimetypes/{,small/{16x16,22x22}/}application-vnd.ms-word.svgz
  # presentation
  rm -f mimetypes/{,small/{16x16,22x22}/}application-vnd.{ms-powerpoint,oasis.opendocument.presentation-template}.svgz
  # spreadsheet
  rm -f mimetypes/{,small/{16x16,22x22}/}application-vnd.ms-excel.svgz
  # video
  rm -f mimetypes/{,small/{16x16,22x22}/}uri-*.svgz
  # news
  rm -f mimetypes/{,small/{16x16,22x22}/}{message-news,text-rdf}.svgz
  # txt
  rm -f mimetypes/{,small/{16x16,22x22}/}text-{css,csv,enriched,sgml,x-patch}.svgz
  # vectorgfx
  rm -f mimetypes/{,small/{16x16,22x22}/}{application-x-tgif,image-svg+xml-compressed}.svgz
  # sound
  rm -f mimetypes/{,small/{16x16,22x22}/}audio-x-wav.svgz

  rm -f mimetypes/{,small/{16x16,22x22}/}none.svgz
  rm mimetypes/odf.svgz

  # Rename icons back to old names
  msg "Renaming icons... Ignore any error below..."
  ./rename-icons.py
  ./dash2underscore.sh

  # Fix after mass rename
  mv actions/viewmag_.svgz actions/viewmag-.svgz

  # Manual move/rename
  mv places filesystems
  mv status/trashcan_full.svgz filesystems/
  mv status/dialog-*.svgz actions/
  mv categories/{package_*,personal}.svgz apps/
  mv emblems/emblem_symbolic_link.svgz filesystems/link.svgz
  mv emblems/small/16x16/emblem_link.svgz filesystems/small/16x16/link.svgz
  mv emblems/small/22x22/emblem_link.svgz filesystems/small/22x22/link.svgz

  # Custom icons
  rm filesystems/folder_{home,tar}.svgz
  mv ${startdir}/src/folder_home.svg filesystems/
  mv ${startdir}/src/folder_tar.svg filesystems/

  # Missing icons
  mv ${startdir}/src/dvd-unmount.svg?pathrev=* devices/dvd_unmount.svg
  mv ${startdir}/src/ark.svgz?pathrev=* apps/ark.svgz
  mv ${startdir}/src/konsole.svgz?pathrev=* apps/konsole.svgz
  mv ${startdir}/src/korganizer.svgz?pathrev=* apps/korganizer.svgz
  mv ${startdir}/src/lockoverlay.svg filesystems/
  mv ${startdir}/src/{colorize,idea,unlock,wizard}.svg actions/
  cp filesystems/folder.svgz filesystems/folder_empty.svgz
  cp mimetypes/font_truetype.svgz mimetypes/font.svgz
  cp actions/contents.svgz actions/help.svgz
  cp actions/rotate_cw.svgz actions/rotate_right.svgz
  cp actions/rotate_ccw.svgz actions/rotate_left.svgz
  cp filesystems/start_here.svgz apps/kmenu.svgz

  # Remove unneeded icons
  rm mimetypes/folder.svgz
  rm mimetypes/application_x_marble.svgz

  # Convert the SVGs to usable PNGs
  ./generate_oxy_theme.sh . ${startdir}/pkg/opt/kde/share/icons/oxygen

  msg "Generating mounted versions of device icons and fixing link overlays"
  for _size in 16 22 32 48 64 128; do
    cd "${startdir}/pkg/opt/kde/share/icons/oxygen/${_size}x${_size}/devices/"

    if [ "${_size}" = "16" ]; then
      _svg=${startdir}/src/scalable/emblems/small/11x11/emblem_mounted.svgz
    elif [ "${_size}" = "22" ]; then
      _svg=${startdir}/src/scalable/emblems/small/16x16/emblem_mounted.svgz
    elif [ "${_size}" = "32" ]; then
      _svg=${startdir}/src/scalable/emblems/small/22x22/emblem_mounted.svgz
    else
      _svg=${startdir}/src/scalable/emblems/emblem_mounted.svgz
    fi

    inkscape --without-gui --export-background-opacity=0 --export-dpi=90 --file=${_svg} --export-png=mounted.png >& /dev/null

    _resize=`echo "${_size}*0.625" | bc`
    _geom=`echo "${_size}*0.429" | bc`

    for _device in `ls *_unmount.png`; do
      composite -filter Sinc -resize "${_resize}x${_resize}" -depth 8 mounted.png -geometry "+${_geom}+${_geom}" ${_device} ${_device%_unmount.png}_mount.png
    done

    rm mounted.png

    cd "${startdir}/pkg/opt/kde/share/icons/oxygen/${_size}x${_size}/filesystems/"
    convert -resize "${_size}x${_size}" -depth 8 ${startdir}/src/transparent.png trans.png
    composite -filter Sinc -resize "${_resize}x${_resize}" -depth 8 link.png -geometry "+${_geom}+${_geom}" trans.png link.png
    rm trans.png
  done

  install -D -m644 ${startdir}/src/index.theme?pathrev=674297 ${startdir}/pkg/opt/kde/share/icons/oxygen/index.theme
  install -m644 ${startdir}/src/AUTHORS?pathrev=643003 ${startdir}/pkg/opt/kde/share/icons/oxygen/AUTHORS
  install -D -m644 ${startdir}/src/COPYING?pathrev=651879 ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
  patch -Np0 -d ${startdir}/pkg/opt/kde/share/icons/oxygen -i ${startdir}/src/no_huge_action_icons.patch
}

# vim:set ts=2 sw=2 et:
