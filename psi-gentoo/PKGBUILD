# Contributor: Jakub Schmidtke <sjakub-at-gmail.com>

pkgname=psi-gentoo
pkgver=0.10
pkgrel=2
pkgdesc="Gentoo version of Psi - Jabber client"
arch=('i686' 'x86_64')
url="http://packages.gentoo.org/packages/?category=net-im;name=psi"
license=('GPL')
depends=('qca>=1.0-3' 'qt>=3.3' 'qca-tls>=1.0-3' 'gnupg>=1.4.7-1')
# Audacious?
conflicts=('psi' 'psi-svn' 'pedrito')

source=("http://distfiles.gentoo.org/distfiles/psi-0.10.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/gentoo-psi-0.10.tar.bz2" \
        "http://distfiles.gentoo.org/distfiles/gentoo-psi-0.10-r2.tar.bz2" \
        "psi-desktop2.patch" "psi-pathfix2.patch" "psi-reverse_trayicon2.patch" \
        "psi-indicator.png")

md5sums=('f0fd4ccf077f7b24e236f71c22649b7b' '4aacc2de659a5a551e9b47382af83c35'\
         'cc45686ae0cb30061e4a79767597dace' '73fdd72109e3a7469c80d96ed5f5d410'\
         '0dacabdec9ce29cc56faadeeff01ec3b' 'c2528c15be8277434647506d791663d8'\
         '0d5cafd17325fc912c4855252d73378f')

_sdir="$startdir/src/psi-0.10"

build() {
  . /etc/profile.d/qt.sh
  PATH=$QTDIR/bin:$PATH

  cd $_sdir
  patch -p1 < ../psi-pathfix2.patch
  patch -p1 < ../psi-desktop2.patch
  patch -p0 < ../psi-reverse_trayicon2.patch

  # from http://norman.rasmussen.co.za/darcs/psi-muc/
  patch -p1 < ../0.10/psi-muc_support.patch
  patch -p1 < ../0.10/psi-muc_support-update-20051123.patch
  patch -p1 < ../0.10/psi-muc_support-update-20060114.patch

  # roster-nr
  patch -p1 < ../0.10/psi-fix_popup_richtext.patch
  patch -p1 < ../0.10/psi-roster-nr-0.9.14.patch
  patch -p1 < ../0.10/psi-status_indicator++_add-on_roster-nr.patch
  # indicator icon
  cp ../psi-indicator.png iconsets/roster/default/indicator.png

  # from http://www.cs.kuleuven.ac.be/~remko/psi/
  patch -p1 < ../0.10/jep8-avatars_iris.diff
  patch -p1 < ../0.10/jep8-avatars_psi.diff

  # from http://machekku.uaznia.net/jabber/psi/patches/
  patch -p1 < ../0.10/psi-machekku-smart_reply_and_forward-0.5_psi-gentoo.diff
  patch -p2 < ../0.10/psi-machekku-keep_message_in_auto_away_status.diff
  patch -p2 < ../0.10/psi-machekku-quote_emoticons.diff
  patch -p2 < ../0.10/psi-machekku-emoticons_advanced_toggle.diff
  patch -p1 < ../0.10/psi-machekku-linkify_fix.diff
  patch -p1 < ../0.10/psi-machekku-autostatus_while_dnd.diff
  patch -p1 < ../0.10/psi-machekku-visual_styles_manifest.diff
  patch -p2 < ../0.10/psi-machekku-tool_window_minimize_fix_for_windows.diff
  patch -p1 < ../0.10/psi-machekku-new_character_counter.diff

  # from ftp://ftp.patryk.one.pl/pub/psi/skazi/patches/
  patch -p1 < ../0.10/psi-options_resize-fix.diff
  patch -p1 < ../0.10/psi-settoggles-fix.diff
  patch -p1 < ../0.10/psi-line_in_options-mod.diff
  patch -p0 < ../0.10/psi-empty_group-fix.diff
  patch -p1 < ../0.10/psi-no_online_status-mod.diff
  patch -p1 < ../0.10/psi-status_history-add-psi-gentoo.diff
  patch -p1 < ../0.10/psi-icon_buttons_big_return-mod.diff
  patch -p1 < ../0.10/psi-linkify-mod-rev-fix.diff
  patch -p1 < ../0.10/psi-save_profile-mod.diff
  patch -p1 < ../0.10/psi-url_emoticon-mod.diff
  patch -p1 < ../0.10/psi-thin_borders-mod.diff

  # from http://www.uaznia.net/psi-daisy/patches/
  patch -p0 < ../0.10/filetransfer.diff
  patch -p1 < ../0.10/psi-emots-mod.diff
  patch -p1 < ../0.10/psi_michalj_statusicon_in_chatdlg_titlebar.diff
  patch -p1 < ../0.10/psi_michalj_custom_rostericons_in_tooltips.diff

  # from ftp://ftp.patryk.one.pl/pub/psi/patches/
  patch -p1 < ../0.10/psi-psz-chatdlg_typed_msgs_history.diff

  # from http://kg.alternatywa.info/psi/patche/
  patch -p1 < ../0.10/psi-status-timeout-kfix.diff
  patch -p1 < ../0.10/psi-kg-spoof.diff
  patch -p1 < ../0.10/psi-kg-individual_status_add.diff


  # from pld-linux.org
  patch -p1 < ../0.10/psi-certs.patch

  # upstream patches from psi-flyspray
  patch -p1 < ../0.10/psi-fix_groupsortingstyle_toggles.patch
  patch -p1 < ../0.10/psi-multiple_account_groups.diff

  # from http://psi-pedrito.go.pl/
  patch -p1 < ../0.10/pedrito-null-key-string-fix.diff
  patch -p0 < ../0.10/pedrito-avatars-printf-off.diff
  patch -p1 < ../0.10/pedrito-linkify_and_wrap-client.diff
  patch -p1 < ../0.10/pedrito-group_menuitem_for_notinlist.diff

  # from psi-devel mailing list
  patch -p0 < ../0.10/psi-history_lug.patch
  patch -p1 < ../0.10/psi-history-deletion-bugfix.patch
  patch -p1 < ../0.10/checkboxes-sound-options.diff

  # from http://mircea.bardac.net/psi/patches/
  patch -p1 < ../0.10/psi-cli-v2.diff

  # from ubuntu
  patch -p1 < ../0.10/psi-trayicon_ubuntu_fix.patch

  # from http://home.unclassified.de/files/psi/patches/
  patch -p2 < ../0.10/statusdlg-enterkey.diff
  patch -p1 < ../0.10/fix-min-window-notify.diff
  patch -p1 < ../0.10/hide-no-resource-from-contextmenu.diff
  patch -p1 < ../0.10/custom-sound-popup.patch
  patch -p1 < ../0.10/offline-contact-animation.diff
  patch -p1 < ../0.10/

  # from bugs.gentoo.org
  patch -p1 < ../0.10/psi-add-status-history.patch

  # from http://rydz.homedns.org
  patch -p2 < ../0.10/psi-filetransfer-finish-popup-qsorix.patch

  # from http://k.uaznia.net/jabber/psi/patches/  
  patch -p1 < ../0.10/a-psi-k-emergency_away_status_button.diff
  patch -p1 < ../0.10/psi-evil_message_support.patch
  patch -p1 < ../0.10/psi-auto_responder.patch
  patch -p1 < ../0.10/psi-auto_responder_gui.patch

  # from http://www.cs.kuleuven.ac.be/~remko/psi/
  patch -p1 < ../0.10/rosteritems_iris.diff
  # this one was chagned because of muc support
  patch -p1 < ../0.10/rosteritems_psi_with_muc.diff

  # from http://delx.cjb.net/psi/
  patch -p1 < ../0.10/psi-nicknames.patch

  # from http://norman.rasmussen.co.za/darcs/psi-rc/
  patch -p0 < ../0.10/norman-rc.diff
  patch -p1 < ../0.10/norman-darcs-20051129.diff

  # from http://machekku.uaznia.net/jabber/psi/patches/
  patch -p1 < ../0.10/psi-machekku-rc_multiline_status_fix.diff

  # from http://norman.rasmussen.co.za/darcs/psi-rc/  
  patch -p1 < ../0.10/psi-dynamic-priority-rc-fix.diff
  patch -p1 < ../0.10/norman-darcs-20051231.patch

  # created for psi-gentoo and roster-nr
  patch -p1 < ../0.10/psi-smile_icon_emoticonset.patch
  patch -p1 < ../0.10/psi-enable_avatars.patch
  patch -p1 < ../0.10/psi-transport_icons_and_avatars.patch
  patch -p1 < ../0.10/psi-client_avatars_icons.patch
  patch -p1 < ../0.10/psi-emoticons_advanced_toggle-add-roster-nr.patch
  patch -p1 < ../0.10/psi-chatdlg_messages_colors_distinguishes.patch
  patch -p1 < ../0.10/psi-messages_color_backgrounds_in_chat.patch
  patch -p1 < ../0.10/psi-sort-style-on-roster-nr.patch
  patch -p1 < ../0.10/psi-says_mod.patch
  patch -p1 < ../0.10/psi-muc_support_langpacks_fix.patch
  patch -p1 < ../0.10/psi-copy_jid_or_status_message_to_clipboard.patch
  patch -p1 < ../0.10/psi-timestamps_option_and_date_showing.patch
  patch -p1 < ../0.10/psi-avatars_graph_settings_filetypes.patch
  patch -p1 < ../0.10/psi-auto_responder_by_message.patch
  patch -p1 < ../0.10/psi-taskbar_flashing.patch


  # by nelchael
  patch -p1 < ../0.10/psi-nelchael-exec_command.patch
  patch -p1 < ../0.10/psi-nelchael-disconnect-sleep.patch

  # Audacious?
  #patch -p1 < ../0.10/psi-nelchael-audacious-status-0.3.patch

  patch -p1 < ../0.10/psi-gentoo-version.patch

  ./configure --prefix=/usr --disable-growl

  # fixes weird Gentoo bugs : #150187 and #154556
  cd $_sdir/libpsi/psiwidgets
  ${QTDIR}/bin/qmake psiwidgets.pro \
      QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
      QMAKE=${QTDIR}/bin/qmake \
      QMAKE_RPATH= \
      || die "Qmake failed"

  # for CXXFLAGS from make.conf
  cd $_sdir/src
  ${QTDIR}/bin/qmake src.pro \
      QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
      QMAKE=${QTDIR}/bin/qmake \
      QMAKE_RPATH= \
      || die "Qmake failed"

  cd $_sdir
  ${QTDIR}/bin/qmake psi.pro \
      QMAKE_CXXFLAGS_RELEASE="${CXXFLAGS}" \
      QMAKE=${QTDIR}/bin/qmake \
      MAKE_RPATH= \
      || die "Qmake failed"

  make || return 1

  make INSTALL_ROOT=$startdir/pkg install
}
