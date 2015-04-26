# Maintainer: Jordan Johnston <triplesquarednine@gmail.com>
# Contributor: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=wine-l-pa
pkgver=1.7.41
pkgrel=1

_pkgbasever=${pkgver/rc/-rc}

source=(http://prdownloads.sourceforge.net/wine/wine-$_pkgbasever.tar.bz2{,.sign}
        wine-rt.install
        add-implementation-setProcessWorkingSetSize.patch
        0012-ntdll-Use-pipes-for-synchronization-objects.patch
        00_override_pthreads_to_fix_gstreamer.patch
        NI-drag-and-drop.patch
        0050-pipe-check-and-thread-safe-read.patch
        set-realtime-priority-without-wineserver.patch
        Expand-dos-has-entropy-in-order-to-make-collision-le.patch
        fix-obscured-windows.patch
        disable-winedbg-auto-crash-dialog.patch
        Fix-disk-geometry-ioctl.patch
        menu-border-color.patch
        If-a-child-of-the-window-being-disabled-is-the-captu.patch
        hack-for-Ivory-Library-Installer-force-GENERIC_xxx.patch
        disable-wine-prefix-update-window.patch
        capitalize-users-directory.patch
        ntdll-Fix-name-validation-for-pipes-bug-28995.patch
        L-defeat-dialog-box.patch
        0001-mmdevapi-Prevent-race-condition-upon-Start.patch
        0007-mciseq-Prevent-busy-wait-while-pausing.patch
        0008-mciseq-Pause-causes-an-ABORT-notification.patch
        0009-mciseq-Make-sure-MCI_WAIT-waits-for-the-player-to-t.patch
        0010-mciseq-Limit-concurrency-when-starting-to-play.patch
        0012-mciseq-Play-returns-the-error-code-from-midiOutOpen.patch
        0020-mciseq-Check-stop-condition-after-sleeping.patch
        0021-mciseq-Remain-responsive-while-processing-large-del.patch
        0023-mciseq-MCI_PLAY-does-not-reset-the-tempo-to-default.patch
        0024-mciseq-Read-the-tempo-from-the-file-when-opening-it.patch
        0025-mciseq-MCI-tempo-is-expressed-in-beats-per-minute.patch
        0003-ntdll-Add-DTrace-probes-for-heap-functions.patch
        0004-ntdll-Add-DTrace-probes-for-critical-section-functio.patch
        0005-ntdll-Provide-handle-to-trap-deadlocks-from-debugger.patch
        0006-Fix-the-order-that-we-enable-an-application-window.patch
        0014-Fix-bug-linking-sync-object-into-linked-list.patch
        0003-Exit-expand-function-early-if-there-are-no-children.patch
        kernel32-tests-Verify-the-stability-of-CreateTimerQueue.patch
        winegcc-Add-Multiarch-Specifiers.patch
        msvcp100-Sign-compare-warnings-fix.patch
        kernel32_path.patch
        wine-rt-101107.patch
        ableton_file-read-write-diff.patch
        kuser_shared_data-RT.patch
        64bits_return_Zero.patch
        0001-kernel32-Fix-MoveFile-where-source-dest-are-equal.patch
        kernel32-handle_FindFirstFileEx_better.patch
        winegcc-force_pointer_size.patch
        msi_actions_hack.patch
        setidealcpu_wine.patch
        0001-ntdll-Implement-NtQuerySystemInformation-class-0x37.patch
        0002-kernel32-Implement-GetNumaHighestNodeNumber.patch
        shush_DnDhelper.patch
        0B-msi_check_return_value_of_ITypeLib_GetLibAttr.patch
        et_exception_handler_mode.patch
        0000-revert_increase_mmdevapi_buffer_sizes_this_is_linux_not_mac.patch
        immReleaseContext.patch
        update_embedded_window.patch
        shush_gdi_noHDC.patch
        shL.patch
        0016-muse-volume-work-around.patch
        0044-get-windows-label-from-registry.patch
        0049-override-serial-number-from-environment.patch
        0056-allow-WINEDLLPATH-override.patch
        winemenubuilder-silence-an-err.patch
        valgrind-prevent-crash-hack.patch
        ntdll_heap_alloc_stalls.patch
        improve-allocation-performance.patch
        more_prios.patch
        avrtcrit.patch
        Optimize_Dlls.patch
        advapi_silent_delayShutdown.patch
        cxExclude_children-wait.patch
        threadLSPointer.patch
        winex11_Enable_disable_windows_unmap_foreign.patch
        wineX11drv_revert_177_XEmbed_changes_NO_vst_flicker.patch
        user32-menuC_Reason5Menu.patch
        # git://github.com/sjurajpuchky/cuda-wine-wrapper
        fix_GetThreadTimes_for_all_threads.patch
        99cuda.patch
        stdint.patch
        wine-gcc49.patch
        ntdll-Use_lockfree_implementation_for_get_cached_fd.patch
        Set_ldr-EntryPoint_for_main_executable.patch
)

md5sums=('c6bc2faa48eab6d7c7fc4a47976e9021'
         'SKIP'
         'b2e3ba93933f64bd98a3aa8ec64ffcfd'
         '817b81193419ca4b417c8c8f06729b76'
         '5b6c8900267af49a297bf022400f303c'
         '7c6734f301124d66c4454af79a8465f6'
         '66ece12c7a746a3ea01f7aca39e98a2a'
         '60b749b08cb95bf0c4ad16c46227f35e'
         'ad6ac39aacc518256823fbf9dc625acf'
         'c29dd4f1cdda2d4175d07a68e29eb5e7'
         'd93b6a752caac30c2e497eef2f8b0bf9'
         '460cceb5b38d027ef9d914917cbb086b'
         'b8d955070a784ec29ed90c00af75453a'
         '572837f5d756809401e1a60178295a3d'
         '8ddfdea34ce5edd9e1afa13d37d223da'
         '1d8e0e45cbe0d4f705fe7b638f7bcd66'
         'bc9c5755c350a8afdaa296bd8cc52d7c'
         '6b03015993ddc36ffe95cfb9298a4b57'
         '1ac12284717594a1683c1d91c0ee41af'
         'b6091c250b2399dc577cc1436db40d86'
         'd00c0864d11edfaa2b609282fa12d801'
         '8a70f7773d9364239939650d28575a0a'
         '1236ec750718c2f89c950462f59c1c25'
         'd352e531848ec9123714977b50192a30'
         'cac7a4c02cc526f7df6ec4e241859197'
         'a1e72dbe31e7eb212b140fca71b1e064'
         '1507c571f155202db95b89105c24c542'
         '5833bcab85a06e2d947105095d9d50b9'
         '9850a793cf670d2fc1b419a397c9193f'
         'ede42fe52def0c1c926291df9f3f2c05'
         '71caa3a934735d4f68e28d8ee04a9d37'
         'd2901fbbfdec1038eed2e95898868a92'
         '44b1e90c2f5f65400d517c23243cad46'
         '0792a8ceb7ca98038cf93e8ca11c8a98'
         '8e1e41f2175cc83f98cc0af21b743a1c'
         '7e050a0ac3e6a0e2dd258f6040ddbb74'
         'b90f574e25258f20735c8d31eb94052e'
         '66d0dc4f9f988f53d31dccb52d3a1f82'
         'c2f518f2350f27e0765e354c65af7f04'
         'b104f8fd1d3f3f10787c988afe020550'
         '737d70ea89cecdf5d24ce490be4d9200'
         '068edd6554bb4a5711aec7c303e8947b'
         '265e6770852e7ce075d0ac8ed4813d07'
         'bbe18d09b9912a7ac9ed0dd102d951da'
         'ad812d5dfa3ca313f17087df203e7cb6'
         '75aaf97c4b8903796f6e2eef950cf900'
         'ebe3a5f6ec81925f903e3bcbbca635f3'
         '6ca7900b3a87186fcf8ff24a30e47723'
         'e59d18f8afab13f7536322f4d3a601be'
         'a5b8d7fd515e528e618958e66b66d6df'
         '51869218f8dfd59f19da4aee7007117f'
         'e4706b443e2d4c0c9c6f2c58719499c3'
         '278df05b91a33070bcb8695222c543c9'
         'bec79adce3598e4ac3226b01f040d6ed'
         'c057fb56d489657def6497eadafee7e2'
         'b669b581214f2a3d6e33e108c54b28e0'
         'e24564e8a7d169780422fb7f98552129'
         'f2d7b890592eaabdc4c211d2c095c973'
         '8e1f5c244312c5314079c80f0de00b85'
         '33bef628f15f0527cd6dcaa1fdb383bf'
         'bb7b9eae5a5fcfc1c35882677022b2cf'
         '6bed7098b7cd8ab0ed2cee91a75250ee'
         '5453c3c7460219c0e5b369dc71b4f94a'
         '3c125ce474c93a44155167c8d00e4157'
         'f1e80e572bb48563994e5d9ca488807e'
         'fcfd83a0ecb10489299d01d9e32f9d8a'
         '7f123e2d784f073fd8c26bd18d55b4e5'
         'eb4eb42c1420c45b386a267091a1c48e'
         '4bc859fc2194c6d1cec35cb056e5085d'
         'a0d63fa731760e28e4402788f90a4c67'
         'ba6896b86ebfc9153aa366346b208bbb'
         '92e78dae6fea343481ce4102b8b589f8'
         '993a342dea11af6ddc23569f2c29ed47'
         'faa5b22d1a58ea4a67400d1dadba3704'
         '3415f621478dba0e0ef1bf1d694fb897'
         '8a7aea6115aee90ccefc5a6894c4ef02'
         'a113d55a1e13ea9928b05b6e33c9a63d'
         '507f9a5818ee03252d43816abd3e7a26'
         '449e06442eac51c4993ddfb98708e1eb'
         '5c072659a8da6d1d7245641bd39b8dbd'
         'ef8b7ba352f86ed3e3621989f7865710'
         'ea63c5c9c226260c93551b89003fa899'
         'e391591c95f043ea6f1b9bf411073d70')


validpgpkeys=('5AC1A08B03BD7A313E0A955AF5E6E9EEB9461DD7')

pkgdesc="Wine-L_pa: Wine geared for Proaudio"
url="https://sourceforge.net/projects/l-proaudio/"
arch=(i686 x86_64)
options=(staticlibs)
license=(LGPL)
install=wine-rt.install

depends=(
  fontconfig      lib32-fontconfig
  mesa            lib32-mesa 
  libxcursor      lib32-libxcursor
  libxrandr       lib32-libxrandr
  libxdamage      lib32-libxdamage
  libxi           lib32-libxi
  gettext         lib32-gettext
  desktop-file-utils
)

makedepends=(autoconf ncurses bison perl fontforge flex prelink
  'gcc>=4.5.0-2'  'gcc-multilib>=4.5.0-2'
  giflib          lib32-giflib
  libpng          lib32-libpng
  gnutls          lib32-gnutls
  glu             lib32-glu
  libxinerama     lib32-libxinerama
  libxcomposite   lib32-libxcomposite
  libxmu          lib32-libxmu
  libxxf86vm      lib32-libxxf86vm
  libxml2         lib32-libxml2
  libldap         lib32-libldap
  lcms2           lib32-lcms2
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  alsa-lib        lib32-alsa-lib
)
  
optdepends=(
  giflib          lib32-giflib
  libpng          lib32-libpng
  libldap         lib32-libldap
  gnutls          lib32-gnutls
  lcms2           lib32-lcms2
  libxml2         lib32-libxml2
  mpg123          lib32-mpg123
  openal          lib32-openal
  v4l-utils       lib32-v4l-utils
  libpulse        lib32-libpulse
  alsa-plugins    lib32-alsa-plugins
  alsa-lib        lib32-alsa-lib
  libpulse        lib32-libpulse  
)

if [[ $CARCH == i686 ]]; then
  provides=("wine=$pkgver")
  conflicts=('wine wine-rt')
  replaces=('wine wine-rt')

  # Strip lib32 etc. on i686
  depends=(${depends[@]/*32-*/})
  makedepends=(${makedepends[@]/*32-*/})
  makedepends=(${makedepends[@]/*-multilib*/})
  optdepends=(${optdepends[@]/*32-*/})
else
  provides=("wine=$pkgver" "bin32-wine=$pkgver" "wine-wow64=$pkgver")
  conflicts=('wine' 'bin32-wine' 'wine-wow64')
  replaces=('wine' 'bin32-wine')
fi

build() {
  if [ -f "$srcdir//wine-$pkgver/README.WINE-RT" ]
  then
    rm  "$srcdir//wine-$pkgver/README.WINE-RT"
  fi

  cd "$srcdir/wine-$_pkgbasever"

  msg2 "Applying Wine-l-pa patchwork" 

  # Lightweight Implementation of CUDA [nVidia] for Wine 
  #
###
#
#  msg "Moving Cuda-Wine-Wrapper dll Sources into Wine Source code/tree"  
#
#  mv "$srcdir/cuda-wine-wrapper/dlls/cudart" "$srcdir/wine-$pkgver/dlls"
#  mv "$srcdir/cuda-wine-wrapper/dlls/cufft" "$srcdir/wine-$pkgver/dlls"
#
#  msg "Applying Cuda-Wine-Wrapper patch + Fix cudart/cufft.dll.so x86_64 linkage for Archlinux [ /opt/cuda/lib64 ]"
#  patch -s -Np1 -i $srcdir/99cuda.patch
#  msg2 "         SUCCESS :)"

#############################################################################
#
# L_Pa-Wine sync_pipe and L_RT_THREADS patchwork
#
# You absolutely need these patches for L_Pa-Wine to actually be useful ;)
#

  msg "Applying 0012-ntdll-Use-pipes-for-synchronization.patch"
  patch -s -Np1 -i $srcdir/0012-ntdll-Use-pipes-for-synchronization-objects.patch
  msg2 "         SUCCESS :)"

  msg "Applying set-realtime-priority-without-wineserver.patch"
  patch -s -Np1 -i $srcdir/set-realtime-priority-without-wineserver.patch
  msg2 "         SUCCESS :)"

  msg "Applying 0050-pipe-thread-safe.patch"
  patch -s -Np1 -i $srcdir/0050-pipe-check-and-thread-safe-read.patch
  msg2 "         SUCCESS :)"

  msg "Applying disable-wine-prefix-update-window.patch"
  patch -s -Np1 -i $srcdir/disable-wine-prefix-update-window.patch
  msg2 "         SUCCESS :)"

  msg "Applying L-defeat-dialog-box.patch"
  patch -s -Np1 -i $srcdir/L-defeat-dialog-box.patch
  msg2 "         SUCCESS :)"

#############################################################################
#
# Hacks / Workarounds / one-offs 
#
 
  msg "Applying NI-drag-drop patch"
  patch -s -Np1 -i $srcdir/NI-drag-and-drop.patch
  msg2 "         SUCCESS :)"

  msg "Applying expand-dos-has-entropy-to-make-less-collision.patch"
  patch -s -Np1 -i $srcdir/Expand-dos-has-entropy-in-order-to-make-collision-le.patch
  msg2 "         SUCCESS :)"

  msg "Applying fix-obscured-windows.patch"
  patch -s -Np1 -i $srcdir/fix-obscured-windows.patch
  msg2 "         SUCCESS :)"
 
  msg "Applying disable-winedbg-auto-crash-dialog.patch"
  patch -s -Np1 -i $srcdir/disable-winedbg-auto-crash-dialog.patch
  msg2 "         SUCCESS :)"

  msg "Applying Fix disk geomtery.ioctl"
  patch -s -Np1 -i $srcdir/Fix-disk-geometry-ioctl.patch
  msg "        SUCCESS :)"

  msg "Applying menu-border-color.patch"
  patch -s -Np1 -i $srcdir/menu-border-color.patch
  msg2 "         SUCCESS :)"

  msg "Applying child-window-is-capture-give-WM_CANCELMODE.patch"
  patch -s -Np1 -i $srcdir/If-a-child-of-the-window-being-disabled-is-the-captu.patch
  msg2 "         SUCCESS :)"

#  msg "Applying capitalize-users-directory.patch"
#  patch -s -Np1 -i $srcdir/capitalize-users-directory.patch
#  msg2 "         SUCCESS :)"

  msg "Applying hack-for-Ivory-Library-Installer-force-GENERIC_xxx.patch"
  patch -s -Np1 -i $srcdir/hack-for-Ivory-Library-Installer-force-GENERIC_xxx.patch
  msg "        SUCCESS :)"

#  msg "Applying kernel32-tests-Verify-the-stability-of-CreateTimerQueue.patch"
#  patch -s -Np1 -i $srcdir/kernel32-tests-Verify-the-stability-of-CreateTimerQueue.patch
#  msg2 "         SUCCESS :)"

  msg "Applying kernel32_path.patch"
  patch -s -Np1 -i $srcdir/kernel32_path.patch
  msg2 "         SUCCESS :)"

  msg "Applying ntdll-Fix-name-validation-for-pipes-bug-28995.patch"
  patch -s -Np1 -i $srcdir/ntdll-Fix-name-validation-for-pipes-bug-28995.patch
  msg2 "         SUCCESS :)"

  msg "Applying 0006-Fix-the-order-that-we-enable-an-application-window.patch"
  patch -s -Np1 -i $srcdir/0006-Fix-the-order-that-we-enable-an-application-window.patch
  msg2 "         SUCCESS :)"

  msg "Applying 0003-Exit-expand-function-early-if-there-are-no-children.patch"
  patch -s -Np1 -i $srcdir/0003-Exit-expand-function-early-if-there-are-no-children.patch
  msg2 "         SUCCESS :)"

#  msg "Applying kuser_shared_data-RT.patch"
#  patch -s -Np1 -i $srcdir/kuser_shared_data-RT.patch
#  msg2 "         SUCCESS :)"

#############################################################################
#
# Sound / Midi patches
# 

#  msg "Applying 0001-mmdevapi-Prevent-race-condition-upon-Start.patch"
#  patch -s -Np1 -i $srcdir/0001-mmdevapi-Prevent-race-condition-upon-Start.patch
#  msg2 "         SUCCESS :)"

  msg "Applying 0007-mciseq-Prevent-busy-wait-while-pausing.patch"
  patch -s -Np1 -i $srcdir/0007-mciseq-Prevent-busy-wait-while-pausing.patch
  msg2 "         SUCCESS :)"

  msg "Applying 0008-mciseq-Pause-causes-an-ABORT-notification.patch"
  patch -s -Np1 -i $srcdir/0008-mciseq-Pause-causes-an-ABORT-notification.patch
  msg2 "         SUCCESS :)"

  msg "Applying 0009-mciseq-Make-sure-MCI_WAIT-waits-for-the-player-to-t.patch"
  patch -s -Np1 -i $srcdir/0009-mciseq-Make-sure-MCI_WAIT-waits-for-the-player-to-t.patch
  msg2 "         SUCCESS :)"

  msg "Applying 0010-mciseq-Limit-concurrency-when-starting-to-play.patch patch"
  patch -s -Np1 -i $srcdir/0010-mciseq-Limit-concurrency-when-starting-to-play.patch
  msg2 "         SUCCESS :)"

#  msg "Applying 0012-mciseq-Play-returns-the-error-code-from-midiOutOpen.patch"
#  patch -s -Np1 -i $srcdir/0012-mciseq-Play-returns-the-error-code-from-midiOutOpen.patch
#  msg2 "        SUCCESS :)"

  msg "Applying 0020-mciseq-Check-stop-condition-after-sleeping.patch"
  patch -s -Np1 -i $srcdir/0020-mciseq-Check-stop-condition-after-sleeping.patch
  msg2 "        SUCCESS :)"

  msg "Applying 0021-mciseq-Remain-responsive-while-processing-large-del.patch"
  patch -s -Np1 -i $srcdir/0021-mciseq-Remain-responsive-while-processing-large-del.patch
  msg2 "         SUCCESS :)"

  msg "Applying 0023-mciseq-MCI_PLAY-does-not-reset-the-tempo-to-default.patch"
  patch -s -Np1 -i $srcdir/0023-mciseq-MCI_PLAY-does-not-reset-the-tempo-to-default.patch
  msg2 "         SUCCESS :)"

  msg "Applying 0024-mciseq-Read-the-tempo-from-the-file-when-opening-it.patch"
  patch -s -Np1 -i $srcdir/0024-mciseq-Read-the-tempo-from-the-file-when-opening-it.patch
  msg2 "         SUCCESS :)"

  msg "Applying 0025-mciseq-MCI-tempo-is-expressed-in-beats-per-minute.patch"
  patch -s -Np1 -i $srcdir/0025-mciseq-MCI-tempo-is-expressed-in-beats-per-minute.patch
  msg2 "         SUCCESS :)"

#############################################################################
#
# Wine-rt
#

  msg "Applying Wine-rt patch"
  patch -s -Np1 -i $srcdir/wine-rt-101107.patch
  msg2 "         SUCCESS :)"

#############################################################################
#
# more one offs / hacks / workarounds 
#

  msg "Applying 0001-kernel32-Fix-MoveFile-where-source-dest-are-equal.patch"
  patch -s -Np1 -i $srcdir/0001-kernel32-Fix-MoveFile-where-source-dest-are-equal.patch
  msg2 "         SUCCESS :)"

#  msg "Applying 64bits_return_Zero.patch"
#  patch -s -Np1 -i $srcdir/64bits_return_Zero.patch
#  msg2 "         SUCCESS :)"

#  msg "Applying kernel32-handle_FindFirstFileEx_better.patch"
#  patch -s -Np1 -i $srcdir/kernel32-handle_FindFirstFileEx_better.patch
#  msg2 "         SUCCESS :)"

  msg "Applying ableton_file-read-write-diff.patch"
  patch -s -Np1 -i $srcdir/ableton_file-read-write-diff.patch
  msg2 "         SUCCESS :)"

#  msg "Applying winegcc-force_pointer_size.patch"
#  patch -s -Np1 -i $srcdir/winegcc-force_pointer_size.patch
#  msg2 "         SUCCESS :)"

  msg "add-implementation-setProcessWorkingSetSize.patch"
  patch -s -Np1 -i $srcdir/add-implementation-setProcessWorkingSetSize.patch
  msg2 "         SUCCESS :)"

#  msg "Applying setidealcpu_wine.patch"
#  patch -s -Np1 -i $srcdir/setidealcpu_wine.patch
#  msg2 "         SUCCESS :)"

#  msg "Applying 0001-ntdll-Implement-NtQuerySystemInformation-class-0x37.patch"
#  patch -s -Np1 -i $srcdir/0001-ntdll-Implement-NtQuerySystemInformation-class-0x37.patch
#  msg2 "         SUCCESS :)"

  msg "Applying shush_DnDhelper.patch"
  patch -s -Np1 -i $srcdir/shush_DnDhelper.patch
  msg2 "         SUCCESS :)"

  msg "Applying 0B-msi_check_return_value_of_ITypeLib_GetLibAttr.patch"
  patch -s -Np1 -i $srcdir/0B-msi_check_return_value_of_ITypeLib_GetLibAttr.patch
  msg2 "         SUCCESS :)"

  msg "Applying 00_override_pthreads_to_fix_gstreamer.patch"
  patch -s -Np1 -i $srcdir/00_override_pthreads_to_fix_gstreamer.patch
  msg2 "         SUCCESS :)"

#  msg "Applying 0000-revert_increase_mmdevapi_buffer_sizes_this_is_linux_not_mac.patch"
#  patch -s -Np1 -i $srcdir/0000-revert_increase_mmdevapi_buffer_sizes_this_is_linux_not_mac.patch
#  msg2 "         SUCCESS :)"

#  msg "Applying immReleaseContext.patch"
#  patch -s -Np1 -i $srcdir/immReleaseContext.patch
#  msg2 "         SUCCESS :)"

  msg "Applying more_prios.patch"
  patch -s -Np1 -i $srcdir/more_prios.patch
  msg2 "         SUCCESS :)"

  msg "Applying avrtcrit.patch"
  patch -s -Np1 -i $srcdir/avrtcrit.patch
  msg2 "         SUCCESS :)"

#  msg "Applying valgrind-prevent-crash-hack.patch"
#  patch -s -Np1 -i $srcdir/valgrind-prevent-crash-hack.patch
#  msg2 "         SUCCESS :)"

  msg "Applying winemenubuilder-silence-an-err.patch"
  patch -s -Np1 -i $srcdir/winemenubuilder-silence-an-err.patch
  msg2 "         SUCCESS :)"

  msg "Applying threadLSPointer.patch"
  patch -s -Np1 -i $srcdir/threadLSPointer.patch
  msg2 "         SUCCESS :)"

#  msg "Applying cxExclude_children-wait.patch"
#  patch -s -Np1 -i $srcdir/cxExclude_children-wait.patch
#  msg2 "         SUCCESS :)"

  msg "Applying improve-allocation-performance.patch"
  patch -s -Np1 -i $srcdir/improve-allocation-performance.patch
  msg2 "         SUCCESS :)"

#  msg "Applying Optimize_Dlls.patch"
#  patch -s -Np1 -i $srcdir/Optimize_Dlls.patch
#  msg2 "         SUCCESS :)"

  msg "Applying shush_gdi_noHDC.patch"
  patch -s -Np1 -i $srcdir/shush_gdi_noHDC.patch
  msg2 "         SUCCESS :)"

#  msg "Applying shL.patch"
#  patch -s -Np1 -i $srcdir/shL.patch
#  msg2 "         SUCCESS :)"

  msg "Applying advapi_silent_delayShutdown.patch"
  patch -s -Np1 -i $srcdir/advapi_silent_delayShutdown.patch
  msg2 "         SUCCESS :)"

  msg "Applying update_embedded_window.patch"
  patch -s -Np1 -i $srcdir/update_embedded_window.patch
  msg2 "         SUCCESS :)"

#  msg "Reverting wineX11drv_revert_177_XEmbed_changes_NO_vst_flicker.patch"
#  patch -s -Np1 -i $srcdir/wineX11drv_revert_177_XEmbed_changes_NO_vst_flicker.patch
#  msg2 "         SUCCESS :)"

  msg "Applying user32-menuC_Reason5Menu.patch"
  patch -s -Np1 -i $srcdir/user32-menuC_Reason5Menu.patch
  msg2 "         SUCCESS :)"

  msg "Applying stdint.patch"
  patch -s -Np1 -i $srcdir/stdint.patch
  msg2 "         SUCCESS :)"

  msg "Applying wine-gcc49.patch"
  patch -s -Np1 -i $srcdir/wine-gcc49.patch
  msg2 "         SUCCESS :)"

#  msg "Applying ntdll-Use_lockfree_implementation_for_get_cached_fd.patch"
#  patch -s -Np1 -i $srcdir/ntdll-Use_lockfree_implementation_for_get_cached_fd.patch
#  msg2 "         SUCCESS :)"

  msg "Applying msi_actions_hack.patch"
  patch -s -Np1 -i $srcdir/msi_actions_hack.patch
  msg "         SUCCESS :)

_____________________________________________________________

(IF) ALL PATCHES APPLIED SUCCESSFULLY ....

        ....   L_Pa-WINE IS READY (FOR COMPILATION)
______________________________________________________________
"
  sleep 3

  cd "$srcdir"

  # Allow ccache to work
  mv wine-1.7.41 wine

  # ncurses fix
  sed -i 's|libncurses|libncursesw|g' "$srcdir/wine/configure"
  sed -i 's|lncurses|lncursesw|g' "$srcdir/wine/configure"

  # Get rid of old build dirs
  rm -rf wine-{32,64}-build
  mkdir wine-32-build

  if [[ $CARCH == x86_64 ]]; then
    msg2 "Building Wine-64..."

    mkdir wine-64-build
    cd "$srcdir/wine-64-build"

    ../wine/configure \
      --prefix=/usr \
      --without-opencl \
      --without-mpg123 \
      --disable-tests \
      --libdir=/usr/lib \
      --with-pulse \
      --enable-win64 

    make CFLAGS+="-O2 -march=native -mtune=native" CXXFLAGS+="-O2 -march=native -mtune=native"

    _wine32opts=(
      --libdir=/usr/lib32
      --with-wine64="$srcdir/wine-64-build"
    )

    export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  fi

  # Fix cudart/cufft.dll.so x86 [32bit] linkage for Archlinux [ /opt/cuda/lib ]
  #
### Ideally, this will be fixed in configuration scripts for wine. this is just a hack.
#
#  cd ".."
#
#  cd "wine"
#
#  sed -i 's#/opt/cuda/lib64#/opt/cuda/lib#' "${srcdir}/wine/dlls/cudart/Makefile.in"
#  sed -i 's#/opt/cuda/lib64#/opt/cuda/lib#' "${srcdir}/wine/dlls/cufft/Makefile.in"

  msg2 "Building Wine-32..."
  cd "$srcdir/wine-32-build"

  ../wine/configure \
    --prefix=/usr \
    --disable-tests \
    --without-opencl \
    --without-mpg123 \
    --with-pulse \
    "${_wine32opts[@]}"

  # These additional CFLAGS solve FS#27560
    make CFLAGS+="-mincoming-stack-boundary=2 -march=native -mtune=native -O2 -pipe" CXXFLAGS+="-mincoming-stack-boundary=2 -O2 -march=native -mtune=native "
}

package() {
  msg2 "Packaging Wine-32..."
  cd "$srcdir/wine-32-build"

  if [[ $CARCH == i686 ]]; then
    make prefix="$pkgdir/usr" install
  else
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib32" \
      dlldir="$pkgdir/usr/lib32/wine" install

    msg2 "Packaging Wine-64..."
    cd "$srcdir/wine-64-build"
    make prefix="$pkgdir/usr" \
      libdir="$pkgdir/usr/lib" \
      dlldir="$pkgdir/usr/lib/wine" install
  fi

  mkdir -p "$pkgdir/usr/share/doc/wine-rt"
  cp "$srcdir/wine/README.WINE-RT" "$pkgdir/usr/share/doc/wine-rt"
}

# vim:set ts=8 sts=2 sw=2 et:
