# Maintainer: Alexey Ignatov <lexszero@gmail.com>

pkgname=tkabber-plugins-all-svn
pkgver=1973
pkgrel=1
pkgdesc="Plugins for a Tkabber Jabber client (official+3rdparty)"
arch=(i686 x86_64)
url="http://tkabber.jabber.ru/"
license=("GPL")
depends=('tkabber-svn')
makedepends=('make')
conflicts=('tkabber-plugins')

_svntrunk=http://svn.xmpp.ru/repos/tkabber/trunk/tkabber-plugins
_svnmod=plugins
_svntrunk_3rdparty=http://svn.xmpp.ru/repos/tkabber-3rd-party/trunk/plugins
_svnmod_3rdparty=3rdparty

# This is my personal choice of plugins, feel free to customize
# Just comment/uncomment things
_plugins=(
##### Official plugins #####
#	plugins/aniemoticons
	plugins/attline
#	plugins/plugins/bc
#	plugins/browser
#	plugins/checkers
#	plugins/chess
	plugins/ctcomp
#	plugins/custom-urls
#	plugins/cyrillize
	plugins/debug
#	plugins/ejabberd
#	plugins/floatingcontact
#	plugins/floatinglog
	plugins/georoster
#	plugins/gmail
#	plugins/iconsets
#	plugins/jidlink
	plugins/latex
#	plugins/mute
#	plugins/openurl
#	plugins/osd
#	plugins/poker
#	plugins/presencecmd
#	plugins/quiz
	plugins/quotelastmsg
	plugins/receipts
#	plugins/renju
#	plugins/reversi
	plugins/singularity
#	plugins/socials
#	plugins/spy
#	plugins/stripes
#	plugins/tclchat
#	plugins/tkabber-khim
#	plugins/traffic
	plugins/unixkeys
	plugins/whiteboard

##### Third-party plugins #####
#	3rdparty/aclosetab
#	3rdparty/alarm
#	3rdparty/antispam
#	3rdparty/autoanswer
#	3rdparty/autosubscribe
#	3rdparty/avatarcache
#	3rdparty/bldjid
#	3rdparty/bldjid2
#	3rdparty/bmucx
#	3rdparty/boldnicks
#	3rdparty/chattoolbar
#	3rdparty/clienticons
#	3rdparty/customstatus
#	3rdparty/emocpixs
#	3rdparty/flip
#	3rdparty/green
	3rdparty/hidemuctopic
#	3rdparty/hidetabs
#	3rdparty/highlightex
#	3rdparty/ibuddy
	3rdparty/juick
#	3rdparty/killerfeature
#	3rdparty/lj_post
#	3rdparty/mouse-on-roster
	3rdparty/nicksanecolors
#	3rdparty/notes
#	3rdparty/now_playing
	3rdparty/openhistory
#	3rdparty/pluginmanager
#	3rdparty/prettymucmenu
#	3rdparty/reminder
#	3rdparty/snoopstatus
#	3rdparty/tabbedcon
	3rdparty/tabimages
#	3rdparty/tastebin
#	3rdparty/themes
#	3rdparty/themes_editor
#	3rdparty/toped
#	3rdparty/transportswitch
	3rdparty/urgent
	3rdparty/urlcmd
#	3rdparty/vimage
#	3rdparty/winup

# This is a little attention test, just comment this line
	i_like_to_install_rootkits
)
build() {
  echo ${_plugins[@]} | grep 'i_like_to_install_rootkits' 2>&1 > /dev/null && {
    error "You are a bad AUR user! Check PKGBUILD carefully before building package"
    return 1
  }

  cd ${srcdir}
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk --config-dir ./ $_svnmod
  fi

  cd ${srcdir}
  if [ -d $_svnmod_3rdparty/.svn ]; then
    (cd $_svnmod_3rdparty && svn up)
  else
    svn co $_svntrunk_3rdparty --config-dir ./ $_svnmod_3rdparty
  fi

  msg "SVN checkout done or server timeout"

  # for the 3rdparty/urgent plugin, we need to compile binary
  echo ${_plugins[@]} | grep '3rdparty/urgent' 2>&1 > /dev/null && {
    echo "Building 3rdparty/urgent binary"
    cd $_svnmod_3rdparty/urgent
    gcc ${CFLAGS} -lX11 urgent.c -o urgent
  }
}

package() {
  msg "Packaging selected plugins"

  mkdir -p ${pkgdir}/usr/share/tkabber-plugins
  cd ${pkgdir}/usr/share/tkabber-plugins

  for x in ${_plugins[@]}; do
    cp -Rv $srcdir/$x ./
  done
}
